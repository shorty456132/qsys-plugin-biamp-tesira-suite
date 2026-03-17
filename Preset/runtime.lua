--[[ Biamp Tesira Preset — Runtime

  Recalls and saves device-level presets on a Biamp Tesira system.
  All communication goes through the Tesira Controller plugin via Q-SYS Notifications.

  TTP commands used (DEVICE service commands):
    DEVICE recallPreset <id>     — recall a preset by numeric ID
    DEVICE savePreset <id>       — save current state to a preset ID

  Notification channels used:
    PUBLISH  tesira.<SystemId>.command        "replyToken|TTP command"
    SUBSCRIBE tesira.<SystemId>.response.<token>  "+OK ..." or "-ERR ..."
    SUBSCRIBE tesira.<SystemId>.connected     "true"
]]

--------------------
-- Variables -------
--------------------
SystemId       = ""
CommandCounter = 0
IsInitialized  = false
NotificationIds = {}
NumPresets     = Properties["NumPresets"].Value
-- End Variables ---

--------------------
-- Functions -------
--------------------

function GetReplyToken()
  CommandCounter = CommandCounter + 1
  return "preset_r" .. CommandCounter
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

function RecallPreset(presetId)
  if not IsInitialized then return end
  if presetId == "" then
    Controls["LastAction"].String = "No preset ID entered"
    return
  end
  print("Tesira Preset: Recalling preset " .. presetId)
  Controls["LastAction"].String = "Recalling preset " .. presetId .. "..."
  local cmd = "DEVICE recallPreset " .. presetId
  SendCommand(cmd, function(response)
    if response:find("^%+OK") then
      Controls["LastAction"].String = "Recalled preset " .. presetId
      print("Tesira Preset: Recalled preset " .. presetId)
    else
      Controls["LastAction"].String = "Recall failed: " .. response
      print("Tesira Preset: Recall error: " .. response)
    end
  end)
end

function SavePreset(presetId)
  if not IsInitialized then return end
  if presetId == "" then
    Controls["LastAction"].String = "No preset ID entered"
    return
  end
  print("Tesira Preset: Saving preset " .. presetId)
  Controls["LastAction"].String = "Saving preset " .. presetId .. "..."
  local cmd = "DEVICE savePreset " .. presetId
  SendCommand(cmd, function(response)
    if response:find("^%+OK") then
      Controls["LastAction"].String = "Saved preset " .. presetId
      print("Tesira Preset: Saved preset " .. presetId)
    else
      Controls["LastAction"].String = "Save failed: " .. response
      print("Tesira Preset: Save error: " .. response)
    end
  end)
end

function Initialize()
  -- Clean up previous Notification subscriptions
  for _, id in ipairs(NotificationIds) do
    Notifications.Unsubscribe(id)
  end
  NotificationIds = {}
  IsInitialized = false

  SystemId = Controls["SystemId"].String

  if SystemId == "" then
    Controls["Status"].Value = 5
    Controls["Status"].String = "No System ID"
    Controls["LastAction"].String = ""
    print("Tesira Preset: SystemId not configured — set on Setup page")
    return
  end

  -- Listen for Controller reconnect to clear stale status
  local connNoteId = Notifications.Subscribe(
    "tesira." .. SystemId .. ".connected",
    function(id, data)
      Timer.CallAfter(function()
        print("Tesira Preset: Controller reconnected")
        Controls["LastAction"].String = "Controller connected"
      end, 0)
    end
  )
  table.insert(NotificationIds, connNoteId)

  IsInitialized = true
  Controls["Status"].Value = 0
  Controls["Status"].String = ""
  Controls["LastAction"].String = ""

  print("Tesira Preset: Initialized — SystemId='" .. SystemId .. "' Presets=" .. NumPresets)
end
-- End Functions ---

--------------------
-- EventHandlers ---
--------------------

-- Recall buttons
for i = 1, NumPresets do
  local idx = i
  Controls["Recall" .. idx].EventHandler = function()
    RecallPreset(Controls["PresetId" .. idx].String)
  end
end

-- Save button
Controls["Save"].EventHandler = function()
  SavePreset(Controls["SavePresetId"].String)
end

-- Re-initialize when System ID changes
Controls["SystemId"].EventHandler = function()
  Initialize()
end
--End Eventhandlers-

-- Initialize --
if Controls["SystemId"].String == "" then
  Controls["SystemId"].String = "Tesira1"
end

Timer.CallAfter(Initialize, 2)
