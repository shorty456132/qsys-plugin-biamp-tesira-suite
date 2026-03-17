local CurrentPage = PageNames[props["page_index"].Value]
local NumChannels = props["NumChannels"].Value

if CurrentPage == "Control" then

  -- Header
  table.insert(graphics, {
    Type = "Header",
    Text = "Logic State",
    Position = { 0, 0 },
    Size = { 240, 32 }
  })

  -- Status LED
  layout["Status"] = {
    PrettyName = "Status",
    Style = "StatusBullet",
    Position = { 6, 42 },
    Size = { 16, 16 }
  }

  -- Column headers
  table.insert(graphics, {
    Type = "Label",
    Text = "Ch",
    Position = { 26, 42 },
    Size = { 22, 16 },
    FontSize = 9,
    HTextAlign = "Center"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "State",
    Position = { 52, 42 },
    Size = { 50, 16 },
    FontSize = 9,
    HTextAlign = "Center"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "Label",
    Position = { 106, 42 },
    Size = { 124, 16 },
    FontSize = 9,
    HTextAlign = "Left"
  })

  -- Channel rows
  local rowY = 62
  local rowHeight = 28

  for i = 1, NumChannels do
    local y = rowY + (i - 1) * rowHeight

    -- Channel number
    table.insert(graphics, {
      Type = "Label",
      Text = tostring(i),
      Position = { 26, y + 4 },
      Size = { 22, 16 },
      FontSize = 10,
      HTextAlign = "Center"
    })

    -- State toggle
    layout["State" .. i] = {
      PrettyName = string.format("States~Channel %i~State", i),
      Style = "Button",
      ButtonStyle = "Toggle",
      Position = { 52, y },
      Size = { 50, 24 },
      FontSize = 10,
      Legend = "OFF"
    }

    -- Channel label (read-only)
    layout["ChannelLabel" .. i] = {
      PrettyName = string.format("States~Channel %i~Label", i),
      Style = "Text",
      Position = { 106, y + 2 },
      Size = { 124, 20 },
      FontSize = 10,
      IsReadOnly = true
    }
  end

elseif CurrentPage == "Setup" then

  table.insert(graphics, {
    Type = "Header",
    Text = "Logic State — Setup",
    Position = { 0, 0 },
    Size = { 300, 32 }
  })

  -- System ID
  table.insert(graphics, {
    Type = "Label",
    Text = "System ID",
    Position = { 5, 44 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(match Controller plugin)",
    Position = { 210, 44 },
    Size = { 88, 16 },
    FontSize = 8
  })
  layout["SystemId"] = {
    PrettyName = "Setup~System ID",
    Style = "Text",
    Position = { 100, 42 },
    Size = { 106, 20 },
    FontSize = 10
  }

  -- Instance Tag
  table.insert(graphics, {
    Type = "Label",
    Text = "Instance Tag",
    Position = { 5, 70 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(from Tesira Designer)",
    Position = { 210, 70 },
    Size = { 88, 16 },
    FontSize = 8
  })
  layout["InstanceTag"] = {
    PrettyName = "Setup~Instance Tag",
    Style = "Text",
    Position = { 100, 68 },
    Size = { 106, 20 },
    FontSize = 10
  }

end
