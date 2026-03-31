local NumChannels = props["NumChannels"].Value

for i = 1, NumChannels do
  table.insert(ctrls, {
    Name = "Value" .. i,
    ControlType = "Indicator",
    IndicatorType = "Led",
    Count = 1,
    UserPin = true,
    PinStyle = "Output"
  })
end

table.insert(ctrls, {
  Name = "Status",
  ControlType = "Indicator",
  IndicatorType = "Status",
  Count = 1,
  UserPin = true,
  PinStyle = "Output"
})

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
