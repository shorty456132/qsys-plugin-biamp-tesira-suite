--[[ Biamp Tesira Logic Meter — Runtime

  Monitors a Tesira Logic Meter block (read-only boolean per channel).
  All communication goes through the Tesira Controller plugin via Q-SYS Notifications.

  TTP commands used:
    <InstanceTag> get value <channel>                             — get current value
    <InstanceTag> subscribe value <channel> <token> <rate>        — subscribe to live updates
    <InstanceTag> unsubscribe value <channel> <token>             — unsubscribe

  Notification channels used:
    PUBLISH  tesira.<SystemId>.command          "replyToken|TTP command"
    SUBSCRIBE tesira.<SystemId>.response.<token>  "+OK ..." or "-ERR ..."
    PUBLISH  tesira.<SystemId>.subscribe        "publishToken|subscribe cmd"
    PUBLISH  tesira.<SystemId>.unsubscribe      "publishToken|unsubscribe cmd"
    SUBSCRIBE tesira.<SystemId>.push.<token>    "true" or "false"
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

-- Get the current value for a single channel
function GetValue(channel)
  local cmd = BuildCommand(InstanceTag, "get", "value", channel)
  SendCommand(cmd, function(response)
    local val = response:match('"value"%s*:%s*(%a+)')
    if val then
      local boolVal = (val == "true")
      Controls["Value" .. channel].Boolean = boolVal
      print("Tesira LogicMeter [" .. InstanceTag .. "]: ch" .. channel .. " value = " .. val)
    else
      print("Tesira LogicMeter [" .. InstanceTag .. "]: GetValue ch" .. channel .. " unexpected: " .. response)
    end
  end)
end

-- Register value subscriptions for all channels
function RegisterSubscriptions()
  if SystemId == "" or InstanceTag == "" then return end

  for ch = 1, NumChannels do
    local token = BaseToken .. "_value" .. ch
    local cmd = BuildCommand(InstanceTag, "subscribe", "state", ch, token) .. " 500"
    Notifications.Publish("tesira." .. SystemId .. ".subscribe", token .. "|" .. cmd)
    print("Tesira LogicMeter [" .. InstanceTag .. "]: registered value subscription ch" .. ch .. " (" .. token .. ")")
  end
end

-- Unregister subscriptions before reinit
function UnregisterSubscriptions()
  if SystemId == "" or InstanceTag == "" then return end

  for ch = 1, NumChannels do
    local token = BaseToken .. "_value" .. ch
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
    print("Tesira LogicMeter: SystemId not configured — set on Setup page")
    return
  end
  if InstanceTag == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No Instance Tag"
    print("Tesira LogicMeter: InstanceTag not configured — set on Setup page")
    return
  end

  -- Derive unique base token
  local safeTag = InstanceTag:gsub("[^%w]", "_"):gsub("_+", "_"):gsub("^_", ""):gsub("_$", "")
  BaseToken = safeTag .. "_lm"

  -- Subscribe to live value push updates per channel
  for ch = 1, NumChannels do
    local token = BaseToken .. "_value" .. ch
    local capturedCh = ch
    local pushChannel = "tesira." .. SystemId .. ".push." .. token
    print("Tesira LogicMeter [" .. InstanceTag .. "]: subscribing to push channel: " .. pushChannel)
    local noteId = Notifications.Subscribe(
      pushChannel,
      function(id, data)
        print("Tesira LogicMeter [" .. InstanceTag .. "]: push ch" .. capturedCh .. " raw data: [" .. tostring(data) .. "]")
        local trimmed = data:match("^%s*(.-)%s*$") or ""
        Timer.CallAfter(function()
          Controls["Value" .. capturedCh].Boolean = (trimmed == "true")
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
        print("Tesira LogicMeter [" .. InstanceTag .. "]: controller reconnected — refreshing")
        RegisterSubscriptions()
        Timer.CallAfter(function()
          for ch = 1, NumChannels do
            GetValue(ch)
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
      GetValue(ch)
    end
  end, 1)

  print(string.format(
    "Tesira LogicMeter: Initialized — InstanceTag='%s' Channels=%d SystemId='%s'",
    InstanceTag, NumChannels, SystemId
  ))
end
-- End Functions ---

--------------------
-- EventHandlers ---
--------------------

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
