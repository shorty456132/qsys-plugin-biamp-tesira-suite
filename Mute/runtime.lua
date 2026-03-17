--[[ Biamp Tesira Mute — Runtime

  Controls a mute on various Tesira block types.
  All communication goes through the Tesira Controller plugin via Q-SYS Notifications.

  Supported block types and their TTP attribute/index:
    Mute Control  — attribute: "mute",       index: channel   (subscribe supported)
    USB Input     — attribute: "mute",       index: channel   (no subscribe — uses polling)
    Mixer Input   — attribute: "inputMute",  index: input     (subscribe supported)
    Mixer Output  — attribute: "outputMute", index: output    (subscribe supported)

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
ChannelIndex       = 1
BaseToken          = ""
CommandCounter     = 0
IsInitialized      = false
UpdatingFromDevice = false
NotificationIds    = {}
BlockType          = Properties["BlockType"].Value

-- Map block type to TTP attribute code
AttributeMap = {
  ["Mute Control"]  = "mute",
  ["USB Input"]     = "mute",
  ["Mixer Input"]   = "inputMute",
  ["Mixer Output"]  = "outputMute"
}

-- Block types that support TTP subscribe
SubscribeSupported = {
  ["Mute Control"]  = true,
  ["USB Input"]     = false,
  ["Mixer Input"]   = true,
  ["Mixer Output"]  = true
}

MuteAttribute      = AttributeMap[BlockType] or "mute"
CanSubscribe       = SubscribeSupported[BlockType] ~= false
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

-- Get the current mute state
function GetMute()
  local cmd = BuildCommand(InstanceTag, "get", MuteAttribute, ChannelIndex)
  SendCommand(cmd, function(response)
    local val = response:match('"value"%s*:%s*(%a+)')
    if val then
      UpdatingFromDevice = true
      Controls["Mute"].Boolean = (val == "true")
      UpdatingFromDevice = false
      print("Tesira Mute [" .. InstanceTag .. "]: " .. MuteAttribute .. " ch" .. ChannelIndex .. " = " .. val)
    else
      print("Tesira Mute [" .. InstanceTag .. "]: GetMute unexpected: " .. response)
    end
  end)
end

-- Set the mute state
function SetMute(muteOn)
  local val = muteOn and "true" or "false"
  local cmd = BuildCommand(InstanceTag, "set", MuteAttribute, ChannelIndex, val)
  SendCommand(cmd, function(response)
    if not response:find("^%+OK") then
      print("Tesira Mute [" .. InstanceTag .. "]: SetMute error: " .. response)
    end
  end)
end

-- Register mute subscription with the Controller
function RegisterSubscription()
  if SystemId == "" or InstanceTag == "" or not CanSubscribe then return end

  local token = BaseToken .. "_mute"
  local cmd = BuildCommand(InstanceTag, "subscribe", MuteAttribute, ChannelIndex, token) .. " 500"
  Notifications.Publish("tesira." .. SystemId .. ".subscribe", token .. "|" .. cmd)
  print("Tesira Mute [" .. InstanceTag .. "]: registered " .. MuteAttribute .. " subscription (" .. token .. ")")
end

-- Unregister subscription before reinit
function UnregisterSubscription()
  if SystemId == "" or InstanceTag == "" or not CanSubscribe then return end

  local token = BaseToken .. "_mute"
  local cmd = BuildCommand(InstanceTag, "unsubscribe", MuteAttribute, ChannelIndex, token)
  Notifications.Publish("tesira." .. SystemId .. ".unsubscribe", token .. "|" .. cmd)
end

function Initialize()
  -- Unregister old Tesira subscription before globals change
  UnregisterSubscription()

  -- Stop poll timer if running
  PollTimer:Stop()

  -- Clean up previous Notification subscriptions
  for _, id in ipairs(NotificationIds) do
    Notifications.Unsubscribe(id)
  end
  NotificationIds = {}
  IsInitialized = false

  SystemId     = Controls["SystemId"].String
  InstanceTag  = Controls["InstanceTag"].String
  ChannelIndex = tonumber(Controls["ChannelIndex"].String) or 1

  -- Validate required fields
  if SystemId == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No System ID"
    print("Tesira Mute: SystemId not configured — set on Setup page")
    return
  end
  if InstanceTag == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No Instance Tag"
    print("Tesira Mute: InstanceTag not configured — set on Setup page")
    return
  end

  -- Derive unique base token
  local safeTag = InstanceTag:gsub("[^%w]", "_"):gsub("_+", "_"):gsub("^_", ""):gsub("_$", "")
  BaseToken = safeTag .. "_ch" .. ChannelIndex .. "_mt"

  if CanSubscribe then
    -- Subscribe to live mute push updates
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
  end

  -- Subscribe to controller reconnect
  local connNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".connected",
    function(id, data)
      Timer.CallAfter(function()
        print("Tesira Mute [" .. InstanceTag .. "]: controller reconnected — refreshing")
        if CanSubscribe then
          RegisterSubscription()
        end
        Timer.CallAfter(function()
          GetMute()
        end, 1.5)
      end, 0)
    end
  )
  table.insert(NotificationIds, connNoteId)

  IsInitialized = true
  Controls["Status"].Value = 0
  Controls["Status"].String = ""

  -- Register subscription or start polling
  if CanSubscribe then
    RegisterSubscription()
  else
    PollTimer:Start(2)
    print("Tesira Mute [" .. InstanceTag .. "]: using polling (subscribe not supported for " .. BlockType .. ")")
  end

  -- Fetch initial value
  Timer.CallAfter(function()
    GetMute()
  end, 1)

  print(string.format(
    "Tesira Mute: Initialized — BlockType='%s' Attribute='%s' InstanceTag='%s' Channel=%d SystemId='%s'",
    BlockType, MuteAttribute, InstanceTag, ChannelIndex, SystemId
  ))
end
-- End Functions ---

--------------------
-- EventHandlers ---
--------------------

-- Poll timer for block types that don't support subscribe
PollTimer = Timer.New()
PollTimer.EventHandler = function()
  if IsInitialized then
    GetMute()
  end
end

-- Mute toggle button
Controls["Mute"].EventHandler = function(ctl)
  if IsInitialized and not UpdatingFromDevice then
    SetMute(ctl.Boolean)
  end
end

-- Re-initialize when Setup controls change
Controls["SystemId"].EventHandler = function()
  Initialize()
end

Controls["InstanceTag"].EventHandler = function()
  Initialize()
end

Controls["ChannelIndex"].EventHandler = function()
  Initialize()
end
--End Eventhandlers-

-- Initialize --
if Controls["SystemId"].String == "" then
  Controls["SystemId"].String = "Tesira1"
end
if Controls["ChannelIndex"].String == "" then
  Controls["ChannelIndex"].String = "1"
end

Timer.CallAfter(Initialize, 2)
