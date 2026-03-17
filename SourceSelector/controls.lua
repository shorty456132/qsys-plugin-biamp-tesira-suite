local NumSources = props["NumSources"].Value

-- Control page — source selection toggle buttons (active = selected)
for i = 1, NumSources do
  table.insert(ctrls, {
    Name = "Source" .. i,
    ControlType = "Button",
    ButtonType = "Toggle",
    Count = 1,
    UserPin = true,
    PinStyle = "Both"
  })
end

-- Source labels (read-only, fetched from Tesira)
for i = 1, NumSources do
  table.insert(ctrls, {
    Name = "SourceLabel" .. i,
    ControlType = "Indicator",
    IndicatorType = "Text",
    Count = 1,
    UserPin = false,
    PinStyle = "None"
  })
end

-- Output level fader
table.insert(ctrls, {
  Name = "OutputLevel",
  ControlType = "Knob",
  ControlUnit = "dB",
  Min = props["MinGain"].Value,
  Max = props["MaxGain"].Value,
  Count = 1,
  UserPin = true,
  PinStyle = "Both"
})

-- Output mute toggle
table.insert(ctrls, {
  Name = "OutputMute",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = 1,
  UserPin = true,
  PinStyle = "Both"
})

-- Status indicator
table.insert(ctrls, {
  Name = "Status",
  ControlType = "Indicator",
  IndicatorType = "Status",
  Count = 1,
  UserPin = true,
  PinStyle = "Output"
})

-- Setup page controls
table.insert(ctrls, {
  Name = "SystemId",
  ControlType = "Text",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})

table.insert(ctrls, {
  Name = "InstanceTag",
  ControlType = "Text",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})
