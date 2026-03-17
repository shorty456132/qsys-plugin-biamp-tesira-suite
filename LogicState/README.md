# Biamp Tesira Logic State

Q-SYS plugin that controls a Biamp Tesira Logic State block. Provides toggle buttons for each channel with live subscription updates and channel labels fetched from Tesira. Communicates through the [Tesira Controller](../Controller/) plugin via Q-SYS Notifications — no direct network connection required.

## Requirements

- Q-SYS Designer 10.1.1+
- A **Biamp Tesira Controller** plugin in the same design, connected to the Tesira server

## Setup

1. Place the plugin in your Q-SYS design alongside a Tesira Controller plugin.
2. On the **Setup** page, configure:
   - **System ID** — Must match the Controller plugin's System ID (default: `Tesira1`).
   - **Instance Tag** — The Logic State block's instance tag from Tesira Designer.
3. The plugin automatically subscribes to live state updates and fetches channel labels.

## Properties

| Property | Type | Default | Range | Description |
|----------|------|---------|-------|-------------|
| NumChannels | integer | 4 | 1–16 | Number of state channels to control |

## Pages

| Page | Description |
|------|-------------|
| **Control** | Status LED, toggle buttons per channel with labels |
| **Setup** | System ID, Instance Tag |

## Controls

| Control | Type | Pin | Description |
|---------|------|-----|-------------|
| State*N* | Toggle Button | Input/Output | Boolean state for channel *N* |
| ChannelLabel*N* | Text Indicator | — | Label assigned to channel *N* in Tesira Designer |
| Status | Status Indicator | Output | Configuration status |

## TTP Commands Used

Based on the [Tesira Logic State Block](https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_State_Block.htm) attribute table:

| Attribute | Commands | Index |
|-----------|----------|-------|
| `state` | get, set, toggle, subscribe, unsubscribe | channel |
| `label` | get | channel |
