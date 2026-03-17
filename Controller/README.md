# Biamp Tesira Controller

Q-SYS plugin that manages the SSH connection (port 22) to a Biamp Tesira server. Routes TTP commands and subscription push messages to/from child plugins (Level, Mute, Mixer, etc.) using Q-SYS Notifications.

## Requirements

- Q-SYS Designer 10.1.1+
- Biamp Tesira server with SSH (port 22) enabled

## Setup

1. Place the plugin in your Q-SYS design.
2. On the **Setup** page, configure:
   - **System ID** — A unique name for this Tesira system (default: `Tesira1`). All child plugins must use the same System ID.
   - **IP Address** — The Tesira server's IP address.
   - **Username** — SSH username (default: `default`).
   - **Password** — SSH password (leave empty for unprotected systems).
3. Toggle **Connect** to establish the SSH session.

## Pages

| Page | Description |
|------|-------------|
| **Control** | Status LED, connection state text, and command queue depth |
| **Setup** | System ID, IP address, credentials, and connect toggle |

## How It Works

The Controller acts as a central gateway between Q-SYS and the Tesira server:

1. **SSH Connection** — Connects via SSH on port 22 with interactive PTY mode. On login, sends `SESSION set verbose true` to enable verbose TTP responses.
2. **Command Routing** — Child plugins publish commands to `tesira.<SystemId>.command` as `replyToken|TTP command`. The Controller sends them FIFO (one at a time) and publishes responses back on `tesira.<SystemId>.response.<replyToken>`.
3. **Subscription Routing** — Child plugins register Tesira subscriptions via `tesira.<SystemId>.subscribe`. Push messages from Tesira (`! "publishToken":"..." "value":...`) are forwarded to `tesira.<SystemId>.push.<publishToken>`.
4. **Reconnect Handling** — On reconnect, all stored subscriptions are resubmitted. A periodic resubscription timer (every 30 seconds) keeps subscriptions alive across Tesira reboots and config pushes.
5. **Connected Broadcast** — When the session is fully ready, `tesira.<SystemId>.connected` is published so child plugins can refresh their values.

## Notification Channels

| Channel | Direction | Format | Purpose |
|---------|-----------|--------|---------|
| `tesira.<SystemId>.command` | Child → Controller | `replyToken\|TTP command` | Send a TTP command |
| `tesira.<SystemId>.response.<token>` | Controller → Child | `+OK ...` or `-ERR ...` | Command response |
| `tesira.<SystemId>.subscribe` | Child → Controller | `publishToken\|subscribe cmd` | Register a Tesira subscription |
| `tesira.<SystemId>.unsubscribe` | Child → Controller | `publishToken\|unsubscribe cmd` | Cancel a Tesira subscription |
| `tesira.<SystemId>.push.<token>` | Controller → Child | `value` | Live push update from Tesira |
| `tesira.<SystemId>.connected` | Controller → Child | `true` | Session ready notification |

## Credentials

| Role | Access |
|------|--------|
| `controller` (or higher) | Can get and set values |
| `observer` | Can only query values (read-only) |

Default credentials for an unprotected Tesira system: username `default`, password empty.
