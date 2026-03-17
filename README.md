# Biamp Tesira Plugin Suite for Q-SYS

A modular set of Q-SYS plugins for controlling Biamp Tesira DSP systems. One **Controller** plugin manages the SSH connection to the Tesira server, while multiple **child plugins** (Level, Mute, Mixer, etc.) handle individual DSP blocks — all communicating through Q-SYS Notifications with zero direct network connections from child plugins.

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│  Q-SYS Core                                             │
│                                                         │
│  ┌──────────────┐   Notifications   ┌───────────────┐  │
│  │ Level Block  │◄────────────────►│               │  │
│  │ (Fader Ch.1) │                   │               │  │
│  └──────────────┘                   │               │  │
│                                     │  Controller   │  │        ┌──────────────┐
│  ┌──────────────┐   Notifications   │               │──SSH────►│ Biamp Tesira │
│  │ Level Block  │◄────────────────►│  (single SSH  │  │        │ Server       │
│  │ (Fader Ch.2) │                   │   connection) │  │        └──────────────┘
│  └──────────────┘                   │               │  │
│                                     │               │  │
│  ┌──────────────┐   Notifications   │               │  │
│  │ Future: Mute │◄────────────────►│               │  │
│  │ Mixer, etc.  │                   │               │  │
│  └──────────────┘                   └───────────────┘  │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Why This Design?

- **Single connection** — Only the Controller opens an SSH session. This avoids hitting Tesira's connection limits and keeps credential management in one place.
- **Scalable** — Drop in as many child plugins as needed. Each one independently targets a specific DSP block and channel.
- **Decoupled** — Child plugins don't know about SSH, TTP framing, or connection state. They publish commands and subscribe to responses through Notifications.
- **Resilient** — The Controller handles reconnection, resubscription, and command queuing. Child plugins are notified when the connection is restored and automatically refresh.

## Plugins

| Plugin | Description | Status |
|--------|-------------|--------|
| [Controller](Controller/) | SSH connection manager and TTP command router | Available |
| [Level Block](Level/) | Controls a Tesira Level block (fader + mute per channel) | Available |

## Getting Started

1. Copy the `.qplug` files into your Q-SYS plugin directory, or compile from source (see below).
2. In Q-SYS Designer, add one **Tesira Controller** plugin to your design.
3. Configure the Controller's **Setup** page with the Tesira server's IP, credentials, and a System ID.
4. Add child plugins (e.g., **Tesira Level Block**) for each DSP block you want to control.
5. On each child plugin's **Setup** page, set the **System ID** to match the Controller and enter the **Instance Tag** from Tesira Designer.
6. Toggle **Connect** on the Controller.

### Multiple Tesira Systems

To control multiple Tesira servers from the same Q-SYS Core, add one Controller per server and assign each a unique **System ID** (e.g., `Tesira1`, `Tesira2`). Point each child plugin's System ID to the correct Controller.

## Communication Flow

### Commands (child → Tesira)

```
Child Plugin                    Controller                      Tesira
     │                               │                             │
     │  Publish: command              │                             │
     │  "replyToken|TTP cmd"          │                             │
     │──────────────────────────────►│                             │
     │                               │  SSH: TTP cmd\n             │
     │                               │────────────────────────────►│
     │                               │                             │
     │                               │  SSH: +OK "value":...       │
     │                               │◄────────────────────────────│
     │  Publish: response.<token>     │                             │
     │  "+OK \"value\":..."           │                             │
     │◄──────────────────────────────│                             │
```

### Subscriptions (Tesira → child)

```
Child Plugin                    Controller                      Tesira
     │                               │                             │
     │  Publish: subscribe            │                             │
     │  "pubToken|subscribe cmd"      │                             │
     │──────────────────────────────►│                             │
     │                               │  SSH: subscribe cmd\n       │
     │                               │────────────────────────────►│
     │                               │                             │
     │                               │  SSH: ! "publishToken":"pubToken" "value":... │
     │                               │◄────────────────────────────│
     │  Publish: push.<pubToken>      │                             │
     │  "value"                       │                             │
     │◄──────────────────────────────│                             │
     │         (repeats on change)    │                             │
```

### Reconnection

```
Controller                      Child Plugins
     │                               │
     │  (SSH reconnects, session      │
     │   re-established)              │
     │                               │
     │  Publish: connected            │
     │  "true"                        │
     │──────────────────────────────►│
     │                               │  Re-register subscriptions
     │◄──────────────────────────────│  Re-fetch initial values
     │                               │
```

## Notification Channels

All channels are namespaced by System ID to support multiple Tesira systems.

| Channel | Direction | Purpose |
|---------|-----------|---------|
| `tesira.<SystemId>.command` | Child → Controller | Send a TTP command |
| `tesira.<SystemId>.response.<token>` | Controller → Child | One-shot command response |
| `tesira.<SystemId>.subscribe` | Child → Controller | Register a Tesira subscription |
| `tesira.<SystemId>.unsubscribe` | Child → Controller | Cancel a Tesira subscription |
| `tesira.<SystemId>.push.<token>` | Controller → Child | Live push updates from Tesira |
| `tesira.<SystemId>.connected` | Controller → Child | Session ready broadcast |

## Building from Source

Each plugin is a set of `.lua` files compiled into a single `.qplug` file using the [qsys-plugin-creator](https://github.com/q-sys-community/qsys-plugin-creator) compiler:

```bash
python compile.py Controller/
python compile.py Level/
```

## Creating New Child Plugins

To add support for a new Tesira block type (e.g., Mute, Mixer, Router):

1. Use the Level plugin as a template.
2. Replace the `level`/`mute` TTP attributes with the new block's attributes (see the [Tesira TTP Attribute Tables](https://tesira-software-help.biamp.com/)).
3. Update controls, layout, and properties to match the new block's parameters.
4. Use the same Notification channel patterns — `SendCommand()`, `RegisterSubscriptions()`, and the `connected` handler work identically for any block type.
