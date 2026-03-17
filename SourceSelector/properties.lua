table.insert(props, {
  Name = "NumSources",
  Type = "integer",
  Value = 4,
  Min = 2,
  Max = 32
})

-- MinGain and MaxGain define the output level fader range.
-- Set these to match the Min/Max Output Level configured on the Tesira Source Selector block.
table.insert(props, {
  Name = "MinGain",
  Type = "double",
  Value = -100.0,
  Min = -100.0,
  Max = 0.0
})

table.insert(props, {
  Name = "MaxGain",
  Type = "double",
  Value = 12.0,
  Min = 0.0,
  Max = 36.0
})
