-- Control page

table.insert(ctrls, {
  Name = "Level",
  ControlType = "Knob",
  ControlUnit = "dB",
  Min = props["MinGain"].Value,
  Max = props["MaxGain"].Value,
  Count = 1,
  UserPin = true,
  PinStyle = "Both"
})

table.insert(ctrls, {
  Name = "Mute",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = 1,
  UserPin = true,
  PinStyle = "Both"
})

table.insert(ctrls, {
  Name = "Status",
  ControlType = "Indicator",
  IndicatorType = "Status",
  Count = 1,
  UserPin = true,
  PinStyle = "Output"
})

-- Setup page

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

table.insert(ctrls, {
  Name = "ChannelIndex",
  ControlType = "Text",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})
