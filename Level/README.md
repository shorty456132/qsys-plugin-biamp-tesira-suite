# Biamp Tesira Level Block

Q-SYS plugin that controls a single channel of a Biamp Tesira Level block (fader + mute). Communicates through the [Tesira Controller](../Controller/) plugin via Q-SYS Notifications — no direct network connection required.

## Requirements

- Q-SYS Designer 10.1.1+
- A **Biamp Tesira Controller** plugin in the same design, connected to the Tesira server

## Setup

1. Place the plugin in your Q-SYS design alongside a Tesira Controller plugin.
2. On the **Setup** page, configure:
   - **System ID** — Must match the Controller plugin's System ID (default: `Tesira1`).
   - **Instance Tag** — The Level block's instance tag from Tesira Designer.
   - **Channel** — The channel index to control (1-based).
3. The plugin automatically subscribes to live updates and fetches initial values once the Controller is connected.

## Pages

| Page | Description |
|------|-------------|
| **Control** | Vertical fader, mute button, and status LED |
| **Setup** | System ID, instance tag, and channel index |

## Properties

| Property | Type | Default | Range | Description |
|----------|------|---------|-------|-------------|
| MinGain | double | -100.0 | -100.0 to 0.0 | Minimum fader value in dB (set at design time) |
| MaxGain | double | 12.0 | 0.0 to 36.0 | Maximum fader value in dB (set at design time) |

Set these to match the Min/Max Gain limits configured on the Tesira Level block.

## Controls

| Control | Type | Pin | Description |
|---------|------|-----|-------------|
| Level | Knob (dB) | Input/Output | Fader level in dB |
| Mute | Toggle Button | Input/Output | Mute on/off |
| Status | Status Indicator | Output | Connection/configuration status |

## How It Works

1. The plugin publishes TTP commands to the Controller via `tesira.<SystemId>.command`.
2. It registers Tesira subscriptions for `level` and `mute` attributes with a 500ms refresh rate.
3. Live push updates from Tesira are received via `tesira.<SystemId>.push.<token>` and applied to the controls.
4. When the user moves the fader or toggles mute, a `set` command is sent through the Controller.
5. On Controller reconnect, subscriptions are re-registered and initial values are re-fetched.

## TTP Commands Used

Based on the [Tesira Level Control Block](https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Level_Control_Block.htm) attribute table:

| Attribute | Commands | Index |
|-----------|----------|-------|
| `level` | get, set, subscribe, unsubscribe | channel |
| `mute` | get, set, subscribe, unsubscribe | channel |
