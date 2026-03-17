-- MinGain and MaxGain define the fader control range.
-- These are design-time properties because the Knob control's Min/Max
-- must be set when the plugin is placed in Designer (cannot change at runtime).
-- Set these to match the Min/Max Gain limits configured on the Tesira Level block.

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
