# Biamp Tesira Plugin Suite for Q-SYS

A modular set of Q-SYS plugins for controlling Biamp Tesira DSP systems. A single **Controller** plugin manages the SSH connection to the Tesira server, while **child plugins** handle individual DSP blocks — Level, Mute, Mixer, and so on.

Child plugins never connect to the Tesira directly. They send commands through the Controller, which queues them, sends them over SSH, and routes responses and live updates back. This keeps everything running through one connection.

## Plugins

| Plugin | Description |
|--------|-------------|
| [Controller](Controller/) | Manages the SSH connection to a Tesira server and routes commands to/from child plugins |
| [Level Block](Level/) | Controls a single channel of a Tesira Level block (fader + mute) |

## Why This Design?

- **Single connection** — Only the Controller opens an SSH session to the Tesira. This avoids hitting connection limits and keeps credentials in one place.
- **Scalable** — Add as many child plugins as needed. Each one independently targets a specific DSP block and channel.
- **Resilient** — The Controller handles reconnection, command queuing, and resubscription automatically. Child plugins are notified when the connection is restored and refresh on their own.

## Getting Started

1. Copy the `.qplug` files from each plugin folder into your Q-SYS Designer plugin directory.
2. Add one **Tesira Controller** plugin to your design.
3. On the Controller's **Setup** page, enter the Tesira server's IP address, username, password, and a **System ID** (default: `Tesira1`).
4. Add child plugins for each DSP block you want to control (e.g., one **Level Block** per fader channel).
5. On each child plugin's **Setup** page, set the **System ID** to match the Controller, then enter the **Instance Tag** from Tesira Designer and the channel number.
6. Toggle **Connect** on the Controller.

## Linking Child Plugins to the Controller

The **System ID** is the key that connects everything. The Controller and all of its child plugins must share the same System ID. This is how child plugins know which Controller to talk to.

- The default System ID is `Tesira1`. If you only have one Tesira system, you can leave this as-is on all plugins.
- To control multiple Tesira servers from the same Q-SYS Core, add one Controller per server and give each a unique System ID (e.g., `Tesira1`, `Tesira2`). Point each child plugin to the appropriate System ID.

## Instance Tags and Channels

Each child plugin targets a specific DSP block in the Tesira configuration using two settings:

- **Instance Tag** — The name assigned to the block in Tesira Designer. This is how the Tesira identifies which block to control.
- **Channel** — The channel index within that block (1-based). For a stereo Level block, channel 1 is left and channel 2 is right.

If you need to control both channels of a stereo Level block, use two Level Block plugins pointed at the same Instance Tag with different channel numbers.
