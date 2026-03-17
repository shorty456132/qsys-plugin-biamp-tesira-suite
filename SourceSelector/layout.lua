local CurrentPage = PageNames[props["page_index"].Value]
local NumSources = props["NumSources"].Value

if CurrentPage == "Control" then

  -- Header
  table.insert(graphics, {
    Type = "Header",
    Text = "Source Selector",
    Position = { 0, 0 },
    Size = { 260, 32 }
  })

  -- Column headers
  table.insert(graphics, {
    Type = "Label",
    Text = "Src",
    Position = { 5, 40 },
    Size = { 26, 16 },
    FontSize = 9,
    HTextAlign = "Center"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "Select",
    Position = { 33, 40 },
    Size = { 56, 16 },
    FontSize = 9,
    HTextAlign = "Center"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "Label",
    Position = { 93, 40 },
    Size = { 157, 16 },
    FontSize = 9,
    HTextAlign = "Left"
  })

  -- Source rows
  local rowY = 58
  local rowHeight = 28

  for i = 1, NumSources do
    local y = rowY + (i - 1) * rowHeight

    -- Source number
    table.insert(graphics, {
      Type = "Label",
      Text = tostring(i),
      Position = { 5, y + 4 },
      Size = { 26, 16 },
      FontSize = 10,
      HTextAlign = "Center"
    })

    -- Select toggle button (lit when this source is active)
    layout["Source" .. i] = {
      PrettyName = string.format("Sources~Source %i~Select", i),
      Style = "Button",
      ButtonStyle = "Toggle",
      Position = { 33, y },
      Size = { 56, 24 },
      FontSize = 10,
      Legend = "Select"
    }

    -- Source label (read-only)
    layout["SourceLabel" .. i] = {
      PrettyName = string.format("Sources~Source %i~Label", i),
      Style = "Text",
      Position = { 93, y + 2 },
      Size = { 157, 20 },
      FontSize = 10,
      IsReadOnly = true
    }
  end

  -- Output section
  local outputY = rowY + NumSources * rowHeight + 8

  table.insert(graphics, {
    Type = "Label",
    Text = "Output",
    Position = { 0, outputY },
    Size = { 260, 16 },
    FontSize = 10,
    HTextAlign = "Center"
  })

  -- Output level fader (horizontal)
  layout["OutputLevel"] = {
    PrettyName = "Output~Level",
    Style = "Fader",
    Position = { 10, outputY + 20 },
    Size = { 150, 34 },
    FontSize = 10
  }

  -- Output mute button
  layout["OutputMute"] = {
    PrettyName = "Output~Mute",
    Style = "Button",
    ButtonStyle = "Toggle",
    Position = { 170, outputY + 22 },
    Size = { 80, 30 },
    FontSize = 14,
    Legend = "MUTE",
    Color = { 213, 0, 0 }
  }

elseif CurrentPage == "Setup" then

  table.insert(graphics, {
    Type = "Header",
    Text = "Source Selector — Setup",
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

  -- System ID
  table.insert(graphics, {
    Type = "Label",
    Text = "System ID",
    Position = { 5, 70 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(match Controller plugin)",
    Position = { 210, 70 },
    Size = { 88, 16 },
    FontSize = 8
  })
  layout["SystemId"] = {
    PrettyName = "Setup~System ID",
    Style = "Text",
    Position = { 100, 68 },
    Size = { 106, 20 },
    FontSize = 10
  }

  -- Instance Tag
  table.insert(graphics, {
    Type = "Label",
    Text = "Instance Tag",
    Position = { 5, 96 },
    Size = { 90, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })
  table.insert(graphics, {
    Type = "Label",
    Text = "(from Tesira Designer)",
    Position = { 210, 96 },
    Size = { 88, 16 },
    FontSize = 8
  })
  layout["InstanceTag"] = {
    PrettyName = "Setup~Instance Tag",
    Style = "Text",
    Position = { 100, 94 },
    Size = { 106, 20 },
    FontSize = 10
  }

end
