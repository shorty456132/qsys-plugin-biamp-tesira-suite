--[[ Biamp Tesira Logic State — Runtime

  Controls a Tesira Logic State block (boolean state per channel).
  All communication goes through the Tesira Controller plugin via Q-SYS Notifications.

  TTP commands used:
    <InstanceTag> get state <channel>           — get current state
    <InstanceTag> set state <channel> true/false — set state
    <InstanceTag> toggle state <channel>         — toggle state
    <InstanceTag> subscribe state <channel> <token> <rate>
    <InstanceTag> unsubscribe state <channel> <token>
    <InstanceTag> get label <channel>            — get channel label

  Notification channels used:
    PUBLISH  tesira.<SystemId>.command          "replyToken|TTP command"
    SUBSCRIBE tesira.<SystemId>.response.<token>  "+OK ..." or "-ERR ..."
    PUBLISH  tesira.<SystemId>.subscribe        "publishToken|subscribe cmd"
    PUBLISH  tesira.<SystemId>.unsubscribe      "publishToken|unsubscribe cmd"
    SUBSCRIBE tesira.<SystemId>.push.<token>    "value"
    SUBSCRIBE tesira.<SystemId>.connected       "true"
]]

--------------------
-- Variables -------
--------------------
SystemId           = ""
InstanceTag        = ""
BaseToken          = ""
CommandCounter     = 0
IsInitialized      = false
UpdatingFromDevice = false
NotificationIds    = {}
NumChannels        = Properties["NumChannels"].Value
-- End Variables ---

--------------------
-- Functions -------
--------------------

function GetReplyToken()
  CommandCounter = CommandCounter + 1
  return BaseToken .. "_r" .. CommandCounter
end

function SendCommand(cmd, callback)
  local replyToken = GetReplyToken()
  local noteId
  noteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".response." .. replyToken,
    function(id, data)
      Timer.CallAfter(function()
        Notifications.Unsubscribe(noteId)
        if callback then callback(data) end
      end, 0)
    end
  )
  Notifications.Publish("tesira." .. SystemId .. ".command", replyToken .. "|" .. cmd)
end

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

-- Get the current state for a single channel
function GetState(channel)
  local cmd = BuildCommand(InstanceTag, "get", "state", channel)
  SendCommand(cmd, function(response)
    local val = response:match('"value"%s*:%s*(%a+)')
    if val then
      UpdatingFromDevice = true
      Controls["State" .. channel].Boolean = (val == "true")
      UpdatingFromDevice = false
      print("Tesira LogicState [" .. InstanceTag .. "]: ch" .. channel .. " state = " .. val)
    else
      print("Tesira LogicState [" .. InstanceTag .. "]: GetState ch" .. channel .. " unexpected: " .. response)
    end
  end)
end

-- Get the label for a single channel
function GetLabel(channel)
  local cmd = BuildCommand(InstanceTag, "get", "label", channel)
  SendCommand(cmd, function(response)
    local val = response:match('"value"%s*:%s*"([^"]*)"')
    if val then
      Controls["ChannelLabel" .. channel].String = val
      print("Tesira LogicState [" .. InstanceTag .. "]: ch" .. channel .. " label = " .. val)
    end
  end)
end

-- Set the state for a single channel
function SetState(channel, stateOn)
  local val = stateOn and "true" or "false"
  local cmd = BuildCommand(InstanceTag, "set", "state", channel, val)
  SendCommand(cmd, function(response)
    if not response:find("^%+OK") then
      print("Tesira LogicState [" .. InstanceTag .. "]: SetState ch" .. channel .. " error: " .. response)
    end
  end)
end

-- Register state subscriptions for all channels
function RegisterSubscriptions()
  if SystemId == "" or InstanceTag == "" then return end

  for ch = 1, NumChannels do
    local token = BaseToken .. "_state" .. ch
    local cmd = BuildCommand(InstanceTag, "subscribe", "state", ch, token) .. " 500"
    Notifications.Publish("tesira." .. SystemId .. ".subscribe", token .. "|" .. cmd)
  end
  print("Tesira LogicState [" .. InstanceTag .. "]: registered " .. NumChannels .. " state subscription(s)")
end

-- Unregister subscriptions before reinit
function UnregisterSubscriptions()
  if SystemId == "" or InstanceTag == "" then return end

  for ch = 1, NumChannels do
    local token = BaseToken .. "_state" .. ch
    local cmd = BuildCommand(InstanceTag, "unsubscribe", "state", ch, token)
    Notifications.Publish("tesira." .. SystemId .. ".unsubscribe", token .. "|" .. cmd)
  end
end

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

  -- Validate required fields
  if SystemId == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No System ID"
    print("Tesira LogicState: SystemId not configured — set on Setup page")
    return
  end
  if InstanceTag == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No Instance Tag"
    print("Tesira LogicState: InstanceTag not configured — set on Setup page")
    return
  end

  -- Derive unique base token
  local safeTag = InstanceTag:gsub("[^%w]", "_"):gsub("_+", "_"):gsub("^_", ""):gsub("_$", "")
  BaseToken = safeTag .. "_ls"

  -- Subscribe to live state push updates per channel
  for ch = 1, NumChannels do
    local token = BaseToken .. "_state" .. ch
    local capturedCh = ch
    local noteId = Notifications.Subscribe(
      "tesira." .. SystemId .. ".push." .. token,
      function(id, data)
        local trimmed = data:match("^%s*(.-)%s*$") or ""
        Timer.CallAfter(function()
          UpdatingFromDevice = true
          Controls["State" .. capturedCh].Boolean = (trimmed == "true")
          UpdatingFromDevice = false
        end, 0)
      end
    )
    table.insert(NotificationIds, noteId)
  end

  -- Subscribe to controller reconnect
  local connNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".connected",
    function(id, data)
      Timer.CallAfter(function()
        print("Tesira LogicState [" .. InstanceTag .. "]: controller reconnected — refreshing")
        RegisterSubscriptions()
        Timer.CallAfter(function()
          for ch = 1, NumChannels do
            GetState(ch)
            GetLabel(ch)
          end
        end, 1.5)
      end, 0)
    end
  )
  table.insert(NotificationIds, connNoteId)

  IsInitialized = true
  Controls["Status"].Value = 0
  Controls["Status"].String = ""

  -- Register Tesira subscriptions
  RegisterSubscriptions()

  -- Fetch initial values
  Timer.CallAfter(function()
    for ch = 1, NumChannels do
      GetState(ch)
      GetLabel(ch)
    end
  end, 1)

  print(string.format(
    "Tesira LogicState: Initialized — InstanceTag='%s' Channels=%d SystemId='%s'",
    InstanceTag, NumChannels, SystemId
  ))
end
-- End Functions ---

--------------------
-- EventHandlers ---
--------------------

-- State toggle buttons
for i = 1, NumChannels do
  local idx = i
  Controls["State" .. idx].EventHandler = function(ctl)
    if IsInitialized and not UpdatingFromDevice then
      SetState(idx, ctl.Boolean)
    end
  end
end

-- Re-initialize when Setup controls change
Controls["SystemId"].EventHandler = function()
  Initialize()
end

Controls["InstanceTag"].EventHandler = function()
  Initialize()
end
--End Eventhandlers-

-- Initialize --
if Controls["SystemId"].String == "" then
  Controls["SystemId"].String = "Tesira1"
end

Timer.CallAfter(Initialize, 2)
