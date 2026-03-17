--[[ Biamp Tesira Controller - Runtime
  Manages an SSH connection to a Biamp Tesira server (port 22).

  Connection flow (SSH handles all encryption and authentication automatically):
    1. SSH:Connect(ip, 22, username, password)
    2. SSH.Connected fires on successful login
    3. Send: SESSION set verbose true
    4. Receive: +OK  ->  State = "ready", notify child plugins, drain queue

  Command routing (one command in-flight at a time):
    - Child plugins publish to: tesira.<SystemId>.command
      Format: "replyToken|TTP command string"
    - Controller sends FIFO and publishes responses to:
      tesira.<SystemId>.response.<replyToken>

  Subscription routing:
    - Child plugins register via: tesira.<SystemId>.subscribe
      Format: "publishToken|TTP subscribe command"
    - Tesira push messages (! "publishToken":"..." "value":...)
      are published on: tesira.<SystemId>.push.<publishToken>
    - All subscriptions are stored and resubmitted on reconnect and
      every 30 seconds to survive Tesira reboots / config pushes.

  Connected broadcast:
    - tesira.<SystemId>.connected  published when session is fully ready,
      so child plugins know to refresh values and reregister subscriptions.

  Credentials (Biamp Tesira defaults):
    - Username: "default"
    - Password: ""  (empty on unprotected systems)
    - Must be logged in as 'controller' level or higher to set values;
      'observer' level can only query.
]]

--------------------
-- Variables -------
--------------------
SystemId          = ""
State             = "disconnected"  -- disconnected | initializing | ready
RxBuffer          = ""
CommandQueue      = {}              -- FIFO: { cmd, replyToken }
CurrentReplyToken = nil
IsProcessing      = false
Subscriptions     = {}              -- publishToken -> subscribeCmd (for resubscription)
NotificationIds   = {}              -- Notification IDs to clean up on reinit
-- End Variables ---

--------------------
-- Functions -------
--------------------

function UpdateStatus()
  if State == "disconnected" then
    Controls["Status"].Value = 5
    Controls["ConnectionState"].String = "Disconnected"
  elseif State == "initializing" then
    Controls["Status"].Value = 2    -- yellow / initializing
    Controls["ConnectionState"].String = "Logging in..."
  elseif State == "ready" then
    Controls["Status"].Value = 0    -- green / OK
    Controls["ConnectionState"].String = "Ready  [" .. Controls["IPAddress"].String .. "]"
  end
  Controls["QueueDepth"].String = tostring(#CommandQueue + (IsProcessing and 1 or 0))
end

-- Write a TTP command to the SSH socket, terminated with LF as required by TTP.
function Send(cmd)
  if not SSH.IsConnected then
    print("Tesira Controller: Cannot send -- not connected: " .. cmd)
    return
  end
  print("TX: " .. cmd)
  SSH:Write(cmd .. "\n")
  CommandTimeoutTimer:Stop()
  CommandTimeoutTimer:Start(5)
end

function EnqueueCommand(replyToken, cmd)
  table.insert(CommandQueue, { cmd = cmd, replyToken = replyToken })
  UpdateStatus()
  ProcessQueue()
end

function ProcessQueue()
  if IsProcessing or #CommandQueue == 0 or State ~= "ready" then return end
  IsProcessing = true
  local item = table.remove(CommandQueue, 1)
  CurrentReplyToken = item.replyToken
  Send(item.cmd)
  UpdateStatus()
end

-- Called when a +OK or -ERR line is received for the current in-flight command.
function HandleCommandResponse(data)
  CommandTimeoutTimer:Stop()
  IsProcessing = false
  if CurrentReplyToken and CurrentReplyToken ~= "" then
    -- Internal commands use __ prefix -- no child notification needed
    if not CurrentReplyToken:find("^__") then
      Notifications.Publish(
        "tesira." .. SystemId .. ".response." .. CurrentReplyToken,
        data
      )
    end
  end
  CurrentReplyToken = nil
  ProcessQueue()
  UpdateStatus()
end

-- Parse a subscription push line:
--   Verbose first:  ! "publishToken":"token" "value":val +OK
--   Verbose after:  ! "publishToken":"token" "value":val
--   Non-verbose:    ! "token" val
function HandleSubscriptionPush(line)
  local token, value
  -- Try verbose format first
  token, value = line:match('"publishToken"%s*:%s*"([^"]+)"%s+"value"%s*:%s*([^\r\n]+)')
  if not token then
    -- Try non-verbose / fallback format
    token, value = line:match('^!%s+"([^"]+)"%s+([^\r\n]+)')
  end

  -- The very first response to a subscribe command has +OK appended on the same line
  local hasOK = line:find("+OK", 1, true)
  if value then
    value = value:gsub("%s*%+OK%s*$", ""):match("^%s*(.-)%s*$")
  end

  -- Route push value to child plugins
  if token then
    Notifications.Publish("tesira." .. SystemId .. ".push." .. token, value or "")
  end

  -- If this was the initial subscribe response it also clears the command queue
  if hasOK and IsProcessing then
    HandleCommandResponse("+OK")
  end
end

-- Parse a complete TTP response line.
function ParseResponse(line)
  print("RX: " .. line)

  if line:sub(1, 1) == "!" then
    HandleSubscriptionPush(line)
    return
  end

  if line:find("^%+OK") or line:find("^%-ERR") or
     line:find("^%-CANNOT") or line:find("^%-GENERAL") then
    HandleCommandResponse(line)
    return
  end
  -- Blank lines, echoes, etc. are ignored
end

-- Read complete newline-delimited lines from RxBuffer and dispatch them.
-- SSH handles all encryption and framing -- no IAC stripping needed.
function ProcessBuffer()
  while true do
    local s, e = RxBuffer:find("\n")
    if not s then break end
    local line = RxBuffer:sub(1, s - 1):gsub("\r", ""):match("^%s*(.-)%s*$")
    RxBuffer = RxBuffer:sub(e + 1)

    if line ~= "" then
      if State == "initializing" then
        -- Waiting for the +OK response to SESSION set verbose true
        if line:find("^%+OK") then
          print("Tesira Controller: Session ready -- verbose mode confirmed")
          CommandTimeoutTimer:Stop()
          IsProcessing = false
          CurrentReplyToken = nil
          State = "ready"
          -- Notify all child plugins that the controller is up
          Notifications.Publish("tesira." .. SystemId .. ".connected", "true")
          -- Resubscribe any subscriptions registered before this connect
          for token, cmd in pairs(Subscriptions) do
            EnqueueCommand("__resub_" .. token, cmd)
          end
          ResubscribeTimer:Start(30)
          UpdateStatus()
          ProcessQueue()
        end
      elseif State == "ready" then
        ParseResponse(line)
      end
      -- Lines received while "disconnected" are discarded
    end
  end
end

-- Reset all connection state cleanly.
function Disconnect()
  CommandTimeoutTimer:Stop()
  ResubscribeTimer:Stop()
  State = "disconnected"
  RxBuffer = ""
  CommandQueue = {}
  IsProcessing = false
  CurrentReplyToken = nil
  UpdateStatus()
end

-- Main init: registers Notification channels then connects via SSH.
function Initialize()
  -- Clean up previous Notification listeners
  for _, id in ipairs(NotificationIds) do
    Notifications.Unsubscribe(id)
  end
  NotificationIds = {}
  Subscriptions = {}
  CommandQueue = {}
  IsProcessing = false
  CurrentReplyToken = nil
  State = "disconnected"
  RxBuffer = ""

  SystemId = Controls["SystemId"].String
  if SystemId == "" then
    SystemId = "Tesira1"
    Controls["SystemId"].String = SystemId
    print("Tesira Controller: SystemId defaulted to 'Tesira1'")
  end

  -- Child plugins send commands here: "replyToken|TTP command"
  local cmdId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".command",
    function(id, data)
      local replyToken, cmd = data:match("^([^|]+)|(.+)$")
      if replyToken and cmd then
        EnqueueCommand(replyToken, cmd)
      else
        print("Tesira Controller: Malformed command data: " .. tostring(data))
      end
    end
  )
  table.insert(NotificationIds, cmdId)

  -- Child plugins register Tesira subscriptions here: "publishToken|subscribe cmd"
  local subId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".subscribe",
    function(id, data)
      local token, cmd = data:match("^([^|]+)|(.+)$")
      if token and cmd then
        Subscriptions[token] = cmd
        EnqueueCommand("__sub_" .. token, cmd)
      else
        print("Tesira Controller: Malformed subscribe data: " .. tostring(data))
      end
    end
  )
  table.insert(NotificationIds, subId)

  -- Child plugins cancel subscriptions here: "publishToken|unsubscribe cmd"
  local unsubId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".unsubscribe",
    function(id, data)
      local token, cmd = data:match("^([^|]+)|(.+)$")
      if token then Subscriptions[token] = nil end
      if cmd then
        EnqueueCommand("__unsub_" .. tostring(token), cmd)
      end
    end
  )
  table.insert(NotificationIds, unsubId)

  UpdateStatus()

  local ip       = Controls["IPAddress"].String
  local username = Controls["Username"].String
  local password = Controls["Password"].String

  if ip ~= "" and Controls["Connect"].Boolean then
    State = "initializing"
    UpdateStatus()
    print(string.format(
      "Tesira Controller: SSH connecting to %s:22  user='%s'  [SystemId=%s]",
      ip, username, SystemId
    ))
    local ok, err = pcall(function()
      SSH:Connect(ip, 22, username, password)
    end)
    if not ok then
      print("Tesira Controller: Connect error: " .. tostring(err))
      Disconnect()
    end
  end
end
-- End Functions ---

--------------------
-- EventHandlers ---
--------------------

-- Do NOT declare SSH as local -- it will be garbage collected.
SSH = Ssh.New()
SSH.IsInteractive    = true  -- Tesira SSH requires a PTY; without this the session drops immediately after login
SSH.ReadTimeout      = 0     -- disabled; CommandTimeoutTimer handles stalls
SSH.WriteTimeout     = 0
SSH.ReconnectTimeout = 5

SSH.Connected = function()
  print("Tesira Controller: SSH login successful -- initializing TTP session")
  State = "initializing"
  RxBuffer = ""
  -- Send SESSION set verbose true immediately after successful login.
  -- The +OK response is handled in ProcessBuffer (initializing branch).
  SSH:Write("SESSION set verbose true\n")
  CommandTimeoutTimer:Start(5)
  IsProcessing = true
  CurrentReplyToken = "__session_init__"
  UpdateStatus()
end

SSH.Reconnect = function()
  print("Tesira Controller: SSH reconnecting...")
  State = "initializing"
  RxBuffer = ""
  CommandQueue = {}
  IsProcessing = false
  CurrentReplyToken = nil
  UpdateStatus()
end

SSH.LoginFailed = function()
  print("Tesira Controller: SSH login FAILED -- check Username / Password on Setup page")
  Controls["Status"].Value = 5
  Controls["ConnectionState"].String = "Login Failed"
  Disconnect()
end

SSH.Data = function()
  local raw = SSH:Read(SSH.BufferLength)
  if raw and #raw > 0 then
    RxBuffer = RxBuffer .. raw
    ProcessBuffer()
  end
end

SSH.Closed = function()
  print("Tesira Controller: SSH connection closed")
  Disconnect()
end

SSH.Error = function(sock, err)
  print("Tesira Controller: SSH error: " .. tostring(err))
  Disconnect()
end

SSH.Timeout = function()
  print("Tesira Controller: SSH timeout")
  Disconnect()
end

-- Per-command timeout: prevents the queue stalling if a response never arrives
CommandTimeoutTimer = Timer.New()
CommandTimeoutTimer.EventHandler = function()
  print("Tesira Controller: Command timeout -- clearing: " .. tostring(CurrentReplyToken))
  if CurrentReplyToken and not CurrentReplyToken:find("^__") then
    Notifications.Publish(
      "tesira." .. SystemId .. ".response." .. CurrentReplyToken,
      "-ERR Timeout"
    )
  end
  IsProcessing = false
  CurrentReplyToken = nil
  UpdateStatus()
  ProcessQueue()
end

-- Periodic resubscription: keeps subscriptions alive after Tesira reboots/config pushes
ResubscribeTimer = Timer.New()
ResubscribeTimer.EventHandler = function()
  if State == "ready" then
    local count = 0
    for token, cmd in pairs(Subscriptions) do
      EnqueueCommand("__resub_" .. token, cmd)
      count = count + 1
    end
    if count > 0 then
      print("Tesira Controller: Resubscribing " .. count .. " subscription(s)")
    end
  end
end

Controls["Connect"].EventHandler = function(ctl)
  if ctl.Boolean then
    Initialize()
  else
    SSH:Disconnect()
    Disconnect()
    print("Tesira Controller: Manually disconnected")
  end
end

Controls["IPAddress"].EventHandler = function(ctl)
  if Controls["Connect"].Boolean then
    SSH:Disconnect()
    Disconnect()
    Initialize()
  end
end

Controls["Username"].EventHandler = function(ctl)
  if Controls["Connect"].Boolean then
    SSH:Disconnect()
    Disconnect()
    Initialize()
  end
end

Controls["Password"].EventHandler = function(ctl)
  if Controls["Connect"].Boolean then
    SSH:Disconnect()
    Disconnect()
    Initialize()
  end
end

Controls["SystemId"].EventHandler = function(ctl)
  SSH:Disconnect()
  Disconnect()
  Initialize()
end
--End Eventhandlers-

-- Initialize --
-- Apply defaults on first load
if Controls["SystemId"].String == "" then
  Controls["SystemId"].String = "Tesira1"
end
if Controls["Username"].String == "" then
  Controls["Username"].String = "default"
end
-- Password intentionally left blank (correct for unprotected Tesira systems)

Initialize()
