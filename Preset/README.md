# Biamp Tesira Preset

Q-SYS plugin that recalls and saves device-level presets on a Biamp Tesira system. Communicates through the [Tesira Controller](../Controller/) plugin via Q-SYS Notifications — no direct network connection required.

## Requirements

- Q-SYS Designer 10.1.1+
- A **Biamp Tesira Controller** plugin in the same design, connected to the Tesira server

## Setup

1. Place the plugin in your Q-SYS design alongside a Tesira Controller plugin.
2. On the **Setup** page, set the **System ID** to match the Controller plugin (default: `Tesira1`).
3. On the **Control** page, enter preset IDs into each slot and use the Recall/Save buttons.

## Properties

| Property | Type | Default | Range | Description |
|----------|------|---------|-------|-------------|
| NumPresets | integer | 4 | 1–10 | Number of preset recall slots on the Control page |

## Pages

| Page | Description |
|------|-------------|
| **Control** | Preset recall slots, save section, status LED, and last action result |
| **Setup** | System ID |

## Controls

| Control | Type | Pin | Description |
|---------|------|-----|-------------|
| PresetId*N* | Text | Input/Output | Preset ID number for slot *N* |
| Recall*N* | Trigger Button | Input | Recalls the preset in slot *N* |
| SavePresetId | Text | Input/Output | Preset ID to save to |
| Save | Trigger Button | Input | Saves current Tesira state to the specified preset ID |
| Status | Status Indicator | Output | Configuration status |
| LastAction | Text Indicator | — | Result of the last recall or save operation |

## TTP Commands Used

This plugin uses Tesira DEVICE service commands (system-wide, no Instance Tag needed):

| Command | Format | Description |
|---------|--------|-------------|
| Recall | `DEVICE recallPreset <id>` | Recalls a preset by numeric ID |
| Save | `DEVICE savePreset <id>` | Saves current state to a preset ID |
