--[[ Biamp Tesira Level Block — Runtime

  Controls a single channel of a Tesira Level block.
  All communication goes through the Tesira Controller plugin via Q-SYS Notifications.

  Notification channels used:
    PUBLISH  tesira.<SystemId>.command        "replyToken|TTP command"       send get/set to controller
    SUBSCRIBE tesira.<SystemId>.response.<token>  "+OK ..." or "-ERR ..."   receive command response
    PUBLISH  tesira.<SystemId>.subscribe      "publishToken|subscribe cmd"  register level/mute subscriptions
    PUBLISH  tesira.<SystemId>.unsubscribe    "publishToken|unsubscribe cmd" cancel subscriptions
    SUBSCRIBE tesira.<SystemId>.push.<token>  "value"                       receive live push updates
    SUBSCRIBE tesira.<SystemId>.connected     "true"                        re-init when controller reconnects

  Publish tokens (unique per instance tag + channel):
    <safeInstanceTag>_ch<N>_level
    <safeInstanceTag>_ch<N>_mute

  User workflow:
    1. Set System ID to match the Controller plugin (default: "Tesira1")
    2. Set Instance Tag to the Level block's instance tag in Tesira Designer
    3. Set Channel to the desired channel number (1-based)
]]

--------------------
-- Variables -------
--------------------
SystemId       = ""
InstanceTag    = ""
ChannelIndex   = 1
BaseToken      = ""     -- derived from instance tag + channel, used to namespace tokens
CommandCounter = 0      -- incremented per command for unique reply tokens
IsInitialized  = false
UpdatingFromDevice = false  -- guard flag to prevent feedback loops when setting controls from push/get responses
NotificationIds = {}    -- Notifications subscription IDs to clean up on reinit
-- End Variables ---

--------------------
-- Functions -------
--------------------

-- Generate a unique reply token for a one-shot command/response pair
function GetReplyToken()
  CommandCounter = CommandCounter + 1
  return BaseToken .. "_r" .. CommandCounter
end

-- Send a TTP command through the Controller. Calls callback(responseString) on reply.
function SendCommand(cmd, callback)
  local replyToken = GetReplyToken()
  local noteId
  noteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".response." .. replyToken,
    function(id, data)
      -- Defer to avoid recursive Notification calls
      Timer.CallAfter(function()
        Notifications.Unsubscribe(noteId)
        if callback then callback(data) end
      end, 0)
    end
  )
  Notifications.Publish("tesira." .. SystemId .. ".command", replyToken .. "|" .. cmd)
end

-- Build a properly-quoted TTP command string
-- instanceTag: string (quoted automatically if it contains spaces)
-- command: "get" | "set" | "subscribe" | "unsubscribe" | etc.
-- attribute: "level" | "mute" | etc.
-- index: channel number (number, or nil if not applicable)
-- value: set value / publish token / etc. (any type, or nil)
function BuildCommand(instanceTag, command, attribute, index, value)
  local parts = {}
  if instanceTag:find(" ") then
    table.insert(parts, '"' .. instanceTag .. '"')
  else
    table.insert(parts, instanceTag)
  end
  table.insert(parts, command)
  table.insert(parts, attribute)
  if index ~= nil then table.insert(parts, tostring(index)) end
  if value ~= nil then table.insert(parts, tostring(value)) end
  return table.concat(parts, " ")
end

-- Request the current level value from Tesira
function GetLevel()
  local cmd = BuildCommand(InstanceTag, "get", "level", ChannelIndex)
  SendCommand(cmd, function(response)
    -- Verbose response: +OK "value":-10.000000
    local val = response:match('"value"%s*:%s*([%-%d%.eE+]+)')
    if val then
      UpdatingFromDevice = true
      Controls["Level"].Value = tonumber(val) or 0
      UpdatingFromDevice = false
      print("Tesira Level [" .. InstanceTag .. "]: level = " .. val .. " dB")
    else
      print("Tesira Level [" .. InstanceTag .. "]: GetLevel unexpected response: " .. response)
    end
  end)
end

-- Request the current mute state from Tesira
function GetMute()
  local cmd = BuildCommand(InstanceTag, "get", "mute", ChannelIndex)
  SendCommand(cmd, function(response)
    -- Verbose response: +OK "value":true  or  +OK "value":false
    local val = response:match('"value"%s*:%s*(%a+)')
    if val then
      UpdatingFromDevice = true
      Controls["Mute"].Boolean = (val == "true")
      UpdatingFromDevice = false
      print("Tesira Level [" .. InstanceTag .. "]: mute = " .. val)
    else
      print("Tesira Level [" .. InstanceTag .. "]: GetMute unexpected response: " .. response)
    end
  end)
end

-- Set the level value on the Tesira (called when fader is moved)
function SetLevel(dBValue)
  local cmd = BuildCommand(InstanceTag, "set", "level", ChannelIndex,
    string.format("%.6f", dBValue))
  SendCommand(cmd, function(response)
    if not response:find("^%+OK") then
      print("Tesira Level [" .. InstanceTag .. "]: SetLevel error: " .. response)
    end
  end)
end

-- Set the mute state on the Tesira (called when mute button is toggled)
function SetMute(muteOn)
  local val = muteOn and "true" or "false"
  local cmd = BuildCommand(InstanceTag, "set", "mute", ChannelIndex, val)
  SendCommand(cmd, function(response)
    if not response:find("^%+OK") then
      print("Tesira Level [" .. InstanceTag .. "]: SetMute error: " .. response)
    end
  end)
end

-- Register level and mute subscriptions with the Controller.
-- The Controller forwards these to Tesira and will publish push updates
-- to tesira.<SystemId>.push.<token> whenever values change.
function RegisterSubscriptions()
  if SystemId == "" or InstanceTag == "" then return end

  -- Level subscription: 500ms refresh rate
  local levelToken = BaseToken .. "_level"
  local levelCmd = BuildCommand(InstanceTag, "subscribe", "level", ChannelIndex, levelToken) .. " 500"
  Notifications.Publish("tesira." .. SystemId .. ".subscribe", levelToken .. "|" .. levelCmd)
  print("Tesira Level [" .. InstanceTag .. "]: registered level subscription (" .. levelToken .. ")")

  -- Mute subscription: 500ms refresh rate
  local muteToken = BaseToken .. "_mute"
  local muteCmd = BuildCommand(InstanceTag, "subscribe", "mute", ChannelIndex, muteToken) .. " 500"
  Notifications.Publish("tesira." .. SystemId .. ".subscribe", muteToken .. "|" .. muteCmd)
  print("Tesira Level [" .. InstanceTag .. "]: registered mute subscription (" .. muteToken .. ")")
end

-- Unregister subscriptions (called on reinit or when instance tag changes)
function UnregisterSubscriptions()
  if SystemId == "" or InstanceTag == "" then return end

  local levelToken = BaseToken .. "_level"
  local levelCmd = BuildCommand(InstanceTag, "unsubscribe", "level", ChannelIndex, levelToken)
  Notifications.Publish("tesira." .. SystemId .. ".unsubscribe", levelToken .. "|" .. levelCmd)

  local muteToken = BaseToken .. "_mute"
  local muteCmd = BuildCommand(InstanceTag, "unsubscribe", "mute", ChannelIndex, muteToken)
  Notifications.Publish("tesira." .. SystemId .. ".unsubscribe", muteToken .. "|" .. muteCmd)
end

-- Main initialization. Reads config from Setup controls, subscribes to
-- Notification channels, registers Tesira subscriptions, and fetches initial values.
function Initialize()
  -- Unregister old Tesira subscriptions before globals change
  UnregisterSubscriptions()

  -- Clean up previous Notification subscriptions
  for _, id in ipairs(NotificationIds) do
    Notifications.Unsubscribe(id)
  end
  NotificationIds = {}
  IsInitialized = false

  SystemId    = Controls["SystemId"].String
  InstanceTag = Controls["InstanceTag"].String
  ChannelIndex = tonumber(Controls["ChannelIndex"].String) or 1

  -- Validate required fields
  if SystemId == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No System ID"
    print("Tesira Level: SystemId not configured — set on Setup page")
    return
  end
  if InstanceTag == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No Instance Tag"
    print("Tesira Level: InstanceTag not configured — set on Setup page")
    return
  end

  -- Derive unique base token: sanitize tag, append channel
  local safeTag = InstanceTag:gsub("[^%w]", "_"):gsub("_+", "_"):gsub("^_", ""):gsub("_$", "")
  BaseToken = safeTag .. "_ch" .. ChannelIndex

  -- Subscribe to live level push updates from Controller
  local levelToken = BaseToken .. "_level"
  local levelNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".push." .. levelToken,
    function(id, data)
      local val = tonumber(data)
      if val ~= nil then
        Timer.CallAfter(function()
          UpdatingFromDevice = true
          Controls["Level"].Value = val
          UpdatingFromDevice = false
        end, 0)
      end
    end
  )
  table.insert(NotificationIds, levelNoteId)

  -- Subscribe to live mute push updates from Controller
  local muteToken = BaseToken .. "_mute"
  local muteNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".push." .. muteToken,
    function(id, data)
      local trimmed = data:match("^%s*(.-)%s*$") or ""
      Timer.CallAfter(function()
        UpdatingFromDevice = true
        Controls["Mute"].Boolean = (trimmed == "true")
        UpdatingFromDevice = false
      end, 0)
    end
  )
  table.insert(NotificationIds, muteNoteId)

  -- Subscribe to controller reconnect notifications so we can reregister
  -- subscriptions and refresh values after a Tesira reboot or config push
  local connNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".connected",
    function(id, data)
      -- Defer to avoid recursive Notification calls
      Timer.CallAfter(function()
        print("Tesira Level [" .. InstanceTag .. "]: controller reconnected — refreshing")
        RegisterSubscriptions()
        Timer.CallAfter(function()
          GetLevel()
          GetMute()
        end, 1.5)
      end, 0)
    end
  )
  table.insert(NotificationIds, connNoteId)

  IsInitialized = true
  Controls["Status"].Value = 0  -- OK (green)
  Controls["Status"].String = ""

  -- Register Tesira subscriptions with the Controller
  RegisterSubscriptions()

  -- Fetch initial values with a small delay to allow
  -- subscription registration to complete first
  Timer.CallAfter(function()
    GetLevel()
    GetMute()
  end, 1)

  print(string.format(
    "Tesira Level: Initialized — InstanceTag='%s' Channel=%d SystemId='%s'",
    InstanceTag, ChannelIndex, SystemId
  ))
end
-- End Functions ---

--------------------
-- EventHandlers ---
--------------------

-- Fader moved by user or external control
Controls["Level"].EventHandler = function(ctl)
  if IsInitialized and not UpdatingFromDevice then
    SetLevel(ctl.Value)
  end
end

-- Mute button toggled by user or external control
Controls["Mute"].EventHandler = function(ctl)
  if IsInitialized and not UpdatingFromDevice then
    SetMute(ctl.Boolean)
  end
end

-- Re-initialize when any Setup control changes
Controls["SystemId"].EventHandler = function(ctl)
  Initialize()
end

Controls["InstanceTag"].EventHandler = function(ctl)
  Initialize()
end

Controls["ChannelIndex"].EventHandler = function(ctl)
  Initialize()
end
--End Eventhandlers-

-- Initialize --
-- Apply defaults on first load
if Controls["SystemId"].String == "" then
  Controls["SystemId"].String = "Tesira1"
end
if Controls["ChannelIndex"].String == "" then
  Controls["ChannelIndex"].String = "1"
end

-- Small delay so the Controller plugin has time to start and register
-- its Notification listeners before we try to subscribe/send
Timer.CallAfter(Initialize, 2)
