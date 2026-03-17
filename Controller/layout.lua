local CurrentPage = PageNames[props["page_index"].Value]

-- Shared header graphic
table.insert(graphics, {
  Type = "Header",
  Text = "Biamp Tesira Controller",
  Position = { 0, 0 },
  Size = { 310, 32 }
})

if CurrentPage == "Control" then

  -- Status LED + state text
  table.insert(graphics, {
    Type = "Label",
    Text = "Connection",
    Position = { 5, 44 },
    Size = { 88, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })

  layout["Status"] = {
    PrettyName = "Status",
    Style = "StatusBullet",
    Position = { 98, 44 },
    Size = { 16, 16 }
  }

  layout["ConnectionState"] = {
    PrettyName = "Connection State",
    Style = "Text",
    Position = { 118, 42 },
    Size = { 182, 20 },
    FontSize = 10,
    IsReadOnly = true
  }

  -- Queue depth
  table.insert(graphics, {
    Type = "Label",
    Text = "Queue Depth",
    Position = { 5, 70 },
    Size = { 88, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })

  layout["QueueDepth"] = {
    PrettyName = "Queue Depth",
    Style = "Text",
    Position = { 98, 68 },
    Size = { 60, 20 },
    FontSize = 10,
    IsReadOnly = true
  }

elseif CurrentPage == "Setup" then

  -- System ID
  table.insert(graphics, {
    Type = "Label",
    Text = "System ID",
    Position = { 5, 44 },
    Size = { 88, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(match all child plugins)",
    Position = { 212, 44 },
    Size = { 96, 16 },
    FontSize = 8
  })
  layout["SystemId"] = {
    PrettyName = "Setup~System ID",
    Style = "Text",
    Position = { 98, 42 },
    Size = { 110, 20 },
    FontSize = 10
  }

  -- IP Address
  table.insert(graphics, {
    Type = "Label",
    Text = "IP Address",
    Position = { 5, 70 },
    Size = { 88, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  layout["IPAddress"] = {
    PrettyName = "Setup~IP Address",
    Style = "Text",
    Position = { 98, 68 },
    Size = { 160, 20 },
    FontSize = 10
  }

  -- Username
  table.insert(graphics, {
    Type = "Label",
    Text = "Username",
    Position = { 5, 96 },
    Size = { 88, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = '(default: "default")',
    Position = { 212, 96 },
    Size = { 96, 16 },
    FontSize = 8
  })
  layout["Username"] = {
    PrettyName = "Setup~Username",
    Style = "Text",
    Position = { 98, 94 },
    Size = { 110, 20 },
    FontSize = 10
  }

  -- Password
  table.insert(graphics, {
    Type = "Label",
    Text = "Password",
    Position = { 5, 122 },
    Size = { 88, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(empty if unprotected)",
    Position = { 212, 122 },
    Size = { 96, 16 },
    FontSize = 8
  })
  layout["Password"] = {
    PrettyName = "Setup~Password",
    Style = "Text",
    Position = { 98, 120 },
    Size = { 110, 20 },
    FontSize = 10
  }

  -- Connect toggle
  table.insert(graphics, {
    Type = "Label",
    Text = "Connect",
    Position = { 5, 148 },
    Size = { 88, 20 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  layout["Connect"] = {
    PrettyName = "Setup~Connect",
    Style = "Button",
    ButtonStyle = "Toggle",
    Position = { 98, 146 },
    Size = { 80, 24 },
    FontSize = 10,
    Legend = "Connect"
  }

end
