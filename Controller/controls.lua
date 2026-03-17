-- Setup page controls

table.insert(ctrls, {
  Name = "SystemId",
  ControlType = "Text",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})

table.insert(ctrls, {
  Name = "IPAddress",     -- reserved Q-SYS name: enables built-in IP address handling
  ControlType = "Text",
  Count = 1,
  UserPin = true,
  PinStyle = "Both"
})

table.insert(ctrls, {
  Name = "Username",      -- reserved Q-SYS name: enables built-in credential handling
  ControlType = "Text",   -- Tesira default (unprotected system): "default"
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})

table.insert(ctrls, {
  Name = "Password",      -- reserved Q-SYS name: enables built-in credential handling
  ControlType = "Text",   -- Tesira default (unprotected system): leave empty
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})

table.insert(ctrls, {
  Name = "Connect",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = 1,
  UserPin = true,
  PinStyle = "Both"
})

-- Control page controls

table.insert(ctrls, {
  Name = "Status",
  ControlType = "Indicator",
  IndicatorType = "Status",
  Count = 1,
  UserPin = true,
  PinStyle = "Output"
})

table.insert(ctrls, {
  Name = "ConnectionState",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})

table.insert(ctrls, {
  Name = "QueueDepth",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})
