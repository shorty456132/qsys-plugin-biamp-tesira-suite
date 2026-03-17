local CurrentPage = PageNames[props["page_index"].Value]
local BlockType = props["BlockType"].Value

if CurrentPage == "Control" then

  -- Header
  table.insert(graphics, {
    Type = "Header",
    Text = "Mute",
    Position = { 0, 0 },
    Size = { 160, 32 }
  })

  -- Mute button
  layout["Mute"] = {
    PrettyName = "Mute",
    Style = "Button",
    ButtonStyle = "Toggle",
    Position = { 34, 44 },
    Size = { 92, 36 },
    FontSize = 14,
    Legend = "MUTE",
    Color = { 213, 0, 0 }
  }

elseif CurrentPage == "Setup" then

  table.insert(graphics, {
    Type = "Header",
    Text = "Mute — Setup",
    Position = { 0, 0 },
    Size = { 300, 32 }
  })

  -- Status
  table.insert(graphics, {
    Type = "Label",
    Text = "Status",
    Position = { 5, 44 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  layout["Status"] = {
    PrettyName = "Setup~Status",
    Style = "Text",
    Position = { 100, 42 },
    Size = { 106, 20 },
    FontSize = 10,
    IsReadOnly = true
  }

  -- Block Type (read-only display of property)
  table.insert(graphics, {
    Type = "Label",
    Text = "Block Type",
    Position = { 5, 70 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = BlockType,
    Position = { 100, 70 },
    Size = { 106, 16 },
    FontSize = 10,
    HTextAlign = "Left"
  })

  -- System ID
  table.insert(graphics, {
    Type = "Label",
    Text = "System ID",
    Position = { 5, 96 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(match Controller plugin)",
    Position = { 210, 96 },
    Size = { 88, 16 },
    FontSize = 8
  })
  layout["SystemId"] = {
    PrettyName = "Setup~System ID",
    Style = "Text",
    Position = { 100, 94 },
    Size = { 106, 20 },
    FontSize = 10
  }

  -- Instance Tag
  table.insert(graphics, {
    Type = "Label",
    Text = "Instance Tag",
    Position = { 5, 122 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(from Tesira Designer)",
    Position = { 210, 122 },
    Size = { 88, 16 },
    FontSize = 8
  })
  layout["InstanceTag"] = {
    PrettyName = "Setup~Instance Tag",
    Style = "Text",
    Position = { 100, 120 },
    Size = { 106, 20 },
    FontSize = 10
  }

  -- Channel / Index
  local channelLabel = "Channel"
  if BlockType == "Mixer Input" then
    channelLabel = "Input"
  elseif BlockType == "Mixer Output" then
    channelLabel = "Output"
  end

  table.insert(graphics, {
    Type = "Label",
    Text = channelLabel,
    Position = { 5, 148 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(1-based)",
    Position = { 210, 148 },
    Size = { 88, 16 },
    FontSize = 8
  })
  layout["ChannelIndex"] = {
    PrettyName = "Setup~" .. channelLabel .. " Index",
    Style = "Text",
    Position = { 100, 146 },
    Size = { 50, 20 },
    FontSize = 10
  }

end
