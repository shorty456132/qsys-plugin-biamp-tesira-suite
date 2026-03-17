--[[ Biamp Tesira Source Selector — Runtime

  Controls a Tesira Source Selector block (source selection, output level, output mute).
  All communication goes through the Tesira Controller plugin via Q-SYS Notifications.

  TTP commands used:
    <InstanceTag> get sourceSelection                     — get selected source
    <InstanceTag> set sourceSelection <value>              — set selected source
    <InstanceTag> subscribe sourceSelection <token> <rate> — subscribe to selection changes
    <InstanceTag> unsubscribe sourceSelection <token>      — unsubscribe
    <InstanceTag> get outputLevel                          — get output level
    <InstanceTag> set outputLevel <dB>                     — set output level
    <InstanceTag> subscribe outputLevel <token> <rate>     — subscribe to level changes
    <InstanceTag> unsubscribe outputLevel <token>          — unsubscribe
    <InstanceTag> get outputMute                           — get output mute state
    <InstanceTag> set outputMute <true/false>              — set output mute
    <InstanceTag> subscribe outputMute <token> <rate>      — subscribe to mute changes
    <InstanceTag> unsubscribe outputMute <token>           — unsubscribe
    <InstanceTag> get label <source>                       — get source label
    <InstanceTag> get numSources                           — get number of sources

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
NumSources         = Properties["NumSources"].Value
SelectedSourceIndex = 0  -- currently selected source (0 = none)
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

-- Update toggle buttons to reflect the selected source (radio-button behavior)
function UpdateSourceButtons(sourceIndex)
  SelectedSourceIndex = sourceIndex
  UpdatingFromDevice = true
  for s = 1, NumSources do
    Controls["Source" .. s].Boolean = (s == sourceIndex)
  end
  UpdatingFromDevice = false
end

-- Get the currently selected source
function GetSourceSelection()
  local cmd = BuildCommand(InstanceTag, "get", "sourceSelection")
  SendCommand(cmd, function(response)
    local val = response:match('"value"%s*:%s*([%-%d%.]+)')
    if val then
      local idx = math.floor(tonumber(val) or 0)
      UpdatingFromDevice = true
      UpdateSourceButtons(idx)
      UpdatingFromDevice = false
      print("Tesira SourceSelector [" .. InstanceTag .. "]: selection = " .. idx)
    else
      print("Tesira SourceSelector [" .. InstanceTag .. "]: GetSourceSelection unexpected: " .. response)
    end
  end)
end

-- Set the source selection
function SetSourceSelection(sourceIndex)
  local cmd = BuildCommand(InstanceTag, "set", "sourceSelection", nil, sourceIndex)
  SendCommand(cmd, function(response)
    if not response:find("^%+OK") then
      print("Tesira SourceSelector [" .. InstanceTag .. "]: SetSourceSelection error: " .. response)
    end
  end)
end

-- Get the output level
function GetOutputLevel()
  local cmd = BuildCommand(InstanceTag, "get", "outputLevel")
  SendCommand(cmd, function(response)
    local val = response:match('"value"%s*:%s*([%-%d%.eE+]+)')
    if val then
      UpdatingFromDevice = true
      Controls["OutputLevel"].Value = tonumber(val) or 0
      UpdatingFromDevice = false
      print("Tesira SourceSelector [" .. InstanceTag .. "]: outputLevel = " .. val .. " dB")
    else
      print("Tesira SourceSelector [" .. InstanceTag .. "]: GetOutputLevel unexpected: " .. response)
    end
  end)
end

-- Set the output level
function SetOutputLevel(dBValue)
  local cmd = BuildCommand(InstanceTag, "set", "outputLevel", nil,
    string.format("%.6f", dBValue))
  SendCommand(cmd, function(response)
    if not response:find("^%+OK") then
      print("Tesira SourceSelector [" .. InstanceTag .. "]: SetOutputLevel error: " .. response)
    end
  end)
end

-- Get the output mute state
function GetOutputMute()
  local cmd = BuildCommand(InstanceTag, "get", "outputMute")
  SendCommand(cmd, function(response)
    local val = response:match('"value"%s*:%s*(%a+)')
    if val then
      UpdatingFromDevice = true
      Controls["OutputMute"].Boolean = (val == "true")
      UpdatingFromDevice = false
      print("Tesira SourceSelector [" .. InstanceTag .. "]: outputMute = " .. val)
    else
      print("Tesira SourceSelector [" .. InstanceTag .. "]: GetOutputMute unexpected: " .. response)
    end
  end)
end

-- Set the output mute state
function SetOutputMute(muteOn)
  local val = muteOn and "true" or "false"
  local cmd = BuildCommand(InstanceTag, "set", "outputMute", nil, val)
  SendCommand(cmd, function(response)
    if not response:find("^%+OK") then
      print("Tesira SourceSelector [" .. InstanceTag .. "]: SetOutputMute error: " .. response)
    end
  end)
end

-- Get the label for a single source
function GetSourceLabel(source)
  local cmd = BuildCommand(InstanceTag, "get", "label", source)
  SendCommand(cmd, function(response)
    local val = response:match('"value"%s*:%s*"([^"]*)"')
    if val then
      Controls["SourceLabel" .. source].String = val
    end
  end)
end

-- Register subscriptions with the Controller
function RegisterSubscriptions()
  if SystemId == "" or InstanceTag == "" then return end

  -- sourceSelection subscription (no index needed)
  local selToken = BaseToken .. "_sel"
  local selCmd = BuildCommand(InstanceTag, "subscribe", "sourceSelection", nil, selToken) .. " 500"
  Notifications.Publish("tesira." .. SystemId .. ".subscribe", selToken .. "|" .. selCmd)
  print("Tesira SourceSelector [" .. InstanceTag .. "]: registered sourceSelection subscription (" .. selToken .. ")")

  -- outputLevel subscription (no index needed)
  local lvlToken = BaseToken .. "_lvl"
  local lvlCmd = BuildCommand(InstanceTag, "subscribe", "outputLevel", nil, lvlToken) .. " 500"
  Notifications.Publish("tesira." .. SystemId .. ".subscribe", lvlToken .. "|" .. lvlCmd)
  print("Tesira SourceSelector [" .. InstanceTag .. "]: registered outputLevel subscription (" .. lvlToken .. ")")

  -- outputMute subscription (no index needed)
  local muteToken = BaseToken .. "_mute"
  local muteCmd = BuildCommand(InstanceTag, "subscribe", "outputMute", nil, muteToken) .. " 500"
  Notifications.Publish("tesira." .. SystemId .. ".subscribe", muteToken .. "|" .. muteCmd)
  print("Tesira SourceSelector [" .. InstanceTag .. "]: registered outputMute subscription (" .. muteToken .. ")")
end

-- Unregister subscriptions before reinit
function UnregisterSubscriptions()
  if SystemId == "" or InstanceTag == "" then return end

  local selToken = BaseToken .. "_sel"
  local selCmd = BuildCommand(InstanceTag, "unsubscribe", "sourceSelection", nil, selToken)
  Notifications.Publish("tesira." .. SystemId .. ".unsubscribe", selToken .. "|" .. selCmd)

  local lvlToken = BaseToken .. "_lvl"
  local lvlCmd = BuildCommand(InstanceTag, "unsubscribe", "outputLevel", nil, lvlToken)
  Notifications.Publish("tesira." .. SystemId .. ".unsubscribe", lvlToken .. "|" .. lvlCmd)

  local muteToken = BaseToken .. "_mute"
  local muteCmd = BuildCommand(InstanceTag, "unsubscribe", "outputMute", nil, muteToken)
  Notifications.Publish("tesira." .. SystemId .. ".unsubscribe", muteToken .. "|" .. muteCmd)
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
    print("Tesira SourceSelector: SystemId not configured — set on Setup page")
    return
  end
  if InstanceTag == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No Instance Tag"
    print("Tesira SourceSelector: InstanceTag not configured — set on Setup page")
    return
  end

  -- Derive unique base token
  local safeTag = InstanceTag:gsub("[^%w]", "_"):gsub("_+", "_"):gsub("^_", ""):gsub("_$", "")
  BaseToken = safeTag .. "_ss"

  -- Subscribe to sourceSelection push updates
  local selToken = BaseToken .. "_sel"
  local selNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".push." .. selToken,
    function(id, data)
      local val = tonumber(data)
      if val ~= nil then
        Timer.CallAfter(function()
          UpdatingFromDevice = true
          UpdateSourceButtons(math.floor(val))
          UpdatingFromDevice = false
        end, 0)
      end
    end
  )
  table.insert(NotificationIds, selNoteId)

  -- Subscribe to outputLevel push updates
  local lvlToken = BaseToken .. "_lvl"
  local lvlNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".push." .. lvlToken,
    function(id, data)
      local val = tonumber(data)
      if val ~= nil then
        Timer.CallAfter(function()
          UpdatingFromDevice = true
          Controls["OutputLevel"].Value = val
          UpdatingFromDevice = false
        end, 0)
      end
    end
  )
  table.insert(NotificationIds, lvlNoteId)

  -- Subscribe to outputMute push updates
  local muteToken = BaseToken .. "_mute"
  local muteNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".push." .. muteToken,
    function(id, data)
      local trimmed = data:match("^%s*(.-)%s*$") or ""
      Timer.CallAfter(function()
        UpdatingFromDevice = true
        Controls["OutputMute"].Boolean = (trimmed == "true")
        UpdatingFromDevice = false
      end, 0)
    end
  )
  table.insert(NotificationIds, muteNoteId)

  -- Subscribe to controller reconnect
  local connNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".connected",
    function(id, data)
      Timer.CallAfter(function()
        print("Tesira SourceSelector [" .. InstanceTag .. "]: controller reconnected — refreshing")
        RegisterSubscriptions()
        Timer.CallAfter(function()
          GetSourceSelection()
          GetOutputLevel()
          GetOutputMute()
          for s = 1, NumSources do
            GetSourceLabel(s)
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
    GetSourceSelection()
    GetOutputLevel()
    GetOutputMute()
    for s = 1, NumSources do
      GetSourceLabel(s)
    end
  end, 1)

  print(string.format(
    "Tesira SourceSelector: Initialized — InstanceTag='%s' Sources=%d SystemId='%s'",
    InstanceTag, NumSources, SystemId
  ))
end
-- End Functions ---

--------------------
-- EventHandlers ---
--------------------

-- Source select toggle buttons (radio-button behavior)
for i = 1, NumSources do
  local idx = i
  Controls["Source" .. idx].EventHandler = function(ctl)
    if not IsInitialized or UpdatingFromDevice then return end
    if ctl.Boolean then
      -- User selected this source
      SetSourceSelection(idx)
      UpdateSourceButtons(idx)
    else
      -- Prevent deselecting the active source by toggling it back on
      if idx == SelectedSourceIndex then
        UpdatingFromDevice = true
        ctl.Boolean = true
        UpdatingFromDevice = false
      end
    end
  end
end

-- Output level fader
Controls["OutputLevel"].EventHandler = function(ctl)
  if IsInitialized and not UpdatingFromDevice then
    SetOutputLevel(ctl.Value)
  end
end

-- Output mute button
Controls["OutputMute"].EventHandler = function(ctl)
  if IsInitialized and not UpdatingFromDevice then
    SetOutputMute(ctl.Boolean)
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
