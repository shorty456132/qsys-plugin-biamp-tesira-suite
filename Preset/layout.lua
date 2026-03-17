local CurrentPage = PageNames[props["page_index"].Value]
local NumPresets = props["NumPresets"].Value

if CurrentPage == "Control" then

  -- Header
  table.insert(graphics, {
    Type = "Header",
    Text = "Presets",
    Position = { 0, 0 },
    Size = { 240, 32 }
  })

  -- Last action result
  layout["LastAction"] = {
    PrettyName = "Last Action",
    Style = "Text",
    Position = { 6, 40 },
    Size = { 224, 20 },
    FontSize = 10,
    IsReadOnly = true
  }

  -- Preset rows
  local rowY = 68
  local rowHeight = 28

  for i = 1, NumPresets do
    local y = rowY + (i - 1) * rowHeight

    table.insert(graphics, {
      Type = "Label",
      Text = "Preset " .. i,
      Position = { 5, y + 2 },
      Size = { 62, 16 },
      FontSize = 10,
      HTextAlign = "Right"
    })

    layout["PresetId" .. i] = {
      PrettyName = string.format("Presets~Preset %i~ID", i),
      Style = "Text",
      Position = { 72, y },
      Size = { 60, 20 },
      FontSize = 10
    }

    layout["Recall" .. i] = {
      PrettyName = string.format("Presets~Preset %i~Recall", i),
      Style = "Button",
      ButtonStyle = "Trigger",
      Position = { 138, y - 2 },
      Size = { 80, 24 },
      FontSize = 10,
      Legend = "Recall"
    }
  end

  -- Save section separator
  local saveY = rowY + NumPresets * rowHeight + 8

  table.insert(graphics, {
    Type = "Label",
    Text = "Save As",
    Position = { 5, saveY + 2 },
    Size = { 62, 16 },
    FontSize = 10,
    HTextAlign = "Right"
  })

  layout["SavePresetId"] = {
    PrettyName = "Save~Preset ID",
    Style = "Text",
    Position = { 72, saveY },
    Size = { 60, 20 },
    FontSize = 10
  }

  layout["Save"] = {
    PrettyName = "Save~Save",
    Style = "Button",
    ButtonStyle = "Trigger",
    Position = { 138, saveY - 2 },
    Size = { 80, 24 },
    FontSize = 10,
    Legend = "Save",
    Color = { 213, 160, 0 }
  }

elseif CurrentPage == "Setup" then

  table.insert(graphics, {
    Type = "Header",
    Text = "Presets — Setup",
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

end
