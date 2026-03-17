local NumChannels = props["NumChannels"].Value

-- Per-channel controls
for i = 1, NumChannels do
  table.insert(ctrls, {
    Name = "State" .. i,
    ControlType = "Button",
    ButtonType = "Toggle",
    Count = 1,
    UserPin = true,
    PinStyle = "Both"
  })
  table.insert(ctrls, {
    Name = "ChannelLabel" .. i,
    ControlType = "Indicator",
    IndicatorType = "Text",
    Count = 1,
    UserPin = false,
    PinStyle = "None"
  })
end

-- Status
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
