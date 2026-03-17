local NumPresets = props["NumPresets"].Value

-- Per-preset controls
for i = 1, NumPresets do
  table.insert(ctrls, {
    Name = "PresetId" .. i,
    ControlType = "Text",
    Count = 1,
    UserPin = true,
    PinStyle = "Both"
  })
  table.insert(ctrls, {
    Name = "Recall" .. i,
    ControlType = "Button",
    ButtonType = "Trigger",
    Count = 1,
    UserPin = true,
    PinStyle = "Input"
  })
end

-- Save controls
table.insert(ctrls, {
  Name = "SavePresetId",
  ControlType = "Text",
  Count = 1,
  UserPin = true,
  PinStyle = "Both"
})

table.insert(ctrls, {
  Name = "Save",
  ControlType = "Button",
  ButtonType = "Trigger",
  Count = 1,
  UserPin = true,
  PinStyle = "Input"
})

-- Status controls
table.insert(ctrls, {
  Name = "Status",
  ControlType = "Indicator",
  IndicatorType = "Status",
  Count = 1,
  UserPin = true,
  PinStyle = "Output"
})

table.insert(ctrls, {
  Name = "LastAction",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})

-- Setup page
table.insert(ctrls, {
  Name = "SystemId",
  ControlType = "Text",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})
