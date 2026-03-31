# Biamp Tesira — System Controls & TTP Reference

> Source: https://tesira-software-help.biamp.com

## Table of Contents


### Overview

- Tesira Software System Control Overview
- Logic Charts

### TTP - Tesira Text Protocol

- TTP Syntax
- TTP Subscriptions
- TTP Responses
- TTP Troubleshooting
- TTP Security
- RS-232
- Telnet
- SSH

### Attribute Tables - Service Addresses

- Device
- Session

### Attribute Tables - IO Blocks

- Audio Input Block
- Audio Output Block
- AEC Input & Processing Blocks
- ANC Input & Processing Blocks
- AV Input Block
- AV Output Block

### Attribute Tables - Network Blocks

- Attero Tech Input Block
- Attero Tech Output Block
- AVB Input Block
- AVB Output Block
- CobraNet Input Block
- CobraNet Output Block
- Dante Input Block
- Dante Output Block

### Attribute Tables - Comms Blocks

- EX-UBT, EX-USB, & USB X Blocks
- USB Input Block
- USB Output Block
- VoIP Receive Block
- VoIP Transmit Block
- VoIP Control Status Block
- VoIP X Control Status Block
- VoIP / VoIP X Transfer
- VoIP Call State Commands
- TC Call State Commands
- TI Transmit Block
- TI Receive Block
- TI Control Status Block

### Attribute Tables - Mics

- Parle Mic Beam Blocks
- SHURE Mic Block
- Audio-Technica Mic Block

### Attribute Tables - Amps

- Voltera A Series Blocks
- Voltera D/DM Series Blocks
- TesiraXEL 1200 Block
- Parle PoE AMP Blocks
- Tesira Amplifier Blocks
- Lab Gruppen Amplifier Block

### Attribute Tables - Paging

- Paging Zone Block
- Paging Control

### Attribute Tables - Mixers

- Gating Auto Mixer Block
- Gain Sharing Auto Mixer Block
- Standard Mixer Block
- Matrix Mixer Block
- Auto Mixer Combiner Block
- Room Combiner Block

### Attribute Tables - Equalizers

- Parametric Equalizer Block
- Graphic Equalizer Block
- Feedback Suppressor Block
- Frequency Shift

### Attribute Tables - Filters

- Pass Filter Block
- Shelf Filter Block
- All Pass Filter Blocks
- Uber Filter Block
- FIR Filter Block

### Attribute Tables - Crossovers

- Crossover Block

### Attribute Tables - Dynamics

- Leveler Block
- Compressor Block
- Peak Limiter
- Ducker Block
- AI Noise Reduction Block
- Noise Gate Block
- AGC Block

### Attribute Tables - Routers

- Router Block
- Source Selector Block
- AV Router Block

### Attribute Tables - Delay

- Audio Delay Block

### Attribute Tables - Control Blocks

- Level Control Block
- Invert Control Block
- Mute Control Block
- Preset Control Block
- Command String Block
- Dialer Block
- DTMF Decode Block
- HD-1 Block
- Parle Processing Block

### Attribute Tables - Meters

- Signal Present Meter Block
- Audio Meter Block

### Attribute Tables - Generators

- Tone Generator Block
- Noise Generator Block

### Attribute Tables - Logic Blocks

- Logic Gate Block
- Logic State Block
- Logic Pulse Block
- Logic Sequence Block
- Logic Selector Block
- Flip Flop Block
- Logic Delay Block
- Logic Meter Block
- Logic Input Block
- Logic Output Block
- Control Voltage Block

---


# Overview


# Tesira Software System Control Overview

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Software_System_Control_Overview.htm

Tesira Software Help

[Click here to see this page in full context](#)

# Tesira Software System Control Overview

Once a system design is compiled and downloaded into Tesira Server devices, the system can be controlled in real-time via the TesiraÂ software. The extent of control can be limited with different password levels.Â 

Â Â

Â Â

## Third Party Control

After initial programming & configuration,Â Tesira systems may be controlled by RS-232 communication from third-party control systems, such as AMXÂ®or CrestronÂ®, using a Serial Control Port or Ethernet Connection.Â 

The ability for Tesira Server, Server IO, Tesira Amplifiers or TesiraFORTÃÂ devices to use Telnet or SSH can be enabled or disabled via aÂ [Device](Attribute_Tables/Service_Addresses/Device.htm) TTP commandÂ or in theÂ [Device MaintenanceÂ Network Settings](../Tabs/System/Device_Maintenance/Device_Maintenance_Network_Settings.htm)Â dialog. AÂ Tesira Text Protocol (TTP)Â is used to interface to third party controllers.Â

Â Â

Â Â

## Tesira Text Protocol (TTP)

Tesira can be controlled via the control dialog menusÂ in theÂ Tesira software, viaÂ third-partyÂ controllers or via a computer based terminal application. Supported connection methods include serialÂ RS-232Â or Ethernet. If using Ethernet aÂ TelnetÂ orÂ Secure Shell Console (SSH)Â session can be initiated.Â 

Â Â

To facilitate external control of Tesira servers BiampÂ uses TTP. This allows external control of a programmed TesiraÂ system via ASCII characters.Â

Â Â

TTP command strings allow the control ofÂ AttributesÂ orÂ Services. AnÂ AttributeÂ defines the portion of the DSP Processing block to be controlled such as a fader level, crosspoint mute, and would depend on the specific DSP processing block. AÂ ServiceÂ defines an instruction and function specific to a DSP Processing block (such as theÂ dialer blockÂ dial command), Tesira Hardware (Such as aÂ DeviceÂ Command referencing a Tesira Server) or to perform a system wide command such as recalling aÂ [Preset](../Tabs/View/Show/Preset_Manager.htm).Â

Â Â

The command is case sensitive and uses upper and lower case characters. A line feed needs to be sent after each command. See [TTP Syntax](Tesira_Text_Protocol/TTP_Syntax.htm) for additional details.Â

Â Â

TTP has built in error handling and the response will indicate the reason and location in the command where an error has been encountered. An error response will includeÂ -ERRÂ at the beginning of the response. A successful response will includeÂ +OKÂ at the beginning of the response. Review theÂ ResponsesÂ section for examples.Â

Â Â

When Online with the Tesira Software any Attribute or Service changes made via TTP will update the values in real time.Â

Â Â

When online - selecting a processing block will show theÂ Instance IDÂ in the Left hand Corner of the [Status bar](../Software_Tools/Workspaces/Status_Bar.htm).Â 

Â Â

### String Structure

The commands outlined in this manual are formatted so that any command not in square brackets must be defined as part of the command. These include theÂ Instance Tag,Â CommandÂ andÂ AttributesÂ of a command.Â

Any commands shown in square brackets (such asÂ [Index]Â andÂ [Value]Â )are dependent on the command being performed. They may not be required at all in which case no value is entered.Â

Â Â

### TTP in Multiple Device Systems

Commands that act on the entire system (For Example- start audio) are forwarded to all the devices automatically, and commands that act on a block (such as set attribute) are automatically forwarded to the device hosting the block.Â 

Â Â

### TTP Resources

To generate command strings to control TesiraÂ products a calculator is available on Cornerstone:Â [TTP Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)Â 

Â Â

Â Â

Â Â


---


# Logic Charts

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Logic_Charts.htm

Tesira Software Help

[Click here to see this page in full context](#)

# Logic Charts

Overview of Logic and Logic Capable Blocks and their operation.Â

Â Â

Â Â

## Logic Capable Blocks

### IO

#### AV Input

Â

| Logic I/O | Operation | |
| --- | --- | --- |
| 6 Logic Outputs - 3 for HDMI status and 3 for Display Port Status | Logic 1 on H Con - HDMI connected Logic 0 on HI Con - HDMI not connected  Logic 1 on D Con - DisplayPort connected Logic 0 on D Con - DisplayPort not connected Logic 1 onÂ H Rx - HDMI receiving frames Logic 0 onÂ H Rx - HDMI not receiving frames Logic 1 on D Rx DisplayPort receiving frames Logic 0 on D Rx DisplayPort not receiving frames  Logic 1 on H Act - HDMI is active Logic 0 on H Act - HDMI is not active Logic 1 on D Act - DisplayPort is active Logic 0 on D Act - DisplayPort is not active. | |

#### AV Output

Â

| Logic I/O | Operation |
| --- | --- |
| 2 Logic Outputs - 2 for HDMI status | Logic 1 on H Con - HDMI connected Logic 0 on H Con - HDMI not connected  Logic 1 onÂ H Tx - HDMI Transmitting Logic 0 onÂ H Tx - HDMI not Transmitting |

Â Â

### FORTÃ

#### USB X Input

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input for USB connected state 1 logic input for streaming state 1 logic input for mute synchronization state | Logic 0 on M = USB Audio Output Unmuted Logic 1 on M = USB Audio Output Muted Logic 0 on C = USB Output Not Connected Logic 1 on C = USB Output ConnectedÂ  Logic 0 on S = USB Audio Output Not Streaming Logic 1 on S = USB Audio Output StreamingÂ  Logic low on H = USB Host is On Hook (Idle, not in an active call, or on hold)Â  Logic high on H = USB Host is Off Hook (Active call) |

#### USB X Output

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic output for USB connected state 1 logic output for streaming state 1 logic output for mute state | Logic 0 on M = USB Audio Output Unmuted Logic 1 on M = USB Audio Output Muted Logic 0 on C = USB Output Not Connected Logic 1 on C = USB Output ConnectedÂ  Logic 0 on S = USB Audio Output Not Streaming Logic 1 on S = USB Audio Output StreamingÂ  Logic low on H = USB Host is On Hook (Idle, not in an active call, or on hold)Â  Logic high on H = USB Host is Off Hook (Active call) |

Â Â

### Comms

#### TI Control / Status

Â

| Logic I/O | Operation |
| --- | --- |
| 2 logic inputs and 10 logic outputs | Logic 1 on HS input picks up the line or âtakes off hookâ. Logic 0 causes the line to hang up or âPut back on hookâ Transition from logic 0 to logic 1 on HF input causes a hook flash. Logic 1 on RI = line is ringing Logic 0 on RI = line is not ringing Logic 1 on DIP = Dialing in progress Logic 0 on DIP = Not dialing Logic 1 on HSS = Off hook Logic 0 on HSS = On hook Logic 1 on DTD = Dial tone detected Logic 0 on DTD = No dial tone Logic 1 on BTD = Busy tone detected Logic 0 on BTD = Busy tone not detected Logic 1 on RTD = Ring tone detected Logic 0 on RTD = No ring tone detected Logic 1 on LR = Line ready Logic 0 on LR = Line not ready Logic 1 on LIU = Line in use Logic 0 on LIU = Line not in use Logic 1 on LI = Line intrusion Logic 0 on LI = No line intrusion Logic 1 on LF = Line fault detected Logic 0 on LF = No line faults |

#### VoIP Control / Status

Â Â

| Logic I/O | Operation |
| --- | --- |
| 24 logic inputs (two per appearance per line) and 26 logic outputs (two per appearance per line plus 2 per line) | Transition from 0 to 1 on ANS x.y answers the call on appearance x line y Transition from 0 to 1 on END x.y ends the call on appearance x line y Â   Logic 1 on RI x.y indicates appearance x on line y is ringing Logic 1 on LIU x.y indicates appearance x on line y is in use Logic 1 on LR1 (LR2) = Line 1 (2) in line ready mode Logic 0 on LR1 (LR2) = Line 1 (2) in not ready mode |

#### Input EX-USB

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input for USB connected state 1 logic input for streaming state 1 logic input for mute synchronization state | Logic 0 on M = USB Host Unmuted Logic 1 on M = USB Host MutedÂ   Logic 0 on C = USB Host Not Connected Logic 1 on C = USB Host ConnectedÂ   Logic 0 on S = USB Host Not Streaming Logic 1 on S = USB Host Streaming |

#### Output EX-USB

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic output for USB connected state 1 logic output for streaming state 1 logic output for mute state | Logic 0 on M = USB Audio Output Unmuted Logic 1 on M = USB Audio Output MutedÂ  Logic 0 on C = USB Output Not Connected Logic 1 on C = USB Output ConnectedÂ   Logic 0 on S = USB Audio Output Not Streaming Logic 1 on S = USB Audio Output StreamingÂ  Logic low on H = USB Host is On Hook (Idle, not in an active call, or on hold)Â  Logic high on H = USB Host is Off Hook (Active call)Â |

#### Input EX-UBT

| Logic I/O | Operation |
| --- | --- |
| 1 logic input for USB connected state 1 logic input for streaming state 1 logic input for mute synchronization state | Logic 0 on M = USB Host Unmuted Logic 1 on M = USB Host Muted  Logic 0 on C = USB Host Not Connected Logic 1 on C = USB Host Connected  Logic 0 on S = USB Host Not Streaming Logic 1 on S = USB Host Streaming |

#### Output EX-UBT

| Logic I/O | Operation |
| --- | --- |
| 1 logic output for USB connected state 1 logic output for streaming state 1 logic output for mute state | Logic 0 on M = USB Audio Output Umuted Logic 1 on M = USB Audio Output Muted Logic 0 on C = USB Output Not Connected Logic 1 on C = USB Output Connected Logic 0 on S = USB Audio Output Not Streaming Logic 1 on S = USB Audio Output StreamingÂ  Logic low on H = USB Host is On Hook (Idle, not in an active call, or on hold)Â  Logic high on H = USB Host is Off Hook (Active call) |

#### Bluetooth EX-UBT Control / Status

Â

| Logic I/O | Operation |
| --- | --- |
| 2 logic inputs for Bluetooth state (enable/disable)Â 2 logic outputs for Bluetooth status | Logic 0 on E = Bluetooth Disabled Logic 1 on E = Bluetooth Enabled  Logic 0 on D = Bluetooth Not Discoverable Logic 1 on D = Bluetooth Discoverable  Logic 0 on C = Bluetooth Not Connected Logic 1 on C = Bluetooth Connected  Logic 0 on S = Bluetooth Not Streaming Logic 1 on S = Bluetooth StreamingÂ |

Â Â

### Mics

#### Audio-TechnicaÂ

Â

| Logic I/O | Operation |
| --- | --- |
| 3 logic inputs (per mic, dependent on settings specified in the Initialization dialog), up to 64 per block 1 logic output per channel, up to 64 per block | Logic 0 on RG =Â Red LEDÂ Logic 1 on RG = Green LEDÂ   Logic 0 on R = Red LED off Â (independent of G state) Logic 1 on R = Red LED on Â (independent of G state)Â   Logic 0 on G = Green LED off Â (independent of R state) Logic 1 on G = Green LED on Â (independent of R state)Â  Logic 0 on M = Channel Unmuted Logic 1 on M = Channel MutedÂ   Logic 0 onÂ xÂ = Microphone currently Unmuted Logic 1 onÂ xÂ = Microphone currently Muted |

#### ParlÃ© Amp

| Logic I/O | Operation |
| --- | --- |
| 2 logic outputs for Faults and Warnings | Logic 0 on F = No Fault Present Logic 1 on F = Fault PresentÂ  Logic 0 on W = No Warning Present Logic 1 on W = Warning Present |

#### ParlÃ© Mics

Â Â

| Logic I/O | Operation |
| --- | --- |
| Up to 3 logic inputs (per mic, dependent on settings specified in the initialization dialog) Mute logic may be grouped to a single input Up to 2 Logic output channels (per mic, dependent on settings specified in the initialization dialog) | Logic 0 on Mx = Channel Unmuted Logic 1 on Mx = Channel MutedÂ   Logic 0 on LEDx = LED off Logic 1 on LEDx &Â  Logic 0 on RGx = Red LED Logic 1 on LEDx & Logic 1 on RGx = Green LEDÂ   Logic 0 on output Mx = Channel Unmuted Logic 1 on output Mx = Channel Muted Â   Optional for TTM-X only:  Logic 0 on output Bx = Channel Logic Low (physical button is not pressed) Logic 1 on output Bx = Channel Logic High (physical button is pressed) |

#### ParlÃ© Beam

Â

| Logic I/O | Operation |
| --- | --- |
| Logic inputs control the individual Beam Mute States Logic outputs reflect individual Beam Mute States | Logic 0 = Beam UnmutedÂ Logic 1 = Beam Muted |

Â Â

### Amps

#### AMP-450P /Â AMP-450BP

Â

| Logic I/O | Operation |
| --- | --- |
| 2 logic outputs for Faults and Warnings | Logic 0 on F = No Fault Present Logic 1 on F = Fault PresentÂ   Logic 0 on W = No Warning Present Logic 1 on W = Warning Present |

#### TesiraXEL 1200

Â

| Logic I/O | Operation |
| --- | --- |
| 4 logic outputs for Warning 4 logic outputs for Fault | Logic 0 on F = No Fault Present Logic 1 on F = Fault Present  Logic 0 on W = No Warning Present Logic 1 on W = Warning Present |

#### Voltera D

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic output for mute state. 4 logic outputs for Warning 4 logic outputs for Fault (8 of each on 8 channel blocks) | Logic 0 on M = Audio Outputs UnmutedÂ  Logic 1 on M = All Audio Outputs Muted  Logic 0 on F = No Fault PresentÂ  Logic 1 on F = Fault Present  Logic 0 on W = No Warning PresentÂ  Logic 1 on W = Warning Present |

#### Voltera DM

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic output for mute state. 2 logic outputs for Warning 2 logic outputs for Fault (4 of each on 4 channel blocks) | Logic 0 on M = Audio Outputs UnmutedÂ  Logic 1 on M = All Audio Outputs Muted  Logic 0 on F = No Fault PresentÂ  Logic 1 on F = Fault Present  Logic 0 on W = No Warning PresentÂ  Logic 1 on W = Warning Present |

Â Â

### Paging

#### Paging Zone

Â

| Logic I/O | Operation |
| --- | --- |
| 1 Logic Output | Active High when page is active in the zone, low when zone is not being used for paging. |

Â Â

### Mixer

#### Gating Auto Mixer

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic output per input channel, up to 256 channels per block | Logic output normally Logic 0 Switches to Logic 1 as long as corresponding input channel is gated on. Optional: Behavior of logic output may be inverted in control dialog. |

#### Gain Sharing Room Combiner

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input per partition plus 5 source selection inputs (4 sources + Off) per room, up to 32 rooms (58 partitions) per blockÂ Â  1 logic output per partition plus 5 source selection outputs (4 sourcesÂ + Off) per room, up to 32 rooms (58 partitions) per block | Logic 0 on partition input causes partition to remain open. Logic 1 on partition input causes partition to remain closed Transition from logic 0 to 1 on source inputs selects the corresponding audio source (or Off) for the corresponding room Logic 0 on partition output indicates partition is open Logic 1 on partition output indicates partition is closed Logic 1 on any source selection output indicates that source (or Off) is selected for that room |

Â Â

### Dynamics

#### AGC

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic output | A logic 1 indicates the AGC is applying or reducing gainÂ In Speech Mode, a logic 1 indicates Speech is being detected |

#### Ducker

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input and 1 logic output | 1 on logic input causes program audio to duck and logic output to be 1.Â 0 causes program to un-duck.Â Audio signal exceeding threshold on sense input causes logic output to be 1.Â Audio signal below threshold causes logic output to be 0.Â *Optional: Behavior of logic control may be inverted in Control Dialog.* |

Â Â

### Routers

#### Source Selector

Â

| Logic I/O | Operation |
| --- | --- |
| 1 Logic input per channel, up to 32 channelsÂ Â Â 1 Logic output per channel, up to 32 channels | Transition from logic 0 to 1 on logic inputs selects the corresponding audio sourceÂ  Logic outputs normally logic 0. Logic 1 on logic output indicates corresponding audio source is selected |

Â Â

### Controls

#### Level

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input for level up (+) on each audio channel. 1 logic input for level down (-) on each audio channel. Up to 32 audio channels per block (64 ganged) | Logic 1 input to (+) causes level to ramp up. Logic 1 input to (-) causes level to ramp down. Â   Optional:  Disable ramping Transition from logic 0 to 1 on (+) causes audio to increment up. Transition from logic 0 to 1 on (-) causes audio to increment down. |

#### Mute

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input and output per audio channel, up to 16 channels per block (56 ganged) | Logic input 1 causes audio channel to mute. Logic input 0 causes audio channel to un-mute. |

#### Preset Button

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input per preset, up to 10 presets per block | Transition from logic 0 to logic 1 triggers preset to recall |

#### Network Command String

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input per command string, up to 32 per block.Â Logic outputs as defined by the user up to 32 per block. | Transition from logic 0 to 1 triggers command string to output network port. Logic outputs pulse for 250 ms when expected response string is matched. |

#### Serial Command String

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input per command string, up to 32 per block | Transition from logic 0 to 1 triggers command string to output serial port. |

#### TI Dialer

Â

| Logic I/O | Operation |
| --- | --- |
| 19 logic inputs and 1 logic output | Transition from logic 0 to logic 1 on input 1 to 16 causes the associated speed dial number to be dialed. Transition from logic 0 to logic 1 on Redial input causes the last number to be redialed. |

#### VoIP Dialer

Â

| Logic I/O | Operation |
| --- | --- |
| 34 logic inputs (17 for each line) | Transition from logic 0 to logic 1 on input 1-x to 16-x causes the associated speed dial number in the corresponding line to be dialed. Transition from logic 0 to logic 1 on Rdl-x input causes the last number to be redialed in the corresponding line. |

#### DTMF Decode

Â

| Logic I/O | Operation |
| --- | --- |
| 17 logic outputs | Logic outputs 1 thru D pulse high for 250msec when the corresponding DTMF tone is detected.Â Logic output Any pulses high for 250msec when any DTMF tone is detected. |

#### HD-1

Â

| Logic I/O | Operation |
| --- | --- |
| 1 Mute 4 Outputs | Mute logic output is a latching signal that follows the state of the mute button of the HD-1 hardware. Soft button logic outputs 1 through 4 will trigger a logic 1 for 200ms when the corresponding HD-1 hardware soft button is pushed. Â |

#### ParlÃ© Processing

Â

| Logic I/O | Operation |
| --- | --- |
| 2 logic outputs per Mic for Mic Active and AGC. One additional output for Mute Status | Logic 0 on Mic # Active = Mic Inactive  Logic 1 on Mic # Active = Mic Active  Logic 0 on Mic # AGC = AGC Inactive  Logic 1 on Mic # AGC = AGC Active  Logic 0 on Mute Indicator = Mute Inactive  Logic 1 on Mute Indicator = Mute Active |

Â Â

### Meters

#### Signal Present Meter

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic output per meter, up to 32 per block | Audio signal exceeding threshold on sense input causes logic output to be 1.Â Audio signal below threshold causes logic output to be 0.Â |

Â Â

Â Â

## Logic Blocks

### Logic Input

Â

| Logic I/O | Operation |
| --- | --- |
| Up to 16 channels | Open on logic input = Logic 1 Closure on logic input= Logic 0  Optional:  Behavior of logic control may be inverted in Control Dialog. |

### Logic Output / LED Driver

Â Â

| Logic I/O | Operation |
| --- | --- |
| Up to 16 channels | In Logic mode:  * Logic 1 on logic output = open * Logic 0 on logic input = closure  In LED Driver mode:  * Logic 1 on logic output = Up to 24V/500mA * Logic 0 on logic input = Short to ground   Optional:  Behavior of logic control may be inverted in Control Dialog. |

### Logic Delay

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input and 1 logic output per delay, up to 32 per block | 1 on logic input must be present for specified ON time before logic output changes to 1. 0 on logic input must be preset for specified OFF time before logic output changes to 0. |

### OR Gate

Â

| Logic I/O | Operation | | |
| --- | --- | --- | --- |
| 2 - 32 logic inputs and 1 logic output | 1 at either or both logic inputs causes a 1 at logic output. Otherwise, logic output is 0. | | |
| Input 1 | Input 2 | Output |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### AND Gate

Â

| Logic I/O | Operation | | |
| --- | --- | --- | --- |
| 2 - 32 logic inputs and 1 logic output | 1 at both inputs causes a 1 at logic output. Otherwise, logic output is 0. | | |
| Input 1 | Input 2 | Output |
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

### NOT Gate

Â

| Logic I/O | Operation | | |
| --- | --- | --- | --- |
| 1 logic input and 1 logic output per gate, up to 32 per block | 1 at logic input causes a 0 at logic output. 0 at logic input causes a 1 at logic output. | | |
| Input | Output |
| 1 | 0 |
| 0 | 1 |

### NOR Gate

Â

| Logic I/O | Operation | | |
| --- | --- | --- | --- |
| 2 - 32 logic inputs and 1 logic output | 0 at both logic inputs causes a 1 at logic output.Â Otherwise, logic output is 0.Â (Logically the same as an OR gate followed by a NOT gate.)Â | | |
| Input 1 | Input 2 | Output |
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

### NAND Gate

Â

| Logic I/O | Operation | | |
| --- | --- | --- | --- |
| 2 - 32 logic inputs and 1 logic output | 1 at both logic inputs causes a 0 at logic output.Â Otherwise, logic output is 1.Â (Logically the same as an AND gate followed by a NOT gate.)Â | | |
| Input 1 | Input 2 | Output |
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### XOR Gate

Â

| Logic I/O | Operation | | |
| --- | --- | --- | --- |
| 2 - 32 logic inputs and 1 logic output | 1 at either but not both logic inputs causes a 1 at logic output.Â Otherwise, logic output is 0. | | |
| Input 1 | Input 2 | Output |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### Flip Flop

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input and 1 logic output per gate, up to 32 per block | 0 to 1 transition at logic input causes logic output to toggle from its present state to the opposite state. |

### Logic Meter

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input per meter, up to 32 per block | Logic 1 on input node turns corresponding indicator onÂ Logic 0 on input node turns corresponding indicator off |

### Logic State

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic output per state, up to 32 per block | Setting a State On causes the corresponding logic output to be 1. Setting the State Off causes the corresponding logic output to be 0 |

### Logic Selector

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input and output per state, up to 32 per block | Setting a State On causes the corresponding logic output to be 1. Setting the State Off causes the corresponding logic output to be 0. Outputs mutually exclusive, only one can be high at a time. |

### Logic Pulse

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input and 1 logic output per channel, up to 32 per block | A rising-edge logic value on an input will trigger a pulse to start on that channelâs output. If a pulse is already running when an input trigger occurs, it will be stopped instead of started. |

### Logic Sequence

Â

| Logic I/O | Operation |
| --- | --- |
| 1 logic input and 1 - 32 logic outputs | Transition from logic 0 to logic 1 on the input will start (or stop if already running) the configured sequence. All outputs are participants of the sequence and will behave as configured by the user. |

### Fan-In OR Pulse

Â

| Logic I/O | Operation |
| --- | --- |
| 2 - 32 logic inputs and 1 logic output | Transition from logic 0 to logic 1 on any of the inputs generates a 150ms logic pulse on the output. A de-bounce delay of 300ms is used after the initial pulse |

Â Â

Â Â

Â Â


---


# TTP - Tesira Text Protocol


# TTP Syntax

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Syntax.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Syntax

TheÂ Services CodeÂ defines a instruction and function for a DSP block to perform. TheÂ Attribute CodeÂ defines the portion of the DSP block to be controlled such as a fader level. Each element of the command instruction is delimited by a single space. The commands are case sensitive and upper and lower case characters are used.Â 

Â Â

Â Â

## Instance Tag

TheÂ Instance TagÂ is case sensitive and is the unique name of a software object used in a TesiraÂ project. The Instance Tag can be found when disconnected from the System in theÂ DSP Properties tab of the [Properties](../../Tabs/View/Show/Properties.htm) docking menu. This defaults to the object code when compiled but can be customized by the user. The TesiraÂ compiler will also check for duplicate Instance Tags. Instance tags can be defined within speech marks. If instance tags have no spaces they do not require speech marks. Instance tags can be numerical and contain spaces. Any Customized Instance tags that contain spaces must be defined within speech marks.Â Duplicate instance tags are not allowed. If duplicates are created a dialog will appear allowing editing of the tags.Â 

Â Â

Note: The following Instance Tag characters are illegal:Â / &Â 

Â Â

### Available Instance Tags

AÂ [Session](../Attribute_Tables/Service_Addresses/Session.htm)Â command can be used to get a listing of available Instance Tags. Any devices that have an incomplete audio path will not be listed.Â 

Â

#### ExampleÂ

SESSION get aliasesÂ

+OK "list":["123" "AudioMeter1" "AudioMeter2" "AudioMeter3" "DEVICE" "Input1" "Mixer1" "Mute1" "Level1" "Output1"]Â

Â Â

#### Example - Using an Instance Tag Called Level1Â

Level1 get level 1Â

+OK "value":0.000000Â

Â Â

#### Example -Â Instance tags can contain spaces enclosed in speech marksÂ

"my level 2" get level 1Â

+OK "value":-10.000000Â

Â Â

Missing speech marks will return an error:Â

my level 2 get level 1Â

-ERR address not found: {"deviceId":0 "classCode":0 "instanceNum":0}Â

Â Â

#### Example - Instance Tags may be NumericalÂ

123 get level 1Â

+OK "value":-10.000000Â

Â Â

Â Â

## Command

The Command field specifies what is to be done with the DSP processing block Attribute.Â TesiraÂ Text Protocol supports different Attribute commands as listed below. These are case sensitive and the availability of the command would depend on the DSP object Attribute Code. The following table shows the Commands which only apply to Attribute Codes. An Attribute Code may not support all of them, but it will support at least one.Â Â 

Â Â

Â Â

## Attribute

The attribute Code defines the portion of the DSP Processing block to be controlled such as a fader level, crosspoint mute, etc.Â 

Â Â

Â Â

## Service

The Services Code defines a instruction and function for a Hardware item to perform or a system wide command such as recalling a Preset. Any Service Code commands do not use AttributeÂ CommandsÂ such as get, set, etc. Instead they use their own commands such asÂ recallPresetÂ orÂ dial.Â

Â Â

Â Â

## Index

Attribute Codes use Index fields to refer to inputs, outputs, or cross attribute of a DSP Block. Due to the different types of DSP blocks, some attributes will not require and Index so no value should be used. Some DSP blocks require a single index such as a level control. Some DSP blocks require 2 indexes such as a matrix mixer. The first index would be the Input or Row and the second index would be the Output or Column.Â

Â Â

For aÂ Crossover,Â IndexÂ bandÂ is indexed by number from high to low, so in a four-way crossover high=1, mid high=2, low mid =3 and low=4.Â filterÂ is indexed by number. 1 is the high cutoff frequency for each band while 2 is the low.Â

Â Â

#### Example -Â Index values can be Encased in Double Quotes

Mixer1 set crosspoint 1 1 true +OK Mixer1 set crosspoint "1""1" true +OKÂ 

Â Â

When aÂ subscriptionÂ command is configured a unique custom name can be used in the second Index of the command line. This is used as the identifier for the subscribed item.Â

Â Â

Some Service Codes use index fields to define the hardware channel that is being controlled. For example, aÂ Dialer BlockÂ will require theÂ lineÂ andÂ Call appearanceÂ indexes to be specified.Â

Â Â

Â Â

## Value

Value determines what a DSP block is being set to, incremented by, or decremented by. TheÂ interface definition tablesÂ define which type of value the string will need in order to execute the TTP string.Â

Â Â

A TTP value will depend on the attribute being controlled. It can be:Â

* A numberÂ
* A string (in double quotes)Â
* A Boolean (true or false)Â
* nullÂ

Â Â

| Required Action | Value Example | Description |
| --- | --- | --- |
| Â Turn On | Â true | Refers to the 'on' state of a processing object component with two states such as a crosspoint, mute or similar.Â |
| Â Turn Off | Â false | Refers to the 'off' state of a processing object component with two states such as a crosspoint, mute or similar.Â |
| Â Adjust Level (set, increment, decrement) | Â 1.0 -1.0 -15 etc... | A numerical decimal value used to represent the new state.Â For a 'set' command this will move the value to the specified level. For an increment it will adjust the value from the current value by the specified amount. |
| Â State | Â BUTTERWORTH | A text string can be used to represent a value such as a filter type |
| Â Preset | Â 1001 | An Integer that is the required state. |

Â Â

Â Â

## Special Addresses

### Device

The local unit currently connected. SeeÂ [Device](../Attribute_Tables/Service_Addresses/Device.htm)Â for a full listing of commands.Â 

| Instance Tag | Command | Attribute Code | Index | Line\_Feed |
| --- | --- | --- | --- | --- |
| Â DEVICE | Â get | Â ipStatus | Â interface | Â LF |

Â Â

### Session

The currentÂ RS-232,Â TelnetÂ orÂ SSHÂ text session. See [Session](../Attribute_Tables/Service_Addresses/Session.htm)Â for a full listing of commands.Â 

| Instance Tag | Command | Attribute Code | Value | Line\_Feed |
| --- | --- | --- | --- | --- |
| Â SESSION | Â set | Â Verbose | Â false | Â LF |

Â Â

Â Â

Â Â


---


# TTP Subscriptions

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Subscriptions.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Subscriptions

Subscriptions enable the updating of metering and level values to be sent to a external control system without the control system requesting information.Â

Elements of a processing object can be subscribed to such as channel levels and meters. TheÂ Attribute tablesÂ will indicate which functions support subscription.Â

If subscriptions are used the TesiraÂ server may be sending back replies that were not individually requested from the control system (they were subscribed to). All subscribed objects will be preceded by a ! "publishToken"Â statement would indicate to the control system that the returned packet is from a subscription not a response to a command that was just sent.Â

Subscriptions are lost when the TesiraÂ server is rebooted or a change in configuration is sent to the system. Subscriptions can be revalidated by subscribing to the same block at regular intervals. If this is done ensure that the custom label used inÂ IndexÂ is used in the re-subscription. If this label is not included it is possible to inadvertently open multiple subscriptions to the same call state.Â

Â Â

**Instance\_Tag Command Attribute [Index] [Value] LF**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.

For additional information on individual elements of a TTP string please review the [TTP Syntax](TTP_Syntax.htm) page.

Â Â

## Subscribe

An example subscribing to a level with a 500ms refresh.Â

| Instance Tag | Command | Attribute Code | Index | Index | Value |
| --- | --- | --- | --- | --- | --- |
| Â MyLevel1 | Â subscribe | Â level | Â 1 | Â MyLevelName | Â 500 |

### Verbose Subscription Responses

When the subscription command is first sent the first reply will be:Â

! "publishToken":"[CustomName]" "value":[Value] +OKÂ

Â Â

Subsequent subscription replies will be formatted:Â

! "publishToken":"[CustomName]" "value":[Value]Â

* TheÂ [CustomName]Â is used as an identifier. The identifier returned is specified in the Index field of the original subscribe command. This name can then be used in a parsing routine for the subscribed item. If no identifier is specified then empty double speech-marks ("") are shown in the response as a delimiter.Â
* TheÂ [Value]Â is the current state of the control being subscribed to. This will be formatted as an integer or boolean depending on the subscription attribute.Â

Â Â

#### Verbose Example

MyLevel1 subscribe level 1Â MyLevelNameÂ 500 Â  ! "publishToken":"MyLevelName" "value":-100.000000 +OK ! "publishToken":"MyLevelName" "value":-98.099998 ! "publishToken":"MyLevelName" "value":-77.800003 ! "publishToken":"MyLevelName" "value":-35.299999Â 

Â Â

#### Verbose Example

MyLevel1 subscribe level 1 Â  ! "publishToken":"" "value":-100.000000 +OK ! "publishToken":"" "value":-98.099998 ! "publishToken":"" "value":-77.800003 ! "publishToken":"" "value":-35.299999Â 

Â Â

### Non-Verbose Subscription Responses

If a non-verbose response is required this must be specified before as a SESSION command and must be configured before the subscription.Â 

Â Â

When the subscription command is first sent the first reply will be:Â

! "[CustomName]" [Value] +OKÂ

Â Â

Subsequent subscription replies will be formattedÂ

! "[CustomName]" [Value]Â

* TheÂ [CustomName]Â is used as an identifier. The identifier returned is specified in the Index field of the original subscribe command. This name can then be used in a parsing routine for the subscribed item. If no identifier is specified then empty double speech-marks ("") are shown in the response as a delimiter.Â
* TheÂ [Value]Â is the current state of the control being subscribed to. This will be formatted as an integer or boolean depending on the subscription attribute.Â

Â Â

#### Verbose Example

Welcome to the Tesira Text Protocol Server... Â  SESSION set verbose false +OK Â  MyLevel1 subscribe level 1 myLevelName 500 ! "myLevelName" -40.244328 +OK ! "myLevelName" -38.992748 ! "myLevelName" -41.044147 ! "myLevelName" -40.063908 ! "myLevelName" -38.674465Â 

Â Â

Â Â

## Unsubscribe

Once a value has been subscribed to, the unsubscribe command is used to cancel the request. If an Index and value have been specified in the original subscribe request they must be used in the unsubscribe request.Â

Â Â

**Instance\_Tag Command Attribute [Index] [Index]Â LF**

* Instance Tag:Â Is always required. Is the same Instance Tag used to originally subscribe.Â
* Command: Is always required. Is the same Command used to originally subscribe.Â
* Attribute:Â Is always required. Is the same Attribute used to originally subscribe.Â
* [Index]: Is required if specified as part of the Attribute. Is the same Attribute index or indexes used to originally subscribe.Â
* [Index]:Â Is required if specified as part of the original subscription. Must match the custom name given in the original subscription.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

Â Â

An example unsubscribing to a level.Â

| Instance Tag | Command | Attribute Code | Index | Index |
| --- | --- | --- | --- | --- |
| Â MyLevel1 | Â unsubscribe | Â level | Â 1 | Â MyLevelName |

#### Â Â

#### Example

MyLevel1 subscribe level 1Â MyLevelNameÂ 500 Â  ! "publishToken":"MyLevelName" "value":-100.000000 +OK ! "publishToken":"MyLevelName" "value":-98.099998 ! "publishToken":"MyLevelName" "value":-77.800003 ! "publishToken":"MyLevelName" "value":-35.299999 Â 

MyLevel1 unsubscribe level 1Â MyLevelNameÂ +OKÂ 

Â Â

Â Â

Â Â


---


# TTP Responses

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Responses.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Responses

A Verbose or non-verbose response can be configured as part of theÂ [Session](../Attribute_Tables/Service_Addresses/Session.htm)Â Command type.Â

Â Â

Verbose:Â

+OK âtimeâ:â12:00â ânumberâ:â503-367-3568â âlineâ:â2âÂ

Â Â

Non-Verbose:Â

+OK â12:00â â503-367-3568â â2âÂ

Â Â

#### ExampleÂ

SESSION set verbose trueÂ

Mute1 get numChannelsÂ

+OK "value":2Â

Â Â

SESSION set verbose falseÂ

+OKÂ

Mute1 get numChannelsÂ

+OK 2Â

Â Â

Â Â

## TTP Feedback

Tesira Text Protocol will provide user feedback if a command is incorrect. The response will vary depending on the command. The TesiraÂ TTP error responses for the most common types of external programming errors include:Â

* Canât forward a request to a device thatâs not on the networkÂ
* If an invalid address is usedÂ
* If an invalid attribute or service for a block type (it might be valid for aÂ differentÂ object)Â
* Right address, right attribute or service, but the request doesnât make sense given the state of the target objectÂ
* Case-and-spelling errors of various kindsÂ

Please refer to the table below for some examples and details of some of the expected error responses.Â

| TTP Command String | Message | Resolution |
| --- | --- | --- |
| Â | Â +OK | The command was understood and completed successfully.Â |
| Â Session getÂ  aliases | Â -ERR address not found: {"deviceId":0 "classCode":0 "instanceNum":0} | The requested address is not valid due to incorrect formatting. The Address field is case sensitive.Â SessionÂ commands must be in capitals. Reformat the command asÂ SESSION get aliases.Â |
| Â SESSION Get aliases | Â -ERR Parse error at 8: verb was not one of the commands supported by Services | There is a problem 8 characters into the command. TheÂ getÂ command is incorrectly formatted - it has a capital 'G'. Reformat the command asÂ SESSION get aliases.Â |
| Â SESSION get Aliases | Â -ERR 'Aliases' is not supported by TextSession::Attributes | AliasesÂ is not correctly formatted. It has a capital 'A'. Reformat the command asÂ SESSION get aliases.Â |
| Â Mixer1 set inputMute 1 | Â -ERR Parse error at 22: not enough parameters supplied | The command is missing the value. Reformat the command asÂ Mixer1 set inputMute 1 true.Â |
| Â Mixer1 get inputLevel 1 | Â +OK "value":0.000000 | The command was delivered and the value of the Input level is 0.0dB.Â |
| Â Input1 get gain channel1 | Â -ERR Parse error at 16: could not parse value | Channel1 command is invalid. The Input block channel is numerical. Reformat the command asÂ Input1 get gain 1.Â |
| Â AudioMeter2 subscribe level 3 mymeter 1000 | Â ! "publishToken":"mymeter" "value":-100.000000  +OK | A subscribe of the meter refreshing every 1 second.Â |
| Â MyLevel1 get level 10 | Â -ERR INVALID\_PARAMETER Index out of range:channelIndex min:1 max:8 received:10 | Channel 10 not available. Index indicates channels 1 to 8 available.Â |
| Â | Â -ERR WRONG\_STATE | VoIP card has received a command it cannot action (For example if the card is not connected to the Call Manager and is given a request to make a call) |
| Â | Â -CANNOT\_DELIVER | Typically seen on a system with multiple Server devices when connected to one Server and addressing a DSP object in another server. Would indicate a communication issue between servers.Â |
| Â | Â -GENERAL\_FAILURE | A 'catch all' error code. Can occur when referencing a Instance Tag that is not in the TesiraÂ file.Â |

Â Â

Â Â

Â Â


---


# TTP Troubleshooting

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Troubleshooting.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Troubleshooting

Brief overview of Tesira Text Protocol troubleshooting steps.Â

Â Â

Â Â

## Configuring a PC to connect to Tesira

Connecting a PC to a Tesira System to troubleshoot may be required. Using a PC allows testing of the strings and responses in real time to prove valid commands are being used. A terminal Emulator program is recommended to connect to the system. Suggested programs include TerraTerm or PuTTY.Â

Putty is used throughout this document in any examples given this allows connections usingÂ RS-232,Â TelnetÂ orÂ SSH.Â

If usingÂ TelnetÂ orÂ SSH, ensure these services are enabled inÂ [Device MaintenanceÂ](../../Tabs/System/Device_Maintenance/Device_Maintenance_Network_Settings.htm)[Network Settings](../../Tabs/System/Device_Maintenance/Device_Maintenance_Network_Settings.htm)Â or via theÂ DeviceÂ TTP command.Â

Opening aÂ TelnetÂ orÂ SSHÂ session to a Tesira Server results in a login prompt.Â Valid credentials must be provided to access the system in any way.Â One must be logged in as controller or higher level to make any changes to the system, while an observer can only query the system for levels and other current parameters.Â

The SSH Login requires case sensitive User and Password authentication. In an unprotected system, the Username and Password are âdefaultâ and âdefaultâ respectively.Â In a protected system, the credentials configured in the system must be provided.Â

PuTTY is a free implementation of Telnet and SSH for Windows and Unix platforms, along with an xterm terminal emulator. This software can be downloaded from the following link:Â [http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)Â

Instructions on its use can be found here:Â [http://www.chiark.greenend.org.uk/~sgtatham/putty/docs.html](https://www.chiark.greenend.org.uk/~sgtatham/putty/docs.html)Â

Â

Â Â

Â Â

## Configuring a PC to connect to Tesira using Telnet

If you require a secure method to connect to a Tesira Server, please refer toÂ connecting via SSH.Â

The use of a terminal emulation program such as PuTTY is recommended in order to establish a command session to a Tesira Server.Â

If the convenience of using the Windows command prompt to initiate a Telnet session is required, you can use Windows Programs and Features to enable the Telnet Client.Â

* To enable Telnet navigate to:Â Start > Control Panel > Programs & Features > Turn Windows Features on and offÂ
* Find the entry forÂ Telnet ClientÂ
* Select the tick boxÂ
* SelectÂ OKÂ
* To Initiate a TELNET session with a Tesira Server:Â
* SelectÂ Start>programs>accessories> Command PromptÂ
* At the command prompt typeÂ telnet xxx.xxx.xxx.xxxÂ (xxx.xxx.xxx.xxx is the IP address of the Tesira Server.)Â

Â

Â Â

Tesira Text Protocol will provide user feedback if a command is incorrect. The response will vary depending on the command, please review theÂ ResponsesÂ section for more details.Â 

Â Â

Â Â

Â Â


---


# TTP Security

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Security.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Security

Establishing an SSH connection to the TTP server requiresÂ login credentials by definition.Â

In a protected TesiraÂ system, the same password access levels apply to all connections to the TesiraÂ Text Protocol (TTP) Server. Please review theÂ System Security settingsÂ that can be configured on the Tesira Servers.Â

Â Â

Opening aÂ [Telnet](Telnet.htm)Â orÂ [SSH](SSH.htm)Â session to a Tesira Server results in a login prompt.Â Valid credentials must be provided to access the system in any way.Â One must be logged in as controller or higher level to make any changes to the system, while an observer can only query the system for levels and other current parameters.Â

In an unprotected system, the username and password are âdefaultâ and âdefaultâ respectively. In a protected system, the credentials configured in the system must be provided, excepting that the "default" user is downgraded to a system access level of "observer".Â

Â Â

[RS-232](RS-232.htm)Â Serial connections to the TTP servers also require authentication in protected systems.Â Making the serial connection and sending a line feed will reveal the login prompt.Â

If a system has security enabled the RS-232 will not require authentication until the connection is fully terminated using a 'exit' command. There will then be a requirement to authenticate at the next log on.Â

Â Â

Once logged in to the TTP server via RS-232, this user has access until a 'exit' command is sent, even if the serial connection is removed and restored.Â 

Â Â

Â Â

Â Â


---


# RS-232

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/RS-232.htm

Tesira Software Help

[Click here to see this page in full context](#)

# RS-232

A Tesira SERVERÂ or SERVER I/OÂ has two RS-232 ports. AÂ TesiraFORTÃ, IDH-1 and OH-1 have one RS-232 port. Each Port can be configured to:Â

* Send Command Strings for controlling other devices via theÂ Command String BlockÂ
* Accept full duplex TTP commands for Third Party controlÂ
* Both of the aboveÂ
* None of the aboveÂ
* Enable Control Tunneling communications from 3rd-party control systems to a controlled end deviceÂ

Â Troubleshooting TTPÂ gives information on configuring a PC to connect to a TesiraÂ system for testing purposes.Â

The baud rate can be adjusted inÂ Device Maintenance using the Serial Port SettingsÂ dialog. Baud rate of the RS-232 port can be set to 300,1200, 2400, 4800, 9600, 19200, 38400, 57600, or 115200.Â Â

| Device | Port Name | Default Setting |
| --- | --- | --- |
| Â SERVER and SERVER I/O | Â Serial 1 | Â 9600, Command String |
| Â SERVER and SERVER I/O | Â Serial 2 | Â 115200, TTP |
| Â TesiraFORTÃ | Â RS-232 | Â 115200, Both |
| Â IDH-1 | Â RS-232 | Â 115200, Both |
| Â OH-1 | Â RS-232 | Â 115200, Both |

If multiple servers are connected together in a system then only one RS-232 port needs to be connected to a third-party control system; TTP commands are proxied via the Ethernet port to other devices in the system. In an unsecured Tesira system RS-232 connections do not require authentication.Â

If a system has security enabled the RS-232 will not require authentication until the connection is fully terminated using a 'exit' command. There will then be a requirement to authenticate at the next log on.Â Once logged in to a secured server via RS-232, this user has access until a 'exit' command is sent, even if the serial connection is removed and restored.Â Please review theÂ TTP securityÂ setting for more details.Â 

When controlling multiple TesiraÂ units that are not part of the same TMF file, each Tesira server unit will need to be addressed via its own RS-232 port. Tesira units cannot be linked together via RS-232.Â

A straight through PC Serial Cable is used to communicate from an RS-232 port on a third-party controller (or PC\*) to the RS-232 port located on the back of an Tesira Server.Â

Serial Connection

Pin #1: not usedÂ

Pin #2: Transmit data (TxD) OutputÂ

Pin #3: Receive data (RxD) OutputÂ

Pin #4: not usedÂ

Pin #5: not usedÂ

Pin #6: not usedÂ

Pin #7: not usedÂ

Pin #8: not usedÂ

Pin #9: not usedÂ

(\* A PC can send/receive TTP Strings using a terminal emulator program such as HyperTerminal or PuTTY.)Â 

Â Â

Â Â

Â Â


---


# Telnet

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/Telnet.htm

Tesira Software Help

[Click here to see this page in full context](#)

# Telnet

Please also review theÂ Troubleshooting TTPÂ which gives information on configuring a PC to connect to a TesiraÂ system for testing purposes.Â

Telnet is configured by specifying the IP address of the Tesira Server and connecting via port 23. A maximum of 32 Telnet connections per server are supported. The ability for Tesira SERVER, SERVER I/O, Tesira Amplifiers, or TesiraFORTÃÂ devices to use Telnet can be enabled or disabled via aÂ DEVICE TTP commandÂ or in theÂ Device Maintenance SettingsÂ Network SettingsÂ dialog.Â

When controlling multiple TesiraÂ units that are not part of the same TMF file, each TesiraÂ Server unit will need to be addressed via its own Telnet Session. Commands sent via Telnet are not encrypted.Â

Â Â

### VoIP Telnet

The option to disable Telnet connections (port 23) on the VoIP enabled FORTÃ and Server devices is available from within theÂ VoIP Property Sheet.Â This is an engineering diagnostic interface only however for installations with security concerns about this port being open, it can be disabled. Also refer to theÂ VoIP Property SheetÂ to disable HTTP or HTTPs access to the VoIP management webpage.Â 

Â Â

Â Â

## Negotiation Required to Establish a Telnet Control Session

Â Â

### Session Options

Tesira implements a Telnet server on port 23. When the request from the control system to open a session is received, theÂ Tesira Telnet server attempts to negotiate the sessionâs options, following specifications described in the Telnet standard document RFC 854 as well as document RFC 855, Telnet Option Specifications.Â 

A standard Telnet client would be able to negotiate the session options without problem, but several third partyÂ controllers do not implement a Telnet client by default. Instead, they implement control over TCP/IP using whatâs commonly known as a âRAWâ connection. If the Control System does not respond to the Telnet session options negotiations, the session will not go ahead. As such, the control system will have to be programmed to negotiate the Telnet options with Tesiraâs Telnet server. Many of the available options can be useful during a control session and indeed a programmer may choose to enable some of them, but if the desire is to continue using a âRAWâ connection, the simplest way to initiate a control session is for the control system to respond with a rejection to any option negotiation request from the server.Â 

Â Â

### Negotiation

The best way to understand the Telnet options negotiation procedure is by looking at the data in Hex format. Notation will be â0xFFâ for Hex character FF.

The Telnet commands we are concerned with are always three bytes long. The first is theÂ Interpret As CommandÂ (IAC) character, and it is always 0xFF. The second character is theÂ CommandÂ and the last character is theÂ OptionÂ beingÂ negotiated.Â 

Commands can be:Â

* WILL, or 0xFBÂ
* DO, or 0xFDÂ
* DONâT, or 0xFEÂ
* WONâT, or 0xFCÂ

Negotiated options can be (but not limited to\*):Â

* Binary Transmission, 0x00Â
* Echo, 0x01Â
* Suppress Go Ahead, 0x03Â
* Status, 0x05Â
* Terminal Type, 0x18Â

\* There are many different Telnet options in existence; a list is maintained byÂ IANAÂ [http://www.iana.org/assignments/telnet-options](https://www.iana.org/assignments/telnet-options/telnet-options.xhtml)Â

The control system needs to react to any incoming string that begins with 0xFF, and decide whether the option is desiredÂ or not. If the intent is to control TesiraÂ using a ârawâ connection, all thatâs required is to always reject the option negotiation. If TesiraÂ sends a âWILLâ Command, the control system shall respond with âDONâTâ, and if TesiraÂ sends a âDOâ, the response should be âWONâTâ. The Option byte needs to be returned as received.Â 

In essence, the mechanism is as follows:Â Â

|  |  |  |  |
| --- | --- | --- | --- |
| Â When the server sendsÂ | Â 0xFF | Â WILL | Â <byte X> |
| Â The control system responds withÂ | Â 0xFF | Â DON'T | Â <byte X> |
| Â When the server sendsÂ | Â 0xFF | Â WILL | Â <byte X> |
| Â The control system responds withÂ | Â 0xFF | Â DON'T | Â <byte X> |

Â Â

### Examples

| Source | IAC | Command | Option | Notes |
| --- | --- | --- | --- | --- |
| Â Tesira Server | Â 0xFF | Â 0xFD | Â 0x01 | Â Do Echo |
| Â Control System / Client | Â 0xFF | Â 0xFC | Â 0x01 | Â Won't Echo |

Â Â

| Source | IAC | Command | Option | Notes |
| --- | --- | --- | --- | --- |
| Â Tesira Server | Â 0xFF | Â 0xFB | Â 0x03 | Â Will Suppress Go Ahead |
| Â Control System / Client | Â 0xFF | Â 0xFE | Â 0x03 | Â Don't Suppress Go Ahead |

Â Â

Once all options are negotiated, theÂ TesiraÂ server will send the message âWelcome to the TesiraÂ Text Protocol Serverâ, preceded and followed by 0x0D and 0x0A. The control system is now free to send TTP commands.Â 

Â Â

Â Â

## Other Considerations

Please note that the Tesira server will usually end any string with either 0x0D (CR character) followed by 0x0A (LFÂ character), but as per Telnet RCF it may also use 0x0D (CR character) followed by 0x00 (NUL character). As such, the third party control system must be able to read one more character after it sees a 0x0D, which will always be either 0x0A or 0x00, and handle them appropriately.Â 

In addition, and while in practice most of the negotiations will always take place at the beginning of a session, Telnet allows for them to happen at any point during the session.Â

Â Â

Â Â

## Example Negotiation

Below is an example session options negotiation at the beginning of a Telnet session between TesiraÂ and a TCP Client whichÂ was programmed to reject all options offered by the server. Please note this is for illustrations purposes only and the order and quantity of options negotiated may vary depending on firmware release. Strings have been organized below for clarity; however multiple Telnet strings may arrive from the Server in one Ethernet frame. Responses can be sent one at the time, or multiple responses in a single frame. Â 

| Source | IAC | Command | Option | Notes |
| --- | --- | --- | --- | --- |
| Tesira Server | 0xFF | 0xFD | 0x18 | Do Terminal Type |
| Client | 0xFF | 0xFC | 0x18 | Won't Terminal Type |
| TesiraÂ Server | 0xFF | 0xFD | 0x20 | Do Terminal Speed |
| Client | 0xFF | 0xFC | 0x20 | Won't Terminal Speed |
| Tesira Server | 0xFF | 0xFD | 0x23 | Display Location |
| Client | 0xFF | 0xFC | 0x23 | Wonât X Display Location |
| Tesira Server | 0xFF | 0xFD | 0x27 | Do New Environment Option |
| Client | 0xFF | 0xFC | 0x27 | Won't New Environment Option |
| Tesira Server | 0xFF | 0xFD | 0x24 | Do Environment Option |
| Client | 0xFF | 0xFC | 0x24 | Won't Environment Option |
| Tesira Server | 0xFF | 0xFB | 0x03 | Will Suppress Go Ahead |
| Client | 0xFF | 0xFE | 0x03 | Donât Suppress Go Ahead |
| Tesira Server | 0xFF | 0xFD | 0x01 | Do Echo |
| Client | 0xFF | 0xFC | 0x01 | Wonât Echo |
| Tesira Server | 0xFF | 0xFD | 0x22 | Do Linemode |
| Client | 0xFF | 0xFC | 0x22 | Wonât Linemode |
| Tesira Server | 0xFF | 0xFD | 0x1F | Do Negotiate About Window Size |
| Client | 0xFF | 0xFC | 0x1F | Won't Negotiate About Window Size |
| Tesira Server | 0xFF | 0xFB | 0x05 | Will Status |
| Client | 0xFF | 0xFE | 0x05 | Don't Status |
| Tesira Server | 0xFF | 0xFD | 0x21 | Do Remote Flow Control |
| Client | 0xFF | 0xFC | 0x21 | Won't Remote Flow Control |
| Tesira Server | 0xFF | 0xFB | 0x01 | Will Echo |
| Client | 0xFF | 0xFE | 0x01 | Donât Echo |
| Tesira Server | 0xFF | 0xFD | 0x06 | Do Timing Mark |
| Client | 0xFF | 0xFC | 0x06 | Won't Timing Mark |
| Tesira Server | 0xFF | 0xFD | 0x00 | Do Binary Transmission |
| Client | 0xFF | 0xFC | 0x00 | Won't Binary Transmission |
| Tesira Server | 0xFF | 0xFB | 0x03 | Will Suppress Go Ahead |
| Client | 0xFF | 0xFE | 0x03 | Donât Suppress Go Ahead |
| Tesira Server | 0xFF | 0xFB | 0x01 | Will Echo |
| Client | 0xFF | 0xFE | 0x01 | Donât Echo |
| Tesira Server | 0xFF | 0xFD | 0x0A | Â |
| Tesira Server | 0x0D 0x0AÂ Welcome to the TesiraÂ Text Protocol Server 0x0D 0x0A | | | |

Â Â

Â Â

Â Â


---


# SSH

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/SSH.htm

Tesira Software Help

[Click here to see this page in full context](#)

# SSH

Secure Shell (SSH) is configured by specifying the IP address of the Tesira Server and connecting via port 22. The ability for Tesira Server, Server IO, Tesira Amplifiers or TesiraFORTÃ devices to use SSH can be enabled or disabled via aÂ DEVICE TTP commandÂ or in theÂ [Device MaintenanceÂ Network Settings](../../Tabs/System/Device_Maintenance/Device_Maintenance_Network_Settings.htm)Â dialog.Â

When controlling multiple Tesira units that are not part of the same TMF file, each Tesira server unit will need to be addressed via its own SSH Session.Â

Commands sent via SSH are encrypted.Â

Opening a SSH session to a TesiraÂ Server results in a login prompt.Â Valid credentials must be provided to access the system in any way.Â One must be logged in as controller or higher level to make any changes to the system, while an observer can only query the system for levels and other current parameters.Â

The SSH Login requires case sensitive User and Password authentication. In an unprotected system, the Username isÂ defaultÂ and Password is not required.Â In a protected system, the credentials configured in the system must be provided.Â

The number of SSH sessions is limited to 80 connections per Tesira. Once 64 sessions have been established, new sessions will begin failing to connect based on a planned percentage failure basis. Once all 80 sessions are reached, all further connections will be refused. This is a mechanism of SSH's design to reduce the likelihood and effect of a DDOS attack.Â

Â Â

Â Â

## SSH Login Banner

A customized SSH login banner can be defined by selecting the background of theÂ [System View](../../Tabs/View/Show/System_View.htm). Then, in the [Properties](../../Tabs/View/Show/Properties.htm), 'Partition 0' will be shown with an option to define the SSH Login Banner line item. When selected, a text box appears allowing message customization.Â 

Â

Note: Properties menus are docking menus. See the [Docking Menus](../../Software_Tools/Menus/Menu_Navigation.htm#Docking_Menus) section of the Menu Navigation page for additional details.Â

Â Â

Banner:

Â

Â Â

Â Â


---


# Attribute Tables - Service Addresses


# Device

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Service_Addresses/Device.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Device

The DEVICE Instance Tag is case sensitive and must be in capital letters. It is used to sendÂ Device ServicesÂ instructions or DeviceÂ Attributes and Commands.

Â Â

Â Â

## Device Services

The Following table summarizes DEVICE Service Codes. Due to the nature of the service being requested they do not require specific commands (get, set,Â etc)

Some service commands are specific to the connected device, such as 'reboot'. Other Service commands are design file specific, such as saving or recalling a Preset.

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

The TTP string is structured in the following order:

**Instance\_Tag Service [Index] [Value] LF**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Service Code | Parameters |
| --- | --- |
| clearEventLogs | Â |
| clearLogs | Â |
| clearWorkplace | Â |
| defaultLogConfig | Â |
| deleteConfigData | Â |
| getLocalCopyOfFile | blockID, fileID, filePath |
| injectDanteLicenseKey | licenseCertificate, oemCertificate |
| manualFailover | uint32\_t unitId |
| reboot | Â |
| rebootERD | HostnameList hostnames, HostnameList failedDevices |
| recallPreset | PresetId id |
| recallPresetByName | presetName |
| recallPresetShowFailures | PresetId id, HostnameList failedDevices |
| resetWebServerCredentials | applicationName |
| restoreERDToFactoryDefaults | HostnameList hostnames, HostnameList failedDevices |
| savePreset | PresetId id |
| savePresetByName | presetName |
| sleep | Â |
| startAudio | Â |
| startMedia | Â |
| startPartitionAudio | PartitionID partID |
| startPartitionMedia | PartitionID partID |
| stopAudio | Â |
| stopMedia | Â |
| stopPartitionAudio | PartitionID partID |
| stopPartitionMedia | PartitionID partID |
| syncERDFirmware | HostnameList hostnames, HostnameList failedDevices |
| verifyDanteLicenseKey | bool valid |
| wake | Â |

Â Â

### Examples

Reboot the connected device. Result: DEVICE reboot

| Instance Tag | Service |
| --- | --- |
| Â DEVICE | Â reboot |

Â Â

Start audio on a device. Result: DEVICE startAudio

| Instance Tag | Service |
| --- | --- |
| Â DEVICE | Â startAudio |

Â Â

Reboot multiple expander devices. Result:Â

* If all expander are discoverable and accept the reboot command:Â +OK "failedDevices":[ ]
* If all but the EX-IN expander are discoverable and accept the reboot command:Â +OK "failedDevices":["EX-IN-0001"]Â

| Instance Tag | Service |
| --- | --- |
| Â DEVICE | Â rebootERD ["EX-OUT-0000", "EX-IN-0001", EX-AEC-0001] |

Â Â

Â Â

## Device Attributes and Commands

Additionally there are a number of DEVICE Instance Tag command Attributes. These would reference the device that has the current active Serial, SSH or TELNET session.

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Active Faults | activeFaultList | get | Â | Â |
| AVB Peer Delay Threshold | avbPDelayThreshold | get / set / increment /Â decrement | Â | 0 - 2147483647 |
| Block Introspection | blockInfo | get | Â | The returned information is variable and dependent on the specific block being queried. For example, channelInfo may be absent for special blocks or contain numChannels (0 if unconfigured), numAVChannels (TesiraLUX I/O only), or numInputs / numOutputs. |
| Change client log level | clientLogLevel | get / set | log client name | none, emergency, critical, error, warning, notice, info, debug |
| Retrieve Dante information | danteInfo | get | Â | Â |
| Retrieve device information | deviceInfo | get | Â | Â |
| Discovered Servers | discoveredServers | get | Â | Â |
| DNS Config | dnsConfig | get / set | Â | Â |
| DNS Status | dnsStatus | get | Â | Â |
| Disable/Enable duplicate suppression on engineering log | enableDuplicateSuppression | get / set / toggle | Â | false, true |
| Remote Device AVB Peer Delay Threshold | ERDavbPDelayThreshold | get / set / increment /Â decrement | hostname | 0 - 2147483647 |
| Change facility log level | facilityLogLevel | get / set | log facility name | none, emergency, critical, error, warning, notice, info, debug |
| Host Name | hostname | get / set | Â | Â |
| Resolver Hosts Table | hostTable | get / set | Â | Â |
| HTTPS should be enabled | httpsEnabled | get / set / toggle | Â | false, true |
| IGMP should be enabled | igmpEnabled | get / set / toggle | Â | false, true |
| Network Interface Config | ipConfig | get / set | interface name | control |
| Network Interface Status | ipStatus | get | interface name | control |
| Known Redundant Device States | knownRedundantDeviceStates | get / subscribe / unsubscribe | Â | Â |
| mDNS Enabled | mDNSEnabled | get / set / toggle | Â | false, true |
| Retrieve MSRP Information | msrpInfo | get | Â | Â |
| Retrieve Network Port Information | networkPortInfo | get | Â | Â |
| Network Port Mode | networkPortMode | get / set | Â | PORT\_MODE\_SEPARATE, PORT\_MODE\_REDUNDANT, PORT\_MODE\_DAISY\_CHAIN |
| Network Status | networkStatus | get | Â | Â |
| Disable/Enable POE on a port | poeEnabled | get / set / toggle | port name | false, true |
| Retrieve POE Information | poeInfo | get | Â | Â |
| Product Revision | productRevision | get | Â | Â |
| Retrieve gPTP Information | ptpInfo | get | Â | Â |
| RSTP should be enabled | rstpEnabled | get / set / toggle | Â | false, true |
| Serial Number | serialNumber | get | Â | Â |
| ssh should be disabled | sshDisabled | get / set / toggle | Â | false, true |
| telnet should be disabled | telnetDisabled | get / set / toggle | Â | false, true |
| Firmware Version | version | get | Â | Â |
| VoIP2 Network Status | VoIP2NetworkStatus | get | card slot, (unused) | Â |

\*Note:Â Attempting to modify the Host Name via this command will result in an error message if the system is currently configured. A reset of the device is required to make changes to the Host Name first (DEVICE deleteConfigDataÂ command or aÂ Reset DeviceÂ viaÂ Device Maintenance). In the scenario where a system is configured and is Reset to change the Host Name, theÂ Equipment TableÂ will need to be re-opened and updated to reflect the new details, and the configuration re-sent to the system.

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Â DEVICE | Â get | Â serialNumber |

#### Example

DEVICE get serialNumber Â  +OK "value":"01842224"Â 

Â Â

#### Example

DEVICE get networkStatus Â  +OK "value":{"schemaVersion":2 "hostname":"TesiraServer91" "defaultGatewayStatus":"0.0.0.0" "networkInterfaceStatusWithName":[{"interfaceId":"control" "networkInterfaceStatus":{"macAddress":"00:90:5e:13:3b:27" "linkStatus":LINK\_1\_GB "addressSource":STATIC "ip":"10.30.150.62" "netmask":"255.255.0.0" "dhcpLeaseObtainedDate":"" "dhcpLeaseExpiresDate":"" "gateway":"0.0.0.0"}}] "dnsStatus":{"primaryDNSServer":"0.0.0.0" "secondaryDNSServer":"0.0.0.0" "domainName":""} "mDNSEnabled":true" telnetDisabled":false}Â 

Â Â

Â Â

## ipConfig Commands

The ipConfig command can set the DHCP state, IP address, Subnet mask and Gateway on a Tesira Server, Server IO and TesiraFORTÃ device. Only values that need to be changed are required to be specified.

To get the IP configuration of a device:

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â DEVICE | Â get | Â ipConfig | Â control |

Â Â

#### Example

DEVICE get ipConfig control +OK "value":{"autoIPEnabled":true "ip":"" "netmask":"" "gateway":""}

Â Â

#### Example - Set a device to not use DHCP and with an IP address of 192.168.1.210, a subnet of 255.255.255.0 and no gateway

DEVICE set ipConfig control {"autoIPEnabled":false "ip":"192.168.1.210" "netmask":"255.255.255.0" "gateway":"0.0.0.0"}

Â Â

#### Example - Set a device that is using a fixed IP address to use DHCP

DEVICE set ipConfig control {"autoIPEnabled":true }

Â Â

#### Example - Change a device IP address to a new address in the same subnet (this example moves a device from 192.168.1.210 to 192.168.1.110)Â

DEVICE set ipConfig control { "ip":"192.168.1.110" }

Â Â

#### Example - Retrieve port status information for all ports

DEVICE get networkPortInfo

Â +OK "networkPortInfo":[{"name":"P5" "linkUp":true "speed":1000 "statistics":[{"t":RX\_PACKETS "v":2129} {"t":TX\_PACKETS "v":1922} {"t":RX\_MULTICAST\_PACKETS "v":18101} {"t":TX\_MULTICAST\_PACKETS "v":9549} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":1} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[{"t":LLDP\_HOSTNAME "v":"ICX6450-48P Switch"} {"t":LLDP\_PORTNAME "v":"P5"}] "portRole":PORT\_ROLE\_DANTE\_ONLY} {"name":"P4" "linkUp":true "speed":100 "statistics":[{"t":RX\_PACKETS "v":524} {"t":TX\_PACKETS "v":528} {"t":RX\_MULTICAST\_PACKETS "v":1029} {"t":TX\_MULTICAST\_PACKETS "v":25477} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":1} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[] "portRole":PORT\_ROLE\_DANTE\_ONLY} {"name":"P3" "linkUp":true "speed":100 "statistics":[{"t":RX\_PACKETS "v":473} {"t":TX\_PACKETS "v":502} {"t":RX\_MULTICAST\_PACKETS "v":1020} {"t":TX\_MULTICAST\_PACKETS "v":25486} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":1} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[] "portRole":PORT\_ROLE\_DANTE\_ONLY} {"name":"P2" "linkUp":false "speed":0 "statistics":[{"t":RX\_PACKETS "v":0} {"t":TX\_PACKETS "v":0} {"t":RX\_MULTICAST\_PACKETS "v":0} {"t":TX\_MULTICAST\_PACKETS "v":0} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":0} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[] "portRole":PORT\_ROLE\_DANTE\_ONLY} {"name":"P1" "linkUp":true "speed":1000 "statistics":[{"t":RX\_PACKETS "v":490} {"t":TX\_PACKETS "v":612} {"t":RX\_MULTICAST\_PACKETS "v":20761} {"t":TX\_MULTICAST\_PACKETS "v":15708} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":1} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[{"t":LLDP\_DESCRIPTION "v":"ExtremeXOS (X440-24p) version 16.2.2.4 16.2.2.4-patch1-3 by release-manager on Fri Feb 17 08:00:10 EST 2017"} {"t":LLDP\_PORTNAME "v":"P1"}] "portRole":PORT\_ROLE\_AVB\_ONLY} {"name":"control" "linkUp":true "speed":1000 "statistics":[{"t":RX\_PACKETS "v":0} {"t":TX\_PACKETS "v":13} {"t":RX\_MULTICAST\_PACKETS "v":3173} {"t":TX\_MULTICAST\_PACKETS "v":44336} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":0} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[] "portRole":INVALID PortRoleType}]

Â Â

#### Example - Get ptp information for all ports

DEVICE get ptpInfo

+OK "gptpInfo":[{"GMID":{"id":[120 69 1 255 254 5 86 102]} "thisSystemIsGM":false "stepsRemoved":4 "priority":{"priority1":246 "priority2":248} "neighborPropDelayThreshholdNs":1200 "portInfo":[{"name":"P5" "asCapable":false "locked":false "role":PTP\_PORT\_DISABLED "neighborPropDelayNs":0} {"name":"P4" "asCapable":false "locked":false "role":PTP\_PORT\_DISABLED "neighborPropDelayNs":0} {"name":"P3" "asCapable":false "locked":false "role":PTP\_PORT\_DISABLED "neighborPropDelayNs":0} {"name":"P2" "asCapable":false "locked":false "role":PTP\_PORT\_DISABLED "neighborPropDelayNs":0} {"name":"P1" "asCapable":true "locked":true "role":PTP\_PORT\_SLAVE "neighborPropDelayNs":555} {"name":"control" "asCapable":true "locked":true "role":PTP\_PORT\_MASTER "neighborPropDelayNs":12}]}]

Â Â

#### Example - Enable or disable POE on the specified port

DEVICE set poeEnabled "P2" true

+OK

DEVICE set poeEnabled "P2" false

+OK

DEVICE get poeEnabled "P2"

+OK "enabled":true

DEVICE get msrpInfo

+OK "msrpInfo":[{"portNames":["P5" "P4" "P3" "P2" "P1" "control"] "streamInfo":[]}]

Â Â

#### Example - Get Dante information for all ports

DEVICE get danteInfo

Â +OK "danteInfo":{"revs":{"danteAPIVersion\_major":4 "danteAPIVersion\_minor":2 "danteAPIVersion\_bugfix":2 "ubootVersion\_major":0 "ubootVersion\_minor":0 "ubootVersion\_bugfix":0 "biampVersion\_major":1 "biampVersion\_minor":3 "biampVersion\_dot":0 "biampVersion\_build":1} "netCfg":{"hostname":"TesiraConnect04067397-DAN" "primaryInterface":{"autoConfigure":true "ipAddress":"192.168.1.226" "netMask":"255.255.255.0" "DNSServer":"0.0.0.0" "defaultGateway":"192.168.1.200"} "secondaryInterface":{"autoConfigure":true "ipAddress":"192.168.1.226" "netMask":"255.255.255.0" "DNSServer":"0.0.0.0" "defaultGateway":"192.168.1.200"}} "allNetStatus":{"primaryStatus":{"macAddress":"78:45:01:07:df:7e" "linkSpeedInMbS":1000} "secondaryStatus":{"macAddress":"" "linkSpeedInMbS":0}} "preferredDanteNetworkClockSource":true "networkClockSlaveOnly":false "networkLatencyInMicroseconds":0 "chInfos":[{"name":"" "number":0 "txrx":TX "faultOnInactive":false} {"name":"" "number":1 "txrx":TX "faultOnInactive":false} {"name":"" "number":2 "txrx":TX "faultOnInactive":false} {"name":"" "number":3 "txrx":TX "faultOnInactive":false} {"name":"" "number":4 "txrx":TX "faultOnInactive":false} {"name":"" "number":5 "txrx":TX "faultOnInactive":false} {"name":"" "number":6 "txrx":TX "faultOnInactive":false} {"name":"" "number":7 "txrx":TX "faultOnInactive":false} {"name":"" "number":8 "txrx":TX "faultOnInactive":false} {"name":"" "number":9 "txrx":TX "faultOnInactive":false} {"name":"" "number":10 "txrx":TX "faultOnInactive":false} {"name":"" "number":11 "txrx":TX "faultOnInactive":false} {"name":"" "number":12 "txrx":TX "faultOnInactive":false} {"name":"" "number":13 "txrx":TX "faultOnInactive":false} {"name":"" "number":14 "txrx":TX "faultOnInactive":false} {"name":"" "number":15 "txrx":TX "faultOnInactive":false} {"name":"" "number":16 "txrx":TX "faultOnInactive":false} {"name":"" "number":17 "txrx":TX "faultOnInactive":false} {"name":"" "number":18 "txrx":TX "faultOnInactive":false} {"name":"" "number":19 "txrx":TX "faultOnInactive":false} {"name":"" "number":20 "txrx":TX "faultOnInactive":false} {"name":"" "number":21 "txrx":TX "faultOnInactive":false} {"name":"" "number":22 "txrx":TX "faultOnInactive":false} {"name":"" "number":23 "txrx":TX "faultOnInactive":false} {"name":"" "number":24 "txrx":TX "faultOnInactive":false} {"name":"" "number":25 "txrx":TX "faultOnInactive":false} {"name":"" "number":26 "txrx":TX "faultOnInactive":false} {"name":"" "number":27 "txrx":TX "faultOnInactive":false} {"name":"" "number":28 "txrx":TX "faultOnInactive":false} {"name":"" "number":29 "txrx":TX "faultOnInactive":false} {"name":"" "number":30 "txrx":TX "faultOnInactive":false} {"name":"" "number":31 "txrx":TX "faultOnInactive":false} {"name":"01" "number":0 "txrx":RX "faultOnInactive":false} {"name":"02" "number":1 "txrx":RX "faultOnInactive":false} {"name":"03" "number":2 "txrx":RX "faultOnInactive":false} {"name":"04" "number":3 "txrx":RX "faultOnInactive":false} {"name":"05" "number":4 "txrx":RX "faultOnInactive":false} {"name":"06" "number":5 "txrx":RX "faultOnInactive":false} {"name":"07" "number":6 "txrx":RX "faultOnInactive":false} {"name":"08" "number":7 "txrx":RX "faultOnInactive":false} {"name":"09" "number":8 "txrx":RX "faultOnInactive":false} {"name":"10" "number":9 "txrx":RX "faultOnInactive":false} {"name":"11" "number":10 "txrx":RX "faultOnInactive":false} {"name":"12" "number":11 "txrx":RX "faultOnInactive":false} {"name":"13" "number":12 "txrx":RX "faultOnInactive":false} {"name":"14" "number":13 "txrx":RX "faultOnInactive":false} {"name":"15" "number":14 "txrx":RX "faultOnInactive":false} {"name":"16" "number":15 "txrx":RX "faultOnInactive":false} {"name":"17" "number":16 "txrx":RX "faultOnInactive":false} {"name":"18" "number":17 "txrx":RX "faultOnInactive":false} {"name":"19" "number":18 "txrx":RX "faultOnInactive":false} {"name":"20" "number":19 "txrx":RX "faultOnInactive":false} {"name":"21" "number":20 "txrx":RX "faultOnInactive":false} {"name":"22" "number":21 "txrx":RX "faultOnInactive":false} {"name":"23" "number":22 "txrx":RX "faultOnInactive":false} {"name":"24" "number":23 "txrx":RX "faultOnInactive":false} {"name":"25" "number":24 "txrx":RX "faultOnInactive":false} {"name":"26" "number":25 "txrx":RX "faultOnInactive":false} {"name":"27" "number":26 "txrx":RX "faultOnInactive":false} {"name":"28" "number":27 "txrx":RX "faultOnInactive":false} {"name":"29" "number":28 "txrx":RX "faultOnInactive":false} {"name":"30" "number":29 "txrx":RX "faultOnInactive":false} {"name":"31" "number":30 "txrx":RX "faultOnInactive":false} {"name":"32" "number":31 "txrx":RX "faultOnInactive":false}]}

Â Â

Â Â


---


# Session

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Service_Addresses/Session.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Session

The SESSION Instance Tag is case sensitive and must be in capital letters. It is used to send session specific Attributes and Commands. This includes the response method and can be used to query the commands.Â 

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Â SESSION | Â get | Â aliases |

#### ExampleÂ Â

SESSION get aliases +OK "list":["123" "AudioMeter1" "AudioMeter2" "AudioMeter3" "DEVICE" "Input1" "Mixer1" "Mute1" "Level1" "Output1"]Â Â

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Alias | alias | get | name | Â |
| Aliases | aliases | get | Â | Â |
| Detailed Responses Enabled | detailedResponse | get / set / toggle | Â | false, true |
| Get TTP session ID | sessionID | get | Â | Â |
| Enable/Disable TTP logging | ttpLoggingEnable | get / set / toggle | Â | false, true |
| Verbose Output Enabled | verbose | get / set / toggle | Â | false, true |

Â Â

Â Â

## Output Styles

A Verbose or concise response can be configured as part of the Session type.

* Verbose:Â +OK âtimeâ:â12:00â ânumberâ:â503-367-3568â âlineâ:â2â
* Concise:Â +OK â12:00â â503-367-3568â â2â

Â Â

#### Example

SESSION set verbose true Mute1 get numChannels +OK "value":2

SESSION set verbose false +OK

Mute1 get numChannels +OK 2 Â 

#### Â Â

Â Â

Â Â


---


# Attribute Tables - IO Blocks


# Audio Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/IO_Blocks/Audio_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Audio Input Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â Input1 | Â get | Â gain | Â 1 |

Â Â

#### Example

Input1 get numChannels +OK "value":2 Â 

Input1 get gain 1 +OK "value":24.000000 Â 

Input1 set gain 1 12 +OK Â 

Input1 get gain 1 +OK "value":12.000000Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Gain | gain | get / set / increment / decrement | channel | 0 - 66 dB in 6 dB increments |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement | channel | minLevel - maxLevel dB |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 24 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Phantom Power On | phantomPower | get / set / toggle | channel | false, true |

Â Â

Â Â


---


# Audio Output Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/IO_Blocks/Audio_Output_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Audio Output Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â Output1 | Â get | Â gain | Â 1 |

Â Â

#### Example

Output1 get numChannels +OK "value":2 Â 

Output1 set mute 1 true +OKÂ 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Full Scale | fullScale | get / set / increment / decrement | channel | -31 or 0 - 24 dB in 6 dB increments |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement | channel | minLevel - maxLevel dB |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 24 |

Â Â

Â Â


---


# AEC Input & Processing Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/IO_Blocks/AEC_Input_%26_Processing_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AEC Input & Processing Blocks

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

## AEC Input Block

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â AecInput1 | Â get | Â aecEnable | Â 1 |

Â Â

#### Example -Â Confirm number of channels and set Input gain on Channel 1

AecInput1 get numChannels +OK "value":2 Â 

AecInput1 get gain 1 +OK "value":0.000000 Â 

AecInput1 set gain 1 48 +OKÂ 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Gain | gain | get / set / increment /Â decrement | channel | 0 - 66 dB in 6 dB increments |
| Channel Count | numChannels | get | Â | 1 - 24 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Phantom Power On | phantomPower | get / set / toggle / subscribe /Â  unsubscribe | channel | false, true |
| All Phantom Power States | phantomPowers | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â

## AEC Processing Block

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â Aec1 | Â get | Â aecEnable | Â 1 |

Â Â

#### Example -Â Confirm processing on Aec1 Instance tag is enabledÂ

Aec1 get aecEnable 1 +OK "value":true

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| AEC Enabled | aecEnable | get / set / toggle | channel | false, true |
| Reset AEC | aecReset | get / set / toggle | channel | false, true |
| Bypass AGC | agcBypass | get / set / toggle | channel | false, true |
| Hold Time | holdTime | get / set / increment / decrement | channel | 0 - 350000 s |
| HPF Bypass | hpfBypass | get / set / toggle | channel | false, true |
| HPF Center Freq. | hpfCutoff | get / set / increment / decrement | channel | 20.0 - 500.0 Hz |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Limiter Enabled | limiterEnable | get / set / toggle | channel | false, true |
| Max Attenuation | maxAttenuation | get / set / increment / decrement | channel | 0.0 - 12.0 dB |
| Max Gain | maxGain | get / set / increment / decrement | channel | 0.0 - 12.0 dB |
| Max Gain Adj. Rate | maxGainAdjRate | get / set / increment / decrement | channel | 0.0 - 5.0 dB/s |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| All Meter States | meters | get / subscribe / unsubscribe | channel | Â |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Min SNR | minSnr | get / set / increment / decrement | channel | 10.0 - 50.0 dB |
| Min Threshold | minThreshold | get / set / increment / decrement | channel | -30.0 - 10.0 dBu |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Nonlinear Processing Mode | nlpMode | get / set | channel | NLPMODE\_NONE, NLPMODE\_LOW, NLPMODE\_MEDIUM, NLPMODE\_HIGH |
| Noise Reduction | nrdMode | get / set | channel | OFF, LOW, MED, HIGH, NOISE\_RED\_MODE\_CUSTOM |
| Channel Count | numChannels | get | Â | 1 - 24 |
| Pre-Emphasis Slope | preEmphasisSlope | get / set | channel | Slope\_0, Slope\_1, Slope\_2, Slope\_3 |
| Speech Mode | speechMode | get / set / toggle | channel | false, true |
| Target Level | targetLevel | get / set / increment / decrement | channel | -10.0 - 10.0 dB |

Â Â

### AEC Reference

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Count | numChannels | get | Â | 1 - 24 |

Â Â

Â Â


---


# ANC Input & Processing Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/IO_Blocks/ANC_Input_%26_Processing_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# ANC Input & Processing Blocks

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

## ANC Input Block

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Â AncInput1 | Â get | Â numChannels |

Â Â

#### Example

AncInput1 get numChannels +OK "value":2

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Gain | gain | get / set / increment / decrement | channel | 0 - 66 dB in 6 dB increments |
| Channel Count | numChannels | get | Â | 1 - 16 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Phantom Power On | phantomPower | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Phantom Power States | phantomPowers | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â

## ANC Processing Blocks

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Â AncInput1 | Â get | Â numChannels |

Â  Â

#### Examples

Anc1 get numChannels +OK "value":2Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Ambient Threshold | ambThreshold | get / set / increment / decrement | channel | -100.0 - 0.0 dBu |
| Bypass | bypass | get / set / toggle | channel | false, true |
| Compensation Max | maxGain | get / set / increment / decrement | channel | 0.0 - 25.0 dB |
| All Meter States | meters | get / subscribe / unsubscribe | channel | Â |
| Channel Count | numChannels | get | Â | 1 - 16 |
| Compensation Ratio | ratio | get / set / increment / decrement | channel | 0.25 - 1.0 |
| Response Time Down | responseTimeDown | get / set / increment / decrement | channel | 500.0 - 300000.0 ms |
| Response Time Up | responseTimeUp | get / set / increment / decrement | channel | 500.0 - 300000.0 ms |
| RT-60 | rt60 | get / set / increment / decrement | channel | 300.0 - 8000.0 ms |

Â Â

Â Â

Â Â


---


# AV Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/IO_Blocks/AV_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AV Input Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â AVInput1 | Â get | Â embeddedAudioPresents | 1 |

Â Â

#### Example

AVInput1 get embeddedAudioPresents 1+OK "value":[false false false false false false false false]Â

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Active Deinterlace Mode | activeDeinterlace | get / subscribe / unsubscribe | AV channel index | false, true |
| Active Video Source | activeVideoSource | get / subscribe / unsubscribe | AV channel index | VIDEO\_SOURCE\_HDMI, VIDEO\_SOURCE\_DISPLAYPORT |
| Total bandwidth allocated for all audio and video talker streams | allocatedBandwidth | get / subscribe / unsubscribe | AV channel index | 0-10.0Gbps |
| Auxiliary Audio Delay | auxDelay | get / set / increment / decrement | AV channel index | 0 - 64 ms |
| Auxiliary Audio Gain | auxGain | get / set / increment / decrement | AV channel index, AV auxiliary port index | 0 - 66 dB in 6 dB increments |
| Auxiliary Audio Invert | auxInvert | get / set / toggle | AV channel index, AV auxiliary port index | false, true |
| Auxiliary Audio Level | auxLevel | get / set / increment / decrement | AV channel index, AV auxiliary port index | auxMinLevel - auxMaxLevel dB |
| Auxiliary Audio Max Level | auxMaxLevel | get / set / increment / decrement | AV channel index, AV auxiliary port index | auxMinLevel - 12.0 dB |
| Auxiliary Audio Min Level | auxMinLevel | get / set / increment / decrement | AV channel index, AV auxiliary port index | -100.0 - auxMaxLevel dB |
| Auxiliary Audio Mute | auxMute | get / set / toggle | AV channel index, AV auxiliary port index | false, true |
| Auxiliary Audio Peak Occurring | auxPeak | get / subscribe / unsubscribe | AV channel index, AV auxiliary port index | false, true |
| All Auxiliary Audio Peaks | auxPeaks | get / subscribe / unsubscribe | Â | Â |
| Auxiliary Audio Phantom Power On | auxPhantomPower | get / set / toggle | AV channel index, AV auxiliary port index | false, true |
| Auxiliary Audio Port Type | auxPortType | get | AV channel index | MONO\_PORT, STEREO\_PORT |
| Absolute Limit for Video Stream Bandwidth | bandwidthLimit | get | AV channel index | 0.0 - 10.0 Gbps |
| Total bandwidth used by all active audio and video talker streams | currentBandwidth | get / subscribe / unsubscribe | AV channel index | 0-10.0Gbps |
| Deinterlace Input Mode | deInterlace | get / set | AV channel index | Auto, Off |
| Embedded Audio Mute | embeddedAudioMute | get / set / toggle / subscribe / unsubscribe | AV channel index | false, true |
| Embedded Audio Present Meters | embeddedAudioPresents | get / subscribe / unsubscribe | AV channel index | Â |
| Signal Presence Threshold for Embedded Audio Signal Present Meters | embeddedAudioThreshold | get / set / increment / decrement | AV channel index | -64-24.0dBu |
| HDCP state | hdcpEnable | get / setÂ | AV channel | DEVICE\_CONNECTED\_NONE, DEVICE\_CONNECTED\_HDMI, DEVICE\_CONNECTED\_DISPLAYPORT, DEVICE\_CONNECTED\_BOTH |
| Input Device Connection State | inputDeviceConnected | get / subscribe / unsubscribe | AV channel index | DEVICE\_CONNECTED\_NONE, DEVICE\_CONNECTED\_HDMI, DEVICE\_CONNECTED\_DISPLAYPORT, DEVICE\_CONNECTED\_BOTH |
| Currently reserved required network bandwidth | maxRequiredBandwidth | get / subscribe / unsubscribe | AV channel index | 0-10.0Gbps |
| Negotiated Input Frame Rate | negotiatedInputFrameRate | get / subscribe / unsubscribe | AV channel index | 0-60Hz |
| Negotiated Input Resolution | negotiatedInputResolution | get / subscribe / unsubscribe | AV channel index | [0,0]-[4096,2160] |
| Current network interface speed | networkInterfaceType | get / subscribe / unsubscribe | AV channel index | 0-10.0Gbps |
| Auxiliary Audio Port Count | numAuxPorts | get | AV channel index | 2 - 2 |
| AV Channel Count | numAVChannels | get | Â | 1 - 1 |
| Outgoing Frame Rate | outgoingFrameRate | get / subscribe / unsubscribe | AV channel index | 0-60Hz |
| Outgoing Resolution | outgoingResolution | get / subscribe / unsubscribe | AV channel index | [0,0]-[4096,2160] |
| Test Pattern Selection | testPattern | get / set | AV channel index | Off, ColorBar, Grid, HDMI420, JpegSafe |
| Parameters that affect Video Bandwidth | videoBandwidthConfig | get / set | AV channel index | [resMax, frameRate, compressionFactor] or {"resMax":resMax "frameRate":frameRate "compressionFactor":compressionFactor} resMax:[r4096x2160, r3840x2160, r2560x1600, r1920x1200, r1920x1080, r1280x800, r1280x720, r800x600] frameRate:[fr60Hz, fr30Hz, fr15Hz] compressionFactor:[0-19] e.g. [r1280x720, fr30Hz, 1] |
| Video Freeze | videoFreeze | get / set / toggle / subscribe / unsubscribe | AV channel index | false, true |
| Video Mute | videoMute | get / set / toggle / subscribe / unsubscribe | AV channel index | false, true |
| Video Source Format Selection | videoSource | get / set | AV channel index | VIDEO\_SOURCE\_HDMI, VIDEO\_SOURCE\_DISPLAYPORT |

Â Â

Â Â


---


# AV Output Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/IO_Blocks/AV_Output_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AV Output Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â AVOutput1 | Â get | Â embeddedAudioPresents | 1 |

Â Â

#### Example

AVOutput1 get embeddedAudioPresents 1+OK "value":[false false false false false false false false]

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Total bandwidth allocated for all existing (connected) audio and video talker streams | allocatedBandwidth | get / subscribe / unsubscribe | AV channel index | 0-10.0Gbps |
| Auxiliary Audio Delay | auxDelay | getÂ  /set / increment / decrement | AV channel index | 0 - 64 ms |
| Auxiliary Audio Full Scale | auxFullScale | get / set / increment / decrement | AV channel index, AV auxiliary port index | -31 or 0 - 24 dB in 6 dB increments |
| Auxiliary Audio Invert | auxInvert | get / set / toggle | AV channel index, AV auxiliary port index | false, true |
| Auxiliary Audio Level | auxLevel | get / set / increment / decrement | AV channel index, AV auxiliary port index | auxMinLevel - auxMaxLevel dB |
| Auxiliary Audio Max Level | auxMaxLevel | get / set / increment / decrement | AV channel index, AV auxiliary port index | auxMinLevel - 0.0 dB |
| Auxiliary Audio Min Level | auxMinLevel | get / set / increment / decrement | AV channel index, AV auxiliary port index | -100.0 - auxMaxLevel dB |
| Auxiliary Audio Mute | auxMute | get / set / toggle | AV channel index, AV auxiliary port index | false, true |
| Auxiliary Audio Port Type | auxPortType | get | AV channel index | MONO\_PORT, STEREO\_PORT |
| Total Bandwidth used by all currently listened-to talker streams | currentBandwidth | get / subscribe / unsubscribe | AV channel index | 0-10Gbps |
| Embedded Audio Mute | embeddedAudioMute | get / set / toggle / subscribe / unsubscribe | AV channel index | false, true |
| Embedded Audio Present Meters | embeddedAudioPresents | get / subscribe / unsubscribe | AV channel index | Â |
| Signal Presence Threshold for Embedded Audio Signal Present Meters | embeddedAudioThreshold | get / set / increment / decrement | AV channel index | -64-24.0dBu |
| Video Fill Color | fillColor | get / set / increment / decrement | AV channel index | 0 - 4294967295 |
| HDCP state | hdcpEnable | get / set | AV channel | false, true |
| Incoming Frame Rate | incomingFrameRate | get / subscribe / unsubscribe | AV channel index | 0-60Hz |
| Incoming Resolution | incomingResolution | get / subscribe / unsubscribe | AV channel index | [0,0]-[4096,2160] |
| Negotiated Output Frame Rate | negotiatedOutputFrameRate | get / subscribe / unsubscribe | AV channel index | 0-60Hz |
| Negotiated Output Resolution | negotiatedOutputResolution | get / subscribe / unsubscribe | AV channel index | [0,0]-[4096,2160] |
| Network Interface Bandwidth | networkInterfaceType | get / subscribe / unsubscribe | AV channel index | 0-10.0Gbps |
| Auxiliary Audio Port Count | numAuxPorts | get | AV channel index | 2 - 2 |
| AV Channel Count | numAVChannels | get | Â | 1 - 1 |
| On Screen Display Message Duration | osdDuration | get / set / subscribe / unsubscribe | AV channel index | OSDOff, OSD5seconds, OSD15seconds, OSDOn |
| Output Device Connection State | outputDeviceConnected | get / subscribe / unsubscribe | AV channel index | DEVICE\_CONNECTED\_NONE, DEVICE\_CONNECTED\_HDMI, DEVICE\_CONNECTED\_DISPLAYPORT, DEVICE\_CONNECTED\_BOTH |
| Test Pattern Selection | testPattern | get / set / subscribe / unsubscribe | AV channel index | Off, ColorBar, Grid, HDMI420, JpegSafe |
| On Screen Display Message Transition Mode | transition | get / set | AV channel index | FreezeAndFade, OSD, Instant |
| Video Freeze | videoFreeze | get / set / toggle / subscribe / unsubscribe | AV channel index | false, true |
| Video Mute | videoMute | get / set / toggle / subscribe / unsubscribe | AV channel index | false, true |
| Video Output Format | videoOutputFormat | get / set | AV channel index | vfEDIDPreferred, vf4096x2160p60, vf4096x2160p30, vf3840x2160p60, vf3840x2160p30, vf2560x1600p60, vf1920x1200p60, vf1920x1080p60, vf1920x1080p30, vf1280x720p60, vf800x600p60, vf4096x2160p50, vf4096x2160p25, vf3840x2160p50, vf3840x2160p25, deprecated1, deprecated2, vf1920x1080p50, vf1920x1080p25, vf1280x720p50, deprecated3, vf1280x800p60, deprecated4 |

Â Â

Â Â


---


# Attribute Tables - Network Blocks


# Attero Tech Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/Attero_Tech_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Attero Tech Input Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| WallPlateIn1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Name (in Dante terms, 'RX Channel Label') | channelName | get / set | channel | Case-insensitive, up to 31 characters except '=' '.' and '@' |
| Connected Dante Device Name | deviceName | get / subscribe / unsubscribe | channel | Â |
| All Connected Dante Device Names | deviceNames | get / subscribe / unsubscribe | Â | Â |
| Gain | gain | get / set / increment / decrement | channel | Float dB; Value snaps to nearest valid value depending on channel |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Locate Mode Enable | locateMode | get / set / toggle | Â | false, true |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 4 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Phantom Power | phantomPower | get / set / toggle | channel | false, true |
| Source Control | sourceControl | get / set | channel | RCA, HEADPHONE, MIXED |
| Wallplate Model | wallPlateModel | get | Â | ATND971, ATND8677, ANYTYPE, ATND8734, MXA910, MXA310, UNDX2IOP, UNDX4I, UND6IO |

Â Â

Â Â

Â Â

Â


---


# Attero Tech Output Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/Attero_Tech_Output_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Attero Tech Output Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| WallPlateOut1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Name (in Dante terms, 'TX Channel Label') | channelName | get / set | channel | Case-insensitive, up to 31 characters except '=' '.' '@' '\' '<' '>' |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe /Â  unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 2 |

Â Â

Â Â

Â Â


---


# AVB Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/AVB_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AVB Input Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| AVB\_1Input1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| AVB Data Format | format | get | Â | LINEAR\_PCM, FLOAT\_32, GENERIC\_32 |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 60 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Stream Connection Status | streamActive | get / subscribe / unsubscribe | Â | false, true |
| AVB Stream Name | streamName | get | Â | Â |
| Enable Redundant Stream | useCableRedundancy | get | Â | false, true |

Â Â

Â Â

Â Â


---


# AVB Output Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/AVB_Output_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AVB Output Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| AVB\_1Output1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| AVB Data Format | format | get | Â | LINEAR\_PCM, FLOAT\_32, GENERIC\_32 |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 60 |
| Stream Connection Status | streamActive | get / subscribe / unsubscribe | Â | false, true |
| AVB Stream Name | streamName | get | Â | Â |
| Enable Redundant Stream | useCableRedundancy | get | Â | false, true |

Â Â

Â Â

Â Â


---


# CobraNet Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/CobraNet_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# CobraNet Input Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| Â CNInput1 | Â set | Â enable | Â true |

Â Â

#### Example

CNInput1 get bundleNumber +OK "value":256 Â 

CNInput1 set enable true +OK

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| CobraNet Bundle Number | bundleNumber | get / set / increment / decrement / subscribe / unsubscribe | Â | 1 - 255 if multicast, 256 - 65279 if not |
| Enabled | enable | get / set / toggle | Â | false, true |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Multicast On | multicast | get / set / toggle | Â | false, true |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 8 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â

Â Â


---


# CobraNet Output Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/CobraNet_Output_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# CobraNet Output Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| Â CNOutput1 | Â set | Â enable | Â true |

Â  Â Â

#### Example

CNOutput1 get bundleNumber +OK "value":300 Â 

CNOutput1 set enable true +OK

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| CobraNet Bundle Number | bundleNumber | get / set / increment / decrement / subscribe / unsubscribe | Â | 1 - 255 if multicast, 256 - 65279 if not |
| Enabled | enable | get / set / toggle | Â | false, true |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Multicast On | multicast | get / set / toggle | Â | false, true |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 8 |

Â Â

Â Â

Â Â


---


# Dante Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/Dante_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Dante Input Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| DanteInput1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Name (in Dante terms, 'RX Channel Label') | channelName | get / set | channel | Case-insensitive, up to 31 characters except '=' '.' '@' |
| Fault on Inactive | faultOnInactive | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 16 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â

Â Â


---


# Dante Output Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/Dante_Output_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Dante Output Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| DanteOutput1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Name (in Dante terms, 'TX Channel Label') | channelName | get / set | channel | Case-insensitive, up to 31 characters except '=' '.' '@' |
| Fault on Inactive | faultOnInactive | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 16 |

Â Â

Â Â

Â Â


---


# Attribute Tables - Comms Blocks


# EX-UBT, EX-USB, & USB X Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/EX-UBT_%26_EX-USB_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# EX-UBT, EX-USB, & USB X Blocks

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

Â Â

## EX-UBT, EX-USB, USB X Status Attributes

The EX-USB and USB X share all of the same attributes as the EX-UBT excluding Bluetooth functions.Â 

Â Â

### USB Input Block Status Attributes

Â Â

| Instance Tag |
| --- |
| USBInput1Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Connection StatusÂ | connectedÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| Hook Switch StatusÂ | hookSwitchÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| LevelÂ | levelÂ | get / set / increment / decrement / subscribe / unsubscribeÂ | channelÂ | minLevel - maxLevel dBÂ |
| All LevelsÂ | levelsÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Max LevelÂ | maxLevelÂ | get / set / increment / decrementÂ | channelÂ | minLevel - 0.0 dBÂ |
| Min LevelÂ | minLevelÂ | get / set / increment / decrementÂ | channelÂ | -100.0 - maxLevel dBÂ |
| MuteÂ | muteÂ | get / set / toggle / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| Mute Inputs as GroupÂ | muteAsGroupÂ | getÂ | Â | false, trueÂ |
| All Mute StatesÂ | mutesÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Channel CountÂ | numChannelsÂ | getÂ | Â | 1 - 8Â |
| Peak OccurringÂ | peakÂ | get / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| All PeaksÂ | peaksÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Streaming StatusÂ | streamingÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| USB Device NameÂ | usbDeviceNameÂ | get / setÂ | Â | Â |

Â Â

### USB Output Block Status Attributes

Â Â

| Instance Tag |
| --- |
| USBOutput1Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Connection StatusÂ | connectedÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| Hook Switch StatusÂ | hookSwitchÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| LevelÂ | levelÂ | get / set / increment / decrement / subscribe / unsubscribeÂ | channelÂ | minLevel - maxLevel dBÂ |
| All LevelsÂ | levelsÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Max LevelÂ | maxLevelÂ | get / set / increment / decrementÂ | channelÂ | minLevel - 0.0 dBÂ |
| Min LevelÂ | minLevelÂ | get / set / increment / decrementÂ | channelÂ | -100.0 - maxLevel dBÂ |
| Mute StatusÂ | muteÂ | get / set / toggle / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| Mute Outputs as GroupÂ | muteAsGroupÂ | getÂ | Â | false, trueÂ |
| All Mute StatesÂ | mutesÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Channel CountÂ | numChannelsÂ | getÂ | Â | 1 - 8Â |
| Streaming StatusÂ | streamingÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |

Â Â

Â Â

## EX-UBT Bluetooth Attributes

The following Bluetooth attributes are exclusively available for the EX-UBT.Â 

Â Â

### Bluetooth Input Block Status Attributes

Â Â

| Instance Tag |
| --- |
| BluetoothInput1Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| LevelÂ | levelÂ | get / set / increment / decrement / subscribe / unsubscribeÂ | channelÂ | minLevel - maxLevel dBÂ |
| All LevelsÂ | levelsÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Max LevelÂ | maxLevelÂ | get / set / increment / decrementÂ | channelÂ | minLevel - 0.0 dBÂ |
| Min LevelÂ | minLevelÂ | get / set / increment / decrementÂ | channelÂ | -100.0 - maxLevel dBÂ |
| MuteÂ | muteÂ | get / set / toggle / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| All Mute StatesÂ | mutesÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Channel CountÂ | numChannelsÂ | getÂ | Â | 2 - 2Â |
| Peak OccurringÂ | peakÂ | get / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| All PeaksÂ | peaksÂ | get / subscribe / unsubscribeÂ | Â | Â |

Â  Â

### Bluetooth Output Block Status Attributes

Â Â

| Instance Tag |
| --- |
| BluetoothOutput1Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| LevelÂ | levelÂ | get / set / increment / decrement / subscribe / unsubscribeÂ | channelÂ | minLevel - maxLevel dBÂ |
| Max LevelÂ | maxLevelÂ | get / set / increment / decrementÂ | channelÂ | minLevel - 0.0 dBÂ |
| Min LevelÂ | minLevelÂ | get / set / increment / decrementÂ | channelÂ | -100.0 - maxLevel dBÂ |
| Mute StateÂ | muteÂ | get / set / toggle / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| Channel CountÂ | numChannelsÂ | getÂ | Â | 1 - 1Â |

Â Â

### Bluetooth Control & Status Block

#### ServicesÂ

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

#### Â Â

| Service Code | Parameters |
| --- | --- |
| disconnectÂ | (none)Â |

Â Â

#### AttributesÂ

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â  Â Â

| Instance Tag |
| --- |
| BluetoothControlStatus1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bluetooth Device NameÂ | deviceNameÂ | get / setÂ | Â | text up to 32 charactersÂ |
| Bluetooth MAC AddressÂ | deviceMACÂ | get / subscribe / unsubscribeÂ | Â | string in format XX:XX:XX:XX:XX:XXÂ |
| Bluetooth DiscoverableÂ | discoverableÂ | get / set / toggle / subscribe / unsubscribeÂ | Â | false, true Â |
| Bluetooth EnabledÂ | enableÂ | get / set / toggle / subscribe / unsubscribeÂ | Â | false, true Â |
| Bluetooth Inactivity TimeoutÂ | inactivityTimeoutÂ | get / setÂ | Â | 0-1800s. 0 denotes no timeoutÂ |
| Connected Device NameÂ | connectedDeviceNameÂ | get / subscribe / unsubscribeÂ | Â | string with 0 - 248 characters. "None" when no devices are connected.Â |
| Streaming ProfileÂ | profileÂ | get / subscribe / unsubscribeÂ | Â | String containing: Profile, CODEC, Sample Rate. e.g., "HFP, SBC, 16kHz"Â |
| Connection StatusÂ | connectedÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ  Â |
| Disconnects Paired BluetoothÂ  Device | disconnectÂ | Â | Â | Â |
| Streaming StatusÂ | streamingÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ  Â |

Â Â

Â Â

Â Â


---


# USB Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/USB_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# USB Input

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| USBInput1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Connection Status | connected | get / subscribe / unsubscribe | Â | false, true |
| Host Master Mute Status | hostMasterMute | get / subscribe / unsubscribe | Â | false, true |
| Host Master Volume Control Level | hostMasterVol | get / subscribe / unsubscribe | Â | -100.0 - 0.0 dB |
| Level | level | get / set / increment / decrement | channel | minLevel - maxLevel dB |
| All Levels | levels | get | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle | channel | false, true |
| All Mute States | mutes | get | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 8 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Streaming Status | streaming | get / subscribe / unsubscribe | Â | false, true |

Â Â

Â Â

Â Â


---


# USB Output Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/USB_Output_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# USB Output

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| USBOutput1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Connection Status | connected | get / subscribe / unsubscribe | Â | false, true |
| Host Master Mute Status | hostMasterMute | get / subscribe / unsubscribe | Â | false, true |
| Host Master Volume Control Level | hostMasterVol | get / subscribe / unsubscribe | Â | -100.0 - 0.0 dB |
| Level | level | get / set / increment / decrement | channel | minLevel - maxLevel dB |
| All Levels | levels | get | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute Status | mute | get / set / toggle | channel | false, true |
| All Mute States | mutes | get | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 8 |
| Streaming Status | streaming | get / subscribe / unsubscribe | Â | false, true |

Â Â

Â Â

Â Â


---


# VoIP Receive Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_Receive_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP Receive Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â VoIPReceive1 | Â get | Â level | Â 1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Level | level | get / set / increment / decrement | line | minLevel - maxLevel dB |
| Max Level | maxLevel | get / set / increment / decrement | line | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | line | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle | line | false, true |
| Line Count | numChannels | get | Â | Always 2 |

Â Â

Â Â

Â Â


---


# VoIP Transmit Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_Transmit_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP Transmit Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â VoIPTransmit1 | Â get | Â level | Â 1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Level | level | get / set / increment / decrement | line | minLevel - maxLevel dB |
| Max Level | maxLevel | get / set / increment / decrement | line | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | line | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | line | false, true |
| Line Count | numChannels | get | Â | Always 2 |

Â Â

Â Â


---


# VoIP Control Status Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_Control_Status_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP Control Status Block

The VoIP Control/Status blocks allows TTP control of a number ofÂ Dialer Service CodesÂ that can be used for call based functions. It also enables a number ofÂ VoIP Call State CommandsÂ that allows monitoring and feedback to a control system as well asÂ VoIP Control Status attributesÂ for controlling general VoIP functions. See below for details.

When aÂ SVC-2Â card is used and a Dialer is added and associated with the respective VoIP Control/Status block there are also a number of dialer specific attributes. Please refer to theÂ [Dialer](../Control_Blocks/Dialer_Block.htm)Â pageÂ for more information.Â

Â Â

Â Â

## Dialer Service Codes

The Tesira SERVER or SERVER I/OÂ SVC-2Â VoIP card orÂ TesiraFORTÃ VIÂ orÂ [TesiraFORTÃ VT](../../../Tabs/Audio_Objects/Forte/Forte_VT.htm)Â can support two independent phone lines. Each independent line can support up to 6 call appearances. Each call appearance can be a call to a different far end. However, there are limitations on active call appearances that apply to each line independently within an SVC-2 card.Â

* Two active call appearances:Â The maximum number of active call appearances (i.e. call appearances that are not on hold) per line is two. When two call appearances are active, no other call appearances can be used for any purpose (an active call or a call on hold).Â
* Less than two active call appearances:Â If there is only one active call appearance (or none), then all of the remaining call appearances can have calls on hold. In this case, the SVC-2 card will allow a call appearance to be put on hold and a different call appearance made active.Â

If you have 3 calls on hold you can choose any one of those to become an active call, but to conference in a second call appearance you need to disconnect the 3rd call before the conferencing can take place. Similarly, if 2 calls are in conference, any attempt to have a 3rd appearance dial in will result in a busy tone / redirect to voicemail / etc. since the system is already fully engaged. If a user tries to initiate a 3rd call appearance from the Tesira VoIP they will get an audible error tone / warble indicating they cannot complete the action.Â

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service | Index | Index | Value |
| --- | --- | --- | --- | --- |
| VoIPControlStatus1 | dial | 1 | 1 | 15036417287 |

Â Â

| Description | Service | Index | Value |
| --- | --- | --- | --- |
| Answer | answer | Line, Call Appearance | Â |
| Specify call appearance | callAppearance | Line, Call Appearance (0 - 5) | Â |
| Dial (used when On Hook only) | dial | Line, Call Appearance | Number to Dial (A String) |
| DTMF (used when Off Hook only) | dtmf | Line | One number between 0 - 9, \* or # |
| End | end | Line, Call Appearance | Â |
| Flash | flash | Line, Call Appearance | Â |
| Hold | hold | Line, Call Appearance | Â |
| Conference | lconf | Line, Call Appearance | Â |
| Leave Conference | leaveConf | Line, Call Appearance | Â |
| Go Off Hook | offHook | Line, Call Appearance | Â |
| Go On Hook | onHook | Line, Call Appearance | Â |
| Redial | redial | Line, Call Appearance | Â |
| Resume | resume | Line, Call Appearance | Â |
| Send | send | Line, Call Appearance | Â |
| Transfer | transfer | Line, Call Appearance | Refer to the [VoIP Transfer Commands](VoIP_VoIP_X_Transfer.htm) section |

Â Â

Â Â

## VoIP Call State Commands

The VoIP Control Status Block supports the use of Call State monitoring in order to poll information about the current call state of the telephone card. The response will include multiple information fields for all lines and call appearances of the card. Call State is also available as a subscribed service to allow unsolicited feedback to a connected control system via TTP. A full call state subscription update will be sent if any single part of the call state has changed.Â

Please refer to theÂ [VoIP Call State commands](VoIP_Call_State_Commands.htm)Â for more information.Â

Â Â

Â Â

## VoIP Control Status Attributes

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Index |
| --- | --- | --- | --- | --- |
| VoIPControlStatus1 | get | lineInUse | 1 | 1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Auto Answer | autoAnswer | get / set / toggle | line | false, true |
| Auto Answer Ring Count | autoAnswerRingCount | get / set | line | AA\_IMMEDIATELY, AA\_ONE\_RING, AA\_TWO\_RINGS, AA\_THREE\_RINGS |
| Call State | callState | get / subscribe / unsubscribe | Â | Â |
| Statistics | cardStat | get / subscribe / unsubscribe | Â | Â |
| Simple Caller ID | cid | get / subscribe / unsubscribe | line, call appearance index | Â |
| Full Caller ID | cidUser | get / subscribe / unsubscribe | line, call appearance index | Â |
| Codec Priorities | codecPriority | get / set | line | Â |
| Call Progress Tone Level | cptLevel | get / set / increment / decrement | line | -100.0 - 0.0 dB |
| Dialing Timeout | dialingTimeOut | get / set / increment / decrement | line | 0 - 20 s |
| Direct URL Dialing Enabled | directUrlDialing | get / set / toggle | line | false, true |
| Do Not Disturb Enabled | dndEnable | get / set / toggle | line | false, true |
| Do Not Disturb Response Code | dndMode | get / set | line | DND\_480, DND\_486, DND\_603 |
| DTMF Off Time | dtmfOffTime | get / set / increment / decrement | line | 40 - 1000 ms |
| DTMF On Time | dtmfOnTime | get / set / increment / decrement | line | 40 - 1000 ms |
| DTMF via SIP Info | dtmfSipInfo | get / set | line | DTMF\_SIP\_INFO\_OFF, DTMF\_SIP\_INFO\_NORMAL, DTMF\_SIP\_INFO\_SIMPLE |
| Last Number Dialed | lastNum | get / subscribe / unsubscribe | line | Â |
| Line In Use | lineInUse | get / subscribe / unsubscribe | line, call appearance index | false, true |
| Line Ready | lineReady | get / subscribe / unsubscribe | line | false, true |
| DTMF Local Mute | localDtmfMute | get / set / toggle | line | false, true |
| DTMF Local Level | localDtmfToneLevel | get / set / increment / decrement | line | -100.0 - 0.0 dB |
| NAT Info | nat | get / subscribe / unsubscribe | Â | Â |
| Network Info | network | get / subscribe / unsubscribe | Â | Â |
| Line Count | numChannels | get | Â | Always 2 |
| Out-Of-Band DTMF Enabled | oobDtmf | get / set / toggle | line | false, true |
| Out-Of-Band DTMF Payload Type | oobDtmfPayload | get / set / increment / decrement | line | 97 - 127 |
| Protocol Info | protocols | get / subscribe / unsubscribe | Â | Â |
| Redial Enabled | redialEnable | get / set / toggle | line | false, true |
| RFC 2543-Style Hold Enabled | rfc2543StyleHold | get / set / toggle | line | false, true |
| Ringing | ringing | get / subscribe / unsubscribe | line, call appearance index | false, true |
| Ring Type | ringType | get / set | line | RING\_TYPE\_CLASSIC, RING\_TYPE\_SILENT |
| Synchronized Time | syncTime | set | Â | hh:mm:ss:MM:DD:YYYY |
| VAD Enabled | vad | get / set / toggle | line | false, true |
| VAD Threshold | vadThreshold | get / set / increment / decrement | line | -64.0 - 24.0 dB |

Â Â

### Synchronized Time

Synchronized time is formatted as follows:

* hh = Hours
* mm = minutes
* ss = Seconds. Leap seconds (SS=60) specification are forbidden.
* MM =month of year 1-12
* DD =day of month 1-(28,29,30,31) according to the month and year
* YYYY = Year must be >= 2000
* Spaces are not permitted after the : and before YYYY so â: 2000â is not valid.

Â Â

### Set Synchronized Time

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| VoIPControlStatus1 | set | syncTime | "00:00:00:02:29:2014" |

Â Â

#### Example

VoIPControlStatus1 set syncTime "00:00:00:02:29:2014"Â 

Â Â

Â Â

Â Â


---


# VoIP X Control Status Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_X_Control_Status_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP X Control Status Block

The VoIP X Control/Status blocks allows TTP control of a number ofÂ Dialer Service CodesÂ that can be used for call based functions. It also enables a number ofÂ VoIP X Call State CommandsÂ that allows monitoring and feedback to a control system as well asÂ VoIP X Control Status attributesÂ for controlling general VoIP X functions.Â See below for details.

When a Dialer is added and associated with the respective VoIP X Control/Status block there are also a number of dialer specific attributes. Please refer to theÂ [Dialer](../Control_Blocks/Dialer_Block.htm)Â section for more information.Â

If there are 2 calls on hold the user may choose any one of those to become an active call. If 2 calls are in conference, any attempt to have a 3rd call appearance dial in will result in a busy tone, redirect to voicemail etc. since the system is already fully engaged.Â

Each element of the Service Code instruction in delimited by a single space. The commands are case sensitive and upper and lower case characters are used. The TTP string is structured in the in the order below.Â

Â Â

Â Â

## Dialer Service Codes

TheÂ TesiraFORTÃÂ X can support a single phone line, with up to 2 call appearances. Each call appearance can be a call to a different far end. However, there are limitations on active call appearances. When a call is active, the other call appearance must be on hold, unless involved in a conference call.Â 

Â Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service | Index | Index | Value |
| --- | --- | --- | --- | --- |
| VoIPXControlStatus1 | dial | 1 | 1 | 15036417287 |

Â Â

| Instance Tag | Service | Index | Value |
| --- | --- | --- | --- |
| Redial | redial | Line,Call Appearance | Â |
| End | end | Line,Call Appearance | Â |
| Send | send | Line,Call Appearance | Â |
| Dial | send | Line, Call Appearance | Â |
| DTMF (Used when Off Hook only) | dtmf | Line | One number between 0 - 9, \* or # |
| Answer | answer | Line,Call Appearance | Â |
| Conference | lconf | Line,Call Appearance | Â |
| Resume | resume | Line, Call Appearance | Â |
| Leave Conference | leaveConf | Line, Call Appearance | Â |
| Hold | hold | Line,Call Appearance | Â |
| Go Off Hook | offHook | Line,Call Appearance | Â |
| Go On Hook | onHook | Line,Call Appearance | Â |
| Transfer | transfer | Line,Call Appearance | Â Refer to theÂ VoIP Transfer CommandsÂ section |

Â Â

Â Â

## VoIP X Call State Commands

The VoIP X Control Status Block supports the use of Call State monitoring in order to poll information about the current call state of the telephone card. The response will include multiple information fields for all lines and call appearances of the card. Call State response includes several fields of information including Caller ID which may be useful. Call State is also available as a subscribed service to allow unsolicited feedback to a connected control system via TTP. A full call state subscription update will be sent if any single part of the call state has changed.Â

Please refer to the [VoIP/VoIP XÂ Call State Commands](VoIP_Call_State_Commands.htm)Â for more information.Â

Â Â

Â Â

## VoIP X Control & Status Attributes

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Index |
| --- | --- | --- | --- | --- |
| VoIPXControlStatus1 | get | lineInUse | 1 | 1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Auto Answer | autoAnswer | get / set / toggle | line (1) | false, true |
| Auto Answer Ring Count | autoAnswerRingCount | get / set | line (1) | AA\_IMMEDIATELY, AA\_ONE\_RING, AA\_TWO\_RINGS, AA\_THREE\_RINGS |
| Call State | callState | get / subscribe / unsubscribe | Â | Refer to theÂ VoIP Call State CommandsÂ section |
| Do Not Disturb Enabled | dndEnable | get / set / toggle | line (1) | false, true Â |
| Last Number Dialed | lastNum | get / subscribe / unsubscribe | line (1) | Â |
| Line In Use | lineInUse | get / subscribe / unsubscribe | line (1), call appearance index (1-2) | false, true |
| Line Ready | lineReady | get / subscribe / unsubscribe | line (1) | false, true |
| Ringing | ringing | get / subscribe / unsubscribe | line (1), call appearance index (1-2) | false, true |

Â Â

Â Â

Â Â


---


# VoIP / VoIP X Transfer

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_VoIP_X_Transfer.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP VoIP X Transfer

Â Â

Â Â

## Call Transfer Process

There are a number of supported workflows as part of transferring a call using third party control. The method used is dependent on external factors such as the phone system used. Below, the three different processes are defined. The method chosen would depend on the unique project requirements and functions of the phone system being used and its supported functions.Â

The 'transfer' function can be used for the default type of transfer when it has been defined in the Tesira software. The other two methods, the 'featureKey Blind' or 'featureKey Consultative' methods can be used as an 'on-the-fly' method of initiating a transfer.Â

Â Â

### Transfer

This function is a dedicated function for initiating the default type of call transfer. The transfer behavior is defined in theÂ [VoIP Line Properties](../../../Tabs/Audio_Objects/Comms/VoIP_Phone/VoIP_Line_Properties.htm)Â block properties configured as part of the Tesira design file configuration. For some proxies, the default behavior is a 'blind transfer' for others it is a 'consultative transfer'. The control developers will need to know what kind of call transfer method is used then this should be configured in the Line properties > General Tab > Consultative Transfer setting.Â 

#### Example - To Transfer to Extension 9175

VoIPControlStatus1 transfer 1 1  
+OK

VoIPControlStatus1 dial 1 2 9175  
+OK

Â Â

### Blind Transfer

The function:Â **featureKey 1 1 FEATURE\_KEY\_BLIND\_TRANSFER**, opens a new call appearance and allows the number to be transferred to be entered. The process operates the same as off-hook dialing.Â

Once the transfer target answers the call, a manual confirmation of the transfer can be specified, alternatively, the transfer will complete itself after a timeout period (default 10 seconds)Â

To confirm the transfer, the feature key function with the new line instance is specified:Â **featureKey 1 2 FEATURE\_KEY\_BLIND\_TRANSFER**.Â

If the transfer does not complete, the original call instance will remain on hold. This will need to be restored manually.Â

#### Example - To Transfer to Extension 9175

VoIPControlStatus1 featureKey 1 1 FEATURE\_KEY\_BLIND\_TRANSFER

+OK

VoIPControlStatus1 dial 1 2 9175  
+OK

VoIPControlStatus1 featureKey 1 2 FEATURE\_KEY\_BLIND\_TRANSFER  
+OK

Â Â

### Consultative Transfer

The function:Â **featureKey 1 1 FEATURE\_KEY\_CONSULTATIVE\_TRANSFERÂ opens**Â a new call appearance and allows the number to be transferred to be entered. The process operates the same as off-hook dialing.

Once the transfer target answers the call, a manual confirmation of the transfer must be specified. To confirm the transfer, the feature key function with the new line instance is specified byÂ **featureKey 1 2 FEATURE\_KEY\_CONSULTATIVE\_TRANSFER**.Â

#### Example - To Transfer to Extension 9175

VoIPControlStatus1 featureKey 1 1 FEATURE\_KEY\_CONSULTATIVE\_TRANSFER  
+OK

VoIPControlStatus1 dial 1 2 9175  
+OK

VoIPControlStatus1 featureKey 1 2 FEATURE\_KEY\_CONSULTATIVE\_TRANSFER  
+OK

For a consultative transfer, the function featureKey (1, 1, FEATURE\_KEY\_CONSULTATIVE\_TRANSFER) can be used to initiate a new call appearance. The number will be required to be inputted. This process looks like off-hook dialing. The original call is on hold and a new call is placed. Once the transfer target answers the call and would like to accept the transferred call, this function must be called again to complete the call transfer. In case of the failure, the original call is on hold and the call will be required to be restored manually.

Â Â

Â Â

Â Â


---


# VoIP Call State Commands

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_Call_State_Commands.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP Call State Commands

Â Â

Â Â

## Using the TTP Call State Commands

The VoIP Control Status Block supports the use of Call State monitoring in order to poll information about the current call state of the telephone card.Â The response will include multiple information fields for all lines and call appearances of the card. Call State is also available as a subscribed service to allow unsolicited feedback to a connected control system via TTP. A full call state subscription update will be sent if any single part of the call state has changed.Â 

Â Â

### VoIP Definitions

* Line:Â A single extension on the SVC-2 card. Â A line will have a dedicated phone number and the voice signals for this line are available as an independent input and output in the Tesira system. Each SVC-2 card supports two lines and these lines may be used at the same time.Â
* Call Appearance:Â Each line supports up to 6 call appearances. A call appearance can be viewed as a voice connection point on a line. A call appearance can be used to open another call from the same line by placing an active call on hold. Call appearances also allow the SVC-2 card to support call waiting.Â
* Conference: The SVC card can create a local conference by joining two call appearances into a single active call. There is no support for a conference larger than a 3-way conference (two call appearances). It is possible to have an active 3-way conference on both lines of the SVC card at the same time.Â

Â Â

### VoIP X Definitions

* Line: A line will have a dedicated phone number and the voice signals for this line are available as an independent input and output in the Tesira system. Each VoIP X Â supports one line.Â
* Call Appearance:Â Each line supports up to 2 call appearances. A call appearance can be viewed as a voice connection point on a line. A call appearance can be used to open another call from the same line by placing an active call on hold. Call appearances also allow the VoIP X to support call waiting.Â
* Conference: The VoIP X can create a local conference by joining two call appearances into a single active call.Â

Â Â

Â Â

## Call State Requests

This command will give a onetime indication of the current state of the VoIP phone. TheÂ Instance TagÂ is variable and needs to match what is running in the current configuration.Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| VoIPControlStatus1 | get | callState |

Â Â

Note:Â The following details and examples are specific to the SVC-2 VoIP implementation. VoIP X implementation will be limited according to its line and call appearance capability.Â 

Â Â

Â Â

## Subscriptions

### Subscribe to a Call State

This command will set a subscription to a VoIP cardâs current state. Please review theÂ subscriptionsÂ section for more details. If any portion of the cardâs call state changes, a subscription response will be provided indicating the current status of all call states.

The response of the subscription depends on theÂ SESSION verboseÂ State that was active at the time the subscription was setup. Examples will be given to show the response of a call state in both verbose and non-verbose formats.

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| VoIPControlStatus1 | subscribe | callState | [CustomLabel] | [Time(ms)] |

* IndexÂ can be used to assign a custom label to the subscription. This label is not required but is recommended, especially if there is more than one SVC-2 card in the system. The label would indicate to the control system which card is providing the state change. Instance Tags are not included in call state subscriptions responses.
* ValueÂ can be used to throttle the rate of response to the control system. Since a call state subscription update is only provided after a state change there should be no need to place a value in this field. Placing a value, especially if it is too high, could introduce a missed update effectively getting the SVC card and the control system out of sync. By default the call state subscription has a 200ms delay, this ensures that the as many changed states as possible are included in a single call state response. Â
* Subscriptions are lost when the Tesira server is rebooted.
* Subscriptions can be re-validated by subscribing to the same block at regular intervals. If this is done ensure that the custom label used inÂ IndexÂ is used in the re-subscription. If this label is not included it is possible to inadvertently open multiple subscriptions to the same call state. Â

Â Â

### Unsubscribing from a Call State

This command will cancel a previously set subscription.Â 

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| VoIPControlStatus1 | unsubscribe | callState | [CustomLabel] |

Â Â

### Call State Indication Fields

A Call State response will provide information for the entire SVC-2 card. The response will include both VoIP lines with 6 call appearances per line. Â 

#### Example - Note Line Feeds are Shown to Aid Readability

! "publishToken":" Room1" "value":{"callStateInfo":[ {"state":VOIP\_CALL\_STATE\_RINGBACK "lineId":0 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"\"07131038\"\"146\"\"\"" "prompt":VOIP\_PROMPT\_CONNECTING} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":1 "action": UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":2 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":3 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":4 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":5 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":1 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":2 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":3 "action":UI\_CLEAR\_STATUS"cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":4 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":5 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED}]}

Â Â

### Call Appearance - Information Included in Call State Response

Each call appearance provides the following information fields in the Call State response. Â

#### State

* The State response gives the current operating conditions of the call appearance on the VoIP line. Â
* The verbose indicator for the State field is: âstateâ
* Non-Verbose indicator responses will be numeric and are shown below.Â Â Â  Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| VOIP\_CALL\_STATE\_INIT | 1 | The call appearance is initializing indicating general setup is in place; DHCP in progress, registration is taking place, etc. This can also indicate that the line has not been configured. The SVC-2 card will not be able to dial when this state is displayed. |
| VOIP\_CALL\_STATE\_FAULT | 2 | General Fault condition; Network link is down, IP address conflict in place. The SVC-2 card will not be able to dial when this state is displayed. |
| VOIP\_CALL\_STATE\_IDLE | 3 | Call Appearance is part of a registered connection to a Proxy Server and is ready to make or receive a call. Â |
| VOIP\_CALL\_STATE\_DIALTONE | 4 | Call appearance is off hook and dial tone is present. |
| VOIP\_CALL\_STATE\_SILENT | 5 | User has started dialing numbers but has yet to hit send |
| VOIP\_CALL\_STATE\_DIALING | 6 | User has hit send on the call appearance and the card has sent an INVITE to the proxy or the called party. No response has been received at this point. Â |
| VOIP\_CALL\_STATE\_RINGBACK | 7 | The far end is ringing |
| VOIP\_CALL\_STATE\_RINGING | 8 | The call appearance has an incoming call |
| VOIP\_CALL\_STATE\_ANSWER\_CALL | 9 | The call has been answered but the call isn't active yet |
| VOIP\_CALL\_STATE\_BUSY | 10 | The far end is busy |
| VOIP\_CALL\_STATE\_REJECT | 11 | User has rejected the incoming call |
| VOIP\_CALL\_STATE\_INVALID\_NUMBER | 12 | The user has dialed an invalid number on this call appearance |
| VOIP\_CALL\_STATE\_ACTIVE | 13 | A call has been connected to the call appearance |
| VOIP\_CALL\_STATE\_ACTIVE\_MUTED | 14 | A call is established but audio is muted in the VoIP Receive block |
| VOIP\_CALL\_STATE\_ON\_HOLD | 15 | The near end has placed the call appearance on hold |
| VOIP\_CALL\_STATE\_WAITING\_RING | 16 | The call appearance has received a call waiting indication |
| VOIP\_CALL\_STATE\_CONF\_ACTIVE | 17 | The call appearance has been placed in a local conference |
| VOIP\_CALL\_STATE\_CONF\_HOLD | 18 | The call appearance is part of a local conference that has been placed on hold |
| VOIP\_CALL\_STATE\_XFER\_INIT | 19 | The call appearance is initializing |
| VOIP\_CALL\_STATE\_XFER\_SILENT | 20 | The call appearance is silent |
| VOIP\_CALL\_STATE\_XFER\_REQ\_DIALING | 21 | The call appearance is awaiting number to be dialed |
| VOIP\_CALL\_STATE\_XFER\_PROCESS | 22 | The call appearance is in a process of transferring |
| VOIP\_CALL\_STATE\_XFER\_REPLACES\_PROCESS | 23 | The call appearance is updating the transfer process |
| VOIP\_CALL\_STATE\_XFER\_ACTIVE | 24 | The call appearance transfer is active |
| VOIP\_CALL\_STATE\_XFER\_RINGBACK | 25 | The call appearance is seeing DTMF tones from the proxy server |
| VOIP\_CALL\_STATE\_XFER\_ON\_HOLD | 26 | The call appearance is on hold |
| VOIP\_CALL\_STATE\_XFER\_DECISION | 27 | The call appearance is awaiting confirmation to transfer |
| VOIP\_CALL\_STATE\_XFER\_INIT\_ERROR | 28 | The call appearance has experienced an error initializing the transfer process |
| VOIP\_CALL\_STATE\_XFER\_WAIT | 29 | The call appearance is waiting |

Â Â

Note:Â The following details and examples are specific to the SVC-2 VoIP implementation. VoIP X implementation will be limited according to its line and call appearance capability.

Â Â

### Line ID

* Each SVC-2 card supports two phone lines. A line is indicated as a unique extension on the VoIP system. The Line ID field indicates which line the particular Call State response is located on. Â
* The first line is indicated as Line ID 0 and the second line is Line ID 1.
* The verbose indicator for Line ID is: âlineIdâ. Note the upper case âIâ in this indicator. Â

Â Â

### Call ID

* Each line of the SVC-2 card supports six call appearances. A call appearance is defined as a separate phone connection point of a single phone extension. The Call ID field indicates which call appearance the particular Call State response is reporting. Â
* The first call appearance of a line is indicated as Call ID 0 and the last call appearance of a line is indicated as Call ID 5.
* The verbose indicator for Call ID is: âcallIdâ. Note the upper case âIâ in this indicator.

Â Â

### Action

* The Tesira user interface supports the shifting of focus of a call appearance selection. For example if a call is in place on call appearance 1 and call appearance 2 rings, the user can shift focus in the UI to call appearance 2 to check Caller ID. This action would shift the focus from appearance 1 to 2. Â
* The Call State response will indicate which call appearance is the point of focus for each line in the Action field. A control system program could track this action if multiple devices are providing VoIP dialer control. Â
* There can only be a single focused call appearance per line. Â
* The verbose indicator for Action is: âactionâÂ  Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| UI\_CLEAR\_STATUS | 1 | This call appearance is not the current point of focus in the user interface. |
| UI\_DISPLAY\_STATUS | 2 | This call appearance is the current point of focus in the user interface. |

Â Â

### Caller ID

If caller ID information is available it will be included in the Call State response.

#### Format

"\"MMDDHHmm\"\"incoming\_number\"\"caller\_Name\""

* If no caller ID is available the Call State response for this field will be ""
* The first set of quotes contains the date and time in the format MMDDHHmm.
* The second set of quotes represents the incoming phone number in the format 5036417287.
* The third set of quotes contains the name of the caller. If there are quotes contained within the name, there will be a backslash preceding the quotes within the name, i.e. âJohn \"Johnny\" Doe"
* A Backslash ( \ ) is used as a separator in the caller ID string

Â Â

#### Example - Caller ID Response with All Information Provided

"\"07131134\"\"15036260281\"\"Biamp Systems\""

Â Â

#### Example - Caller ID Response without All Information Provided

"\"07131134\"\"15036260281\"\"\""

Â Â

The verbose indicator for Caller ID is: âcidâ

Â Â

### Prompt

The Tesira user interface provides prompting indications of the state of the call appearance that is currently in focus. This prompting information is also included in the Call State response. A control system can use the prompt indications to provide users information about the individual call appearance states. Note that a prompt is provided for each call appearance in the Call State response. Â

The verbose indicator for Prompt is: "prompt"Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| VOIP\_PROMPT\_NONE | 1 | Nothing to display in prompt field |
| VOIP\_PROMPT\_STARTING | 2 | SVC-2 card is booting. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_REGISTERING | 3 | SVC-2 is registering to a Proxy Server. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED | 6 | SIP User field has not been configured on the line properties page. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_ENTER\_NUMBER | 7 | SVC-2 card is off hook and waiting for a number entry |
| VOIP\_PROMPT\_CONNECTING | 8 | Connecting to the number dialed |
| VOIP\_PROMPT\_INCOMING\_CALL\_FROM | 9 | Incoming call from a far end |
| VOIP\_PROMPT\_PEER\_BUSY | 10 | The far end device is busy |
| VOIP\_PROMPT\_CALL\_CANNOT\_BE\_COMPLETED | 11 | The number called from the SVC-2 card cannot be completed |
| VOIP\_PROMPT\_ON\_HOLD | 12 | The SVC-2 card has placed the call on hold |
| VOIP\_PROMPT\_CALL\_ON\_HELD | 13 | The far end device has placed the call on hold |
| VOIP\_PROMPT\_CONFERENCE | 14 | The SVC-2 card has placed this call appearances into a conference |
| VOIP\_PROMPT\_CONFERENCE\_ON\_HOLD | 15 | The SVC-2 card has placed a conference on hold |
| VOIP\_PROMPT\_CONNECTED | 16 | The call appearance is connected to a far end device |
| VOIP\_PROMPT\_CONNECTED\_MUTED | 17 | The call appearance is connected to a far end device but the VoIP Receive block has been muted |
| VOIP\_PROMPT\_AUTH\_FAILURE | 18 | Authentication to Proxy Server has failed |
| VOIP\_PROMPT\_PROXY\_NOT\_CONFIGURED | 19 | A Proxy Address has not been entered in the SVC line properties page |
| VOIP\_PROMPT\_NETWORK\_INIT | 20 | The SVC-2 card is setting up network communications. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_DHCP\_IN\_PROGRESS | 21 | The SVC-2 card is requesting an IP address via DHCP. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_NETWORK\_LINK\_DOWN | 22 | The SVC-2 network link sees no connection. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_NETWORK\_LINK\_UP | 23 | The SVC-2 network port sees a connection point but cannot make use of it due to its current IP settings. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_IPADDR\_CONFLICT | 24 | An IP Address is conflict has been detected. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_NETWORK\_CONFIGURED | 25 | The SVC network interface has been configured. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_CODEC\_NEGOTIATION\_FAILURE | 26 | Codec negotiation between the endpoints has failed |
| VOIP\_PROMPT\_UNEXPECTED\_ERROR | 27 | The SVC card has encountered an unexpected error |
| VOIP\_PROMPT\_AUTH\_USER\_NOT\_CONFIGURED | 28 | Authentication Username has not been configured in the SVC line properties page |
| VOIP\_PROMPT\_AUTH\_PASSWORD\_NOT\_CONFIGURED | 29 | Authentication Password has not been configured in the SVC line properties page |
| VOIP\_PROMPT\_DND | 30 | Do Not Disturb |
| VOIP\_PROMPT\_INVALID\_NUMBER | 31 | Invalid Dialed Number (Number not routable by proxy server) |
| VOIP\_PROMPT\_TEMP\_UNAVAILABLE | 32 | Temporary Not Available (The caller is temporarily unavailable such as DND is on) |
| VOIP\_PROMPT\_DECLINED | 33 | Call is Declined (the call is declined by the far end or the server) |
| VOIP\_PROMPT\_SERVICE\_UNAVAILABLE | 34 | Service Unavailable (such as a PSTN call but PSTN gateway isnât configured or no rule to get there) |
| VOIP\_PROMPT\_FORBIDDEN | 35 | Call Forbidden (The call is prohibited because of policy) |
| VOIP\_PROMPT\_BEING\_XFER\_TO | 36 | Call is Being Transfer to |
| VOIP\_PROMPT\_XFER\_IN\_PROCESS | 37 | Transfer in Process |
| VOIP\_PROMPT\_XFER\_TIME\_OUT | 38 | Transfer Timeout (Transfer not finished in a designated time) |
| VOIP\_PROMPT\_PROXY\_UNAVAILABLE | 39 | Proxy Unavailable (such as the configurable proxy is down) |

Â Â

### Syntax of the Call State Response

Call State response information order:

The Call State response will present the information listed above for each line and call appearance of the VoIP instance. If a subscription to a Call State response is setup, the subscription will update if a change is detected in any of the information fields. Call State is available in both verbose and non-verbose responses. Below is an example of the order of information in a Call State response. Note that the â{â¦.}â field indicates the additional lines and call appearances on the VoIP instance. Â

HEADER\_TOKEN:[{STATE: LINE\_ID: CALL\_ID: ACTION: CALLER\_ID: PROMPT} {â¦.} {â¦.}]

Â Â

### Call State Subscription Header Examples

All subscription responses will start with the â!â character for easy recognition. The response will also include token information in the form of the custom label associated with the subscription. Custom labels are defined in the Index command when the subscription is setup. Below is an example or the subscription header of a Call State response in both verbose and non-verbose formats. In each case the custom label was defines as âRoom\_1â and the â{â¦}â symbol indicates the additional responses from the specific call appearances.Â

Â Â

Note:Â The following details and examples are specific to the SVC-2 VoIP implementation. VoIP X implementation will be limited according to its line and call appearance capability.Â

Â Â

#### Verbose Format

! "publishToken":" Room\_1" "value":{"callStateInfo":[{â¦.} {â¦.}]}Â 

Â Â

#### Non-Verbose Format

! "Room\_1" [[â¦.] [â¦.]]Â 

Â Â

### Single Call Appearance Response Examples

Below is an example of a response from a single call appearance in both verbose and non-verbose formats. This information is intended to show a clear example of the response order of a single appearance.Â

The call in each example shows the call state after a call was placed on line 0, call appearance 3, with the far end currently ringing. Caller ID information is also included.Â

Â Â

#### Verbose Format

{"state":VOIP\_CALL\_STATE\_RINGBACK "lineId":0 "callId":3 "action":UI\_DISPLAY\_STATUS "cid":"\"07131124\â\â146\â\âJohn Smith\ââ "prompt":VOIP\_PROMPT\_CONNECTING}

Â Â

#### Non-Verbose Format

[7 0 3 2 "\"07131124\â\â146\â\âJohn Smith\ââ 8]

Â Â

### Call State Full Command Examples

An actual Call State response will include two separate lines, each with 6 call appearances. An example of a full response is provided below in both verbose and non-verbose formats. The following responses show a ring-back on line 0, call appearance 0. All other call appearances on line 0 are idle. Line 1 has not been configured. Â 

Â Â

#### Verbose Format

! "publishToken":" Room 1" "value":{"callStateInfo":[{"state":VOIP\_CALL\_STATE\_RINGBACK "lineId":0 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"\"07131038\"\"146\"\"\"" "prompt":VOIP\_PROMPT\_CONNECTING} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":1 "action": UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":2 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":3 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":4 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":5 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":1 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":2 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":3 "action":UI\_CLEAR\_STATUS"cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":4 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":5"action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED}]}

Â Â

#### Non-Verbose Format

! "Room\_1" [[[7 0 0 2 "\"07131038\"\"146\"\"\"" 8] [3 0 1 1 ââ 1] [3 0 2 1 ââ 1] [3 0 3 1 "" 1] [3 0 4 1 "" 1] [3 0 5 1 "" 1] [1 1 0 2 "" 6] [1 1 1 1 ââ 6] [1 1 2 1 ââ 6] [1 1 3 1 "" 6] [1 1 4 1 "" 6] [1 1 5 1 "" 6]]]

Â Â

Â Â


---


# TC Call State Commands

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/TC_Call_State_Commands.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# TC Call State Commands

The analog Control Status Block supports the use of Call State monitoring in order to poll information about the current call state of the telephone card. The response will include multiple information fields for the line. Call State is also available as a subscribed service to allow unsolicited feedback to a connected control system via TTP. A full call state subscription update will be sent if any single part of the call state has changed. Â 

Â Â

Â Â

## Definitions

### Line

A single extension on the STC-2 card. A line will have a dedicated phone number and the voice signals for this line are available as an independent input and output in the Tesira system. Each STC-2 card supports two lines and these lines may be used at the same time. Â 

### Call Appearance

A call appearance can be viewed as a voice connection point on a line. Each line supports a single call appearance. The call appearance will always indicate a 0 in the Tesira STC card. Â Note that this does not mean that the card does not support call waiting or line conferencing, it simply means that this would be a function of the phone system.Â Â 

Â Â

### Call State Requests

Get the status of the Call State:Â 

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| TIControlStatus1 | get | callState |

This command will give a onetime indication of the current state of the analog phone.Â

The Instance Tag field is variable and needs to match what is running in the current configuration. Â

Â Â

Â Â

## Subscriptions

### Subscribe to a Call State

This command will set a subscription to a VoIP cardâs current state. Review [TTPÂ Subscriptions](../../Tesira_Text_Protocol/TTP_Subscriptions.htm)Â for additional details. If any portion of the cardâs call state changes, a subscription response will be provided indicating the current status of all call states.Â

The response of the subscription depends on theÂ [Session](../Service_Addresses/Session.htm) verboseÂ State that was active at the time the subscription was setup.Â 

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| TIControlStatus1 | subscribe | callState | [CustomLabel] | [Time(ms)] |

IndexÂ can be used to assign a custom label to the subscription. This label is not required but is recommended, especially if there is more than one STC-2 card in the system.Â The label would indicate to the control system which card is providing the state change.Â Instance Tags are not included in call state subscriptions responses.Â

ValueÂ can be used to throttle the rate of response to the control system. Since a call state subscription update is only provided after a state change there should be no need to place a value in this field. Placing a value, especially if it is too high, could introduce a missed update effectively getting the STC card and the control system out of sync. By default the call state subscription has a 200ms delay, this ensures that the as many changed states as possible are included in a single call state response. Â

Subscriptions are lost when the Tesira server is rebooted.Â Subscriptions can be re-validated by subscribing to the same block at regular intervals. If this is done ensure that the custom label used inÂ IndexÂ is used in the re-subscription. If this label is not included it is possible to inadvertently open multiple subscriptions to the same call state.Â

Â Â

### Unsubscribing from a Call State

Use this command will cancel a previously set subscription.Â 

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| TIControlStatus1 | unsubscribe | callState | [CustomLabel] |

Â Â

Â Â

## Call State Indication Fields

A Call State response will provide information for the requested STC-2 card line. Â Every Call State response will include the following information fields. Â

### State

The State response gives the current operating conditions of the call on the analog line.Â  Â

* The verbose indicator for the State field is: âstateâÂ
* Non-Verbose indicator responses will be numeric and are shown below.Â Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| TI\_CALL\_STATE\_IDLE | 1 | The analog line is on hook and ready to make a call |
| TI\_CALL\_STATE\_DIALING | 2 | A number has been entered in the STC card and it is currently dialing |
| TI\_CALL\_STATE\_RINGBACK | 3 | The far end is ringing |
| TI\_CALL\_STATE\_BUSY\_TONE | 4 | The far end has presented a busy indication |
| TI\_CALL\_STATE\_ERROR\_TONE | 5 | The STC card has received an error tone on the line |
| TI\_CALL\_STATE\_CONNECTED | 6 | The call to the far end has been connected |
| TI\_CALL\_STATE\_RINGING | 7 | A STC card has detected an incoming call |
| TI\_CALL\_STATE\_DROPPED | 8 | The far end has hung up the call |
| TI\_CALL\_STATE\_INIT | 12 | The card is booting |
| TI\_CALL\_STATE\_FAULT | 13 | A fault has been detected on the phone line (reference the prompt field for more information) |
| TI\_CALL\_STATE\_CONNECTED\_MUTED | 14 | A call has been connected but the SVC receive block mute has been engaged |

Â Â

### Line ID

Each STC-2 card supports two phone lines. A line is indicated as a unique extension on the analog system. The Line ID field indicates which line of the card the particular Call State response is located for. Â

* A Call State response is only valid for a single line; the line of the Control Status block that the request was sent to.Â
* The first line is indicated as Line ID 0 and the second line is Line ID 1.Â
* The verbose indicator for Line ID is: âlineIdâ (Note: the upper case âIâ in this indicator)Â

Â Â

### Call ID

Unlike the Tesira SVC-2 (VoIP) card, each line of the STC-2 card only supports a single call appearance. A call appearance is defined as a separate phone connection point of a single phone extension. The Call ID field indicates which call appearance the particular Call State response is reporting. This will vary in the SVC-2 card but the STC-2 card will always report 0. Although the information contained in this Call State response field may not be pertinent to the STC operation, it has been left in so the same control system parser can be used for both types of telephony cards. Â

The verbose indicator for Call ID is: âcallIdâ. (Note: the upper case âIâ in this indicator)Â

Â Â

### Action

The Action field of the Call State response is a function of the Tesira SVC-2 (VoIP) interface. Â Although the information contained in this Call State response field may not be pertinent to the STC operation, it has been left in so the same control system parser can be used for both types of telephony cards. Â

The information provided in this field for the STC card willÂ alwaysÂ be:Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| UI\_DISPLAY\_STATUS | 1 | Call State response |

The verbose indicator for Action is: âactionâÂ

Â Â

### Caller ID

If caller ID information is available it will be included in the Call State response.Â Â 

#### Format

"\"MMDDHHmm\"\"incoming\_number\"\"caller\_Name\""Â 

* If no caller ID is available the Call State response for this field will be ""Â
* The first set of quotes contains the date and time in the format MMDDHHmm.Â
* The second set of quotes represents the incoming phone number in the format 5036417287.Â
* The third set of quotes contains the name of the caller. If there are quotes contained within the name, there will be a backslash preceding the quotes within the name, i.e. âJohn \"Johnny\" Doe"Â
* A Backslash ( \ ) is used as a separator in the caller ID stringÂ
* The verbose indicator for Caller ID is: âcidâÂ

#### Example - Caller ID Response with all Information Provided

"\"07131134\"\"15036260281\"\"Biamp Systems\""Â 

#### Example - Caller ID Response without all Information Provided

"\"07131134\"\"15036260281\"\"\""Â 

Â Â

### Prompt

The function of the prompt field in the STC Call State response is to provide further information on fault states detected on the analog line. Â

The verbose indicator for Prompt is: âpromptâÂ

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| FAULT\_NONE | 1 | No line fault has been detected |
| FAULT\_OVERCURRENT | 2 | STC-2 card has detected excessive current on the phone line. \* |
| FAULT\_UNDERVOLTAGE | 3 | STC-2 card has detected a low voltage condition on the phone line. \* Â |
| FAULT\_UNDERCURRENT | 4 | Â STC-2 card has detected a low current condition on the phone line. \*Â |
| FAULT\_OVERVOLTAGE | 5 | STC-2 card has detected excessive voltage on the phone line. \*Â |
| FAULT\_POLARITY\_REVERSAL | 6 | The + & - legs of the analog telephone line are reversed |

\* Note:Â The trigger point of a voltage fault is dependent on the Country of Origin settings defined in Tesira software.Â 

Â Â

### Syntax of the Call State Response

Call State response information order:Â

The Call State response will present the information listed above for each line and call appearance of the STC card. If a subscription to a Call State response is setup, the subscription will update if a change is detected in any of the information fields. Call State is available in both verbose and non-verbose responses. Below is an example of the order of information in a Call State response. Â

HEADER\_TOKEN:[{STATE: LINE\_ID: CALL\_ID: ACTION: CALLER\_ID: PROMPT}]Â

Â Â

### Call State Full Command Examples

In the following examples a Call State response will be given in both verbose and non-verbose formats. This information is intended to show a clear example of the expected response order.Â

All subscription responses will start with the â!â character for easy recognition. The response will also include token information in the form of the custom label associated with the subscription. Custom labels are defined in theÂ IndexÂ of the Call State command when the subscription is setup. Â

In the following examples custom label was defines as âRoom\_1â. The call in each example shows the call state immediately after a call has been placed on line 0.Â

#### Verbose Format

! "publishToken":" Room 1" "value":{"callStateInfo":[{"state":TI\_CALL\_STATE\_DIALING "lineId":0 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"\"07131038\"\"146\"\"\"" "prompt":FAULT\_NONE} ]}Â 

#### Non-Verbose Format

! "Room\_1" [[[2 0 0 2 "\"07131038\"\"146\"\"\"" 1]]]Â 

Â Â

Â Â


---


# TI Transmit Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/TI_Transmit_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# TI Transmit Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| TITransmit1 | get | level |

Â Â

#### Example

TITansmit get level +OK "value":0.000000

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Level | level | get / set / increment / decrement | Â | minLevel - maxLevel dB |
| Max Level | maxLevel | get / set / increment / decrement | Â | minLevel - 0.0 dB |
| Min Level | minLevel | get / set / increment / decrement | Â | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle | Â | false, true |
| Channel Count | numChannels | get | Â | Always 1 |

Â Â

Â Â


---


# TI Receive Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/TI_Receive.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# TI Receive Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| TIReceive1 | get | level |

Â Â

#### Example

TIReceive get level +OK "value":0.000000Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Line Echo Cancel | lec | get / set / toggle | Â | false, true |
| Input Level | level | get / set / increment / decrement | Â | minLevel - maxLevel dB |
| Max Input Level | maxLevel | get / set / increment / decrement | Â | minLevel - 12.0 dB |
| Min Input Level | minLevel | get / set / increment / decrement | Â | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Channel Count | numChannels | get | Â | Always 1 |
| Ring Tone Level | ringLevel | get / set / increment / decrement | Â | -100.0 - 0.0 dB |

Â Â

Â Â


---


# TI Control Status Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/TI_Control_Status_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# TI Control Status Block

The TI Control/Status blocks allows TTP control of a number ofÂ TI Service CodesÂ that can be used for call based functions. It also enables a number ofÂ [STC Call State commands](TC_Call_State_Commands.htm)Â that allows monitoring and feedback to a control system as well as TI Control Status AttributesÂ for controlling general STC-2 functions.Â See below for details.

When aÂ STC-2Â card is used and a Dialer is added and associated with the respective Control/Status block there are also a number of dialer specific attributes. Please refer to theÂ [Dialer](../Control_Blocks/Dialer_Block.htm)Â section for more information.Â

Â Â

Â Â

## TI Service Codes

The Following table summarizes TI Service Codes. Due to the nature of the service being requested they do not require specific Attribute commands (get, set, etc). Adding aÂ Dialer Component objectÂ will allow many more calling functions. Please refer to theÂ Dialer BlockÂ section for more information.Â 

Â Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service Code | Value |
| --- | --- | --- |
| TIControlStatus1 | dial | +15036417287 |

Â Â

| Description | Service Code | Value |
| --- | --- | --- |
| Answer | answer | Â |
| Dial (used when On Hook only) | dial | Number to Dial (A String) |
| DTMF (used when Off Hook only) | dtmf | One number between 0 - 9, \* or # |
| End | end | Â |
| Flash | flash | Â |
| Redial | redial | Â |
| Â | suspend | Â |
| Â | test | Â |
| Â | testResult | Â |

Â Â

Â Â

## TI Control Status Attributes

When aÂ STC-2Â card is used it also allows access to all the dialer functions. Please refer to theÂ [Dialer](../Control_Blocks/Dialer_Block.htm)Â section for more information.Â 

Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| TIControlStatus1 | set | autoAnswer | true |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Auto Answer | autoAnswer | get / set / toggle | Â | false, true |
| Auto Answer Ring Count | autoAnswerRingCount | get / set | Â | AA\_ONE\_RING, AA\_TWO\_RINGS, AA\_THREE\_RINGS, AA\_FOUR\_RINGS, AA\_FIVE\_RINGS |
| Auto Disconnect Type | autoDisconnect | get / set | Â | AD\_NONE, AD\_LOOP\_DROP, AD\_CALL\_PROGRESS, AD\_LOOP\_DROP\_PLUS\_CALL\_PROGRESS |
| Busy Tone Detected | busyToneDetected | get / subscribe / unsubscribe | Â | false, true |
| Caller ID Enabled | callerIdEnable | get / set / toggle | Â | false, true |
| Call State | callState | get / subscribe / unsubscribe | Â | Â |
| Simple Caller ID | cid | get | Â | Â |
| Full Caller ID | cidUser | get | Â | Â |
| Dialing | dialing | get / subscribe / unsubscribe | Â | false, true |
| Dial Tone Detected | dialToneDetected | get / subscribe / unsubscribe | Â | false, true |
| Dial Tone Level | dialToneLevel | get / set / increment / decrement | Â | -70.0 - 12.0 dB |
| Line Fault | faultCondition | get / subscribe / unsubscribe | Â | LINE\_NO\_FAULT, LINE\_OVERCURRENT\_FAULT, LINE\_UNDERVOLTAGE\_FAULT, LINE\_UNDERCURRENT\_FAULT, LINE\_OVERVOLTAGE\_FAULT, LINE\_POLARITY\_REVERSAL\_FAULT |
| Flash | hookFlash | set | Â | Value ignored |
| Flash Duration | hookFlashDuration | get / set / increment / decrement | Â | 100 - 800 ms |
| Hook State | hookState | get / set / subscribe / unsubscribe | Â | OFFHOOK, ONHOOK |
| Last Number Dialed | lastNum | get / subscribe / unsubscribe | Â | Â |
| Line Fault | lineFault | get / subscribe / unsubscribe | Â | false, true |
| Line Intrusion | lineIntrusion | get / subscribe / unsubscribe | Â | false, true |
| Line In Use | lineInUse | get / subscribe / unsubscribe | Â | false, true |
| Line Ready | lineReady | get / subscribe / unsubscribe | Â | false, true |
| Line Voltage | lineVoltage | get / subscribe / unsubscribe | Â | Actual line voltage |
| DTMF Local Level | localDtmfToneLevel | get / set / increment / decrement | Â | -100.0 - 12.0 dB |
| Loop Current | loopCurrent | get / subscribe / unsubscribe | Â | Actual loop current |
| Channel Count | numChannels | get | Â | Always 1 |
| Ring Back Tone Detected | ringBackToneDetected | get / subscribe / unsubscribe | Â | false, true |
| Ringing | ringing | get / subscribe / unsubscribe | Â | false, true |
| Use Redial | useRedial | get / set / toggle | Â | false, true |
| Wait For Dial Tone | waitForDialTone | get / set / toggle | Â | false, true |

Â Â

Â Â


---


# Attribute Tables - Mics


# Parle Mic Beam Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mics/Parl%C3%A9_Mic_Beam_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# ParlÃ© Mic Beam Blocks

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

## ParlÃ© Microphone Status Attributes

Â Â

| Instance Tag |
| --- |
| ParleMic1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Mic Audio Sources | audioSources | get / subscribe / unsubscribe | channel | Vector of intensity and angle pairs for the beams in a single microphone. Intensity of 0.0 indicates off. |
| Mic Beam Setup Mode | beamSetup | get / set / subscribe / unsubscribe | Â | NO\_DEMO, ACTIVE\_SEGMENTS, BEAM\_TRACKING, SHOW\_MIC\_ORIENTATION |
| Mic Enable Logic Outputs | enableLogicOutputs | get | Â | false, true |
| Mic Has Mute Button | hasMuteButtonOnMic | get | Â | false, true |
| Mic Height is Adjustable | heightIsAdjustable | get | Â | false, true |
| Mic Input Level | inputLevel | get / subscribe / unsubscribe | channel | -100.0 - 36.0 |
| Mic LED Logic | ledLogic | get | Â | NONE, LOGIC\_INPUTS\_CONTROL\_LEDS |
| Mic Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| Mic Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Mic Lobe data | lobeData | get / subscribe / unsubscribe | channel | Â |
| Mic Segment Peaks | lobePeaks | get / subscribe / unsubscribe | channel | Â |
| Mic Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Mic button states | micButtons | get / subscribe / unsubscribe | channel | false, true |
| Mic Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mic Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Mic Mute as Group | muteAsGroup | get | Â | false, true |
| Mic Mute Button Disabled | muteButtonOnMicDisabled | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Mic Mutes | mutes | get / subscribe / unsubscribe | Â | Â |
| Mic Channel Count | numChannels | get | Â | 1 - 3 |
| Mic Segment Count | numSegments | get | Â | 3 - 4 |
| Mic Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| Mic All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Mic Segments Active | segmentsActive | get / subscribe / unsubscribe | channel | Â |
| Mic Supports BeamOut | supportsBeamOuts | get | Â | false, true |
| Mic Has Tracking Limits | supportsTrackingLimits | get | Â | false, true |

Â Â

Â Â

## ParlÃ© Beam Block Attributes

Â Â

| Instance Tag |
| --- |
| ParleBeam1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Level | level | get / set / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | minLevel - maxLevel dB |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100 -maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Array of booleans |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peak States | peaks | get / subscribe / unsubscribe | Â | Array of booleans |

Â Â

Â Â


---


# SHURE Mic Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mics/SHURE_Mic_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# SHURE Mic Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| ShureMic1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Name (Dante 'RX Channel Label') | channelName | get / set | channel | Case-insensitive, up to 31 characters except '=' '.' '@' '\' '<' '>' |
| Device Name (Dante 'Hostname of TX Device') | deviceName | get / subscribe / unsubscribe | channel | Â |
| All Device Names (Dante 'Hostnames of all TX Devices') | deviceNames | get / subscribe / unsubscribe | Â | Â |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Microphone Model | micModel | get | Â | MXA910 MXA310 ANYTYPE |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 64 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â


---


# Audio-Technica Mic Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mics/Audio-Technica_Mic_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Audio-Technica Mic Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| DanteMic1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Name (Dante Â 'RX Channel Label') | channelName | get / set | channel | Case-insensitive, up to 31 characters except '=' '.' '@' '\' '<' '>' |
| Device Name (Dante 'Hostname of TX Device') | deviceName | get / subscribe / unsubscribe | channel | Â |
| All Device Names (Dante 'Hostnames of all TX Devices') | deviceNames | get / subscribe / unsubscribe | Â | Â |
| Logic Output Enable | enableLogicOutputs | get | Â | false, true |
| Fault on Inactive | faultOnInactive | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Gain | gain | get / set / increment / decrement | channel | 30-50 dB in 10 dB increments |
| Invert | invert | get / set / toggle | channel | false, true |
| LED Logic | ledLogic | get | Â | NONE, Â  ONE\_LOGIC\_INPUT\_ ALTERNATELY\_DRIVES \_TWO\_LEDS, Â  TWO\_LOGIC\_INPUTS \_FOR\_SEPARATE\_ CONTROL\_OF\_TWO\_LEDS |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Locate Mode Enable | locateMode | get / set / toggle | channel | false, true |
| Low Cut | lowCut | get / set / toggle | channel | false, true |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Microphone Mode | micMode | get | Â | TOGGLE\_MUTE, TOGGLE\_TALK, PUSH\_TO\_TALK, PUSH\_TO\_MUTE, EXTERNAL |
| Microphone Model | micModel | get | Â | ATND971, ATND8677, ATND8734, ANYTYPE |
| Microphone Mute Occurring | micMute | get / subscribe / unsubscribe | channel | false, true |
| All Microphone Mute Occurring States | micMutes | get / subscribe / unsubscribe | Â | Â |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 64 |
| Logic Input Count | numLogicInputs | get | Â | Zero to three per input channel |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Phantom Power | phantomPower | get / set / toggle | channel | false, true |

Â Â

Â Â


---


# Attribute Tables - Amps


# Voltera A Series Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/Voltera_A_Series_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Voltera A Series Blocks

Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service | Command | Index | Value |
| --- | --- | --- | --- | --- |
| VAmp1 | Â level | Â set | Â 1 | Â -3.0 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Input LabelÂ | inputLabel | get / set | channel | Â |
| User Input dB | level | get / set / subscribe / unsubscribe | channelÂ | minLevel - maxLevel dB |
| User Input Percent | levelPercent | get / set / subscribe / unsubscribe | channel | minLevel - maxLevel percent |
| User Input Mute | mute | get / set / subscribe / unsubscribe | channel | false, true |
| Loudspeaker Output dB | outputLevel | get / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Loudspeaker Output Levels | outputLevels | get / subscribe / unsubscribe | Â | Â |
| Output Label | outputLabel | get / setÂ | channel | Â |

Â

Â


---


# Voltera D/DM Series Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/Voltera_D_DM_Series_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Voltera D/DM Series Blocks

Â Â

## Service Attributes

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Service | Service Code | Parameters |
| --- | --- | --- |
| Sleep Device | sleep | Â |
| Wake Device | wake | Â |

Â Â

## Status Attributes

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service | Command | Index | Value |
| --- | --- | --- | --- | --- |
| VDAmp1 | Â level | Â set | Â 1 | Â -3.0 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Amplifier Fault Indicator | ampFault | get / subscribe / unsubscribe | Â | false, true |
| Amplifier Warning Indicator | ampWarning | get / subscribe / unsubscribe | Â | false, true |
| Input LabelÂ | inputLabel | get / set | channel | Â |
| User Input dB | level | get / set / subscribe / unsubscribe | channelÂ | minLevel - maxLevel dB |
| User Input Percent | levelPercent | get / set / subscribe / unsubscribe | channel | minLevel - maxLevel percent |
| User Input Mute | mute | get / set / subscribe / unsubscribe | channel | false, true |
| Mute All | muteAll | get / set / subscribe / unsubscribe | Â | false, true |
| Amplifier Output Clipping | outputClip | getÂ / subscribe / unsubscribe | Â | false, true |
| Loudspeaker Output dB | outputLevel | get / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Loudspeaker Output Levels | outputLevels | get / subscribe / unsubscribe | Â | Â |
| Output Label | outputLabel | get / setÂ | channel | Â |
| Power Profile Info | powerProfile | get | Â | LIVE\_PERFORMANCEÂ  LIVE\_GREEN |

Â Â

Â Â

Â Â


---


# TesiraXEL 1200 Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/TesiraXEL_1200.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# TesiraXEL 1200 Block

Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| XAmp1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Amplified Output Allowed Power | allowedPowerWatts | get | channel | 0 - 1200 |
| Amplifier Fault Indicator | ampFault | get / subscribe / unsubscribe | Â | false, true |
| Amplifier Fault String | ampFaultString | get / subscribe / unsubscribe | Â | String indicating amplifier fault |
| Amplifier Mute All Channels | ampMuteAll | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplifier Warning Indicator | ampWarning | get / subscribe / unsubscribe | Â | false, true |
| Amplified Output Auto Mute Threshold | automuteThreshold | get / set / increment / decrement | channel | -100.0 - 0.0 |
| Amplified Output Auto Mute Timeout | automuteTimeout | get / set | channel | AUTOMUTE\_TIMEOUT\_DISABLED, AUTOMUTE\_TIMEOUT\_15, AUTOMUTE\_TIMEOUT\_30, AUTOMUTE\_TIMEOUT\_45, AUTOMUTE\_TIMEOUT\_60 |
| Amplified Output Expected Load | expectedLoad | get | channel | EXPECT\_4\_OHMS, EXPECT\_8\_OHMS, EXPECT\_70\_V, EXPECT\_100\_V |
| Front Panel Lock | frontPanelLock | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplified Output High Pass Filter Enable | highPassFilterEnable | get / set / toggle | channel | false, true |
| Amplified Output Impedance | impedance | get / subscribe / unsubscribe | channel | IMPEDANCE\_NONE, IMPEDANCE\_LOWZ, IMPEDANCE\_SHORT, IMPEDANCE\_OPEN |
| Amplified Output Input Clipping | inputClip | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Input Meter | inputLevel | get / subscribe / unsubscribe | channel | -100.0 - 36.0 dBu |
| Amplified Output Invert | invert | get / set / toggle | channel | false, true |
| Amplified Output Level | level | get / set/ increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dBu |
| Amplified Output Limiter Attenuation | limiterAttenuation | get / subscribe / unsubscribe | channel | LIMITER\_ATTENUATION\_NONE, LIMITER\_ATTENUATION\_LIMITING, LIMITER\_ATTENUATION\_CLIPPING |
| Amplified Output Level Max | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dBu |
| Amplified Output Level Min | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dBu |
| Amplified Output Mute | mute | get / set / toggle / subscribe /Â  unsubscribe | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 4 |
| Amplified Output Clipping | outputClip | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Meter | outputLevel | get / subscribe / unsubscribe | channel | -100.0 - 36.0 |
| Amplified Output Protection | protect | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Fault Reporting Enable | reportingEnable | get / set / toggle | channel | false, true |
| Amplified Output Selected Time | selectedTime | get / subscribe / unsubscribe | Â | 0 - 2147483647 |
| Amplified Output Thermal Protection | thermal | get / subscribe / unsubscribe | channel | THERMAL\_NONE, THERMAL\_WARNING, THERMAL\_FAULT |

Â  Â

Â Â

Â Â


---


# Parle PoE AMP Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/Parl%C3%A9_PoE_AMP_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# ParlÃ© PoE AMP Blocks

ParlÃ© AMP-450P & AMP-450BP status attributes.Â

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag |
| --- |
| Amp450P1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Amplifier Fault Indicator | ampFault | get / subscribe / unsubscribe | Â | false, true |
| Amplified Output Mute All Channels | ampMuteAll | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplified Thermal Fault Indicator | ampThermalFault | get / subscribe / unsubscribe | Â | THERMAL\_NONE THERMAL\_WARNING THERMAL\_FAULT |
| Amplifier Warning Indicator | ampWarning | get / subscribe / unsubscribe | Â | false, true |
| Amplified Output Clip | clip | get / subscribe / unsubscribe | channel | CLIP\_NONE CLIP\_CLIPPING |
| Amplified Output Invert | invert | get / set / toggle Â Â | channel | false, true |
| Amplified Output Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| Amplified Output Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Amplified Output Load Impedance | loadImpedance | get / set | channel | LOAD\_8\_OHMS  LOAD\_4\_OHMS |
| Amplified Output Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Amplified Output Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB Â |
| Amplified Output Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Amplified Output Mutes | mutes | get / subscribe / unsubscribe | Â | Array of booleans |
| Amplifier Channel Count | numChannels Â | get | Â | 1-4 |
| Amplified Output Protection | protection | get / subscribe / unsubscribe | channel | PROTECTION\_NONE PROTECTION\_LIMITING PROTECTION\_MUTED |

Â

Â


---


# Tesira Amplifier Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/Tesira_Amplifier.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Tesira Amplifier Blocks

Tesira rack mount amplifiers attributes. These models include:Â AMP-4175R / AMP-4350R / AMP-4300R CV / AMP-8175R.Â Â 

Â Â

## Service Codes

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service |
| --- | --- |
| TAmp1 | select |

Â Â

| Description | Service | Index | Value |
| --- | --- | --- | --- |
| Identify amplifier | select | Â | Â |

Â Â

## Status Attributes

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Amplifier Fault Indicator | ampFault | get / subscribe / unsubscribe | Â | false, true |
| Amplified Output Mute All Channels | ampMuteAll | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplifier Power | ampPower | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplifier Standby Timeout | ampStandbyTimeout | get / set | Â | STANDBY\_TIMEOUT\_DISABLED, STANDBY\_TIMEOUT\_15, STANDBY\_TIMEOUT\_30, STANDBY\_TIMEOUT\_45, STANDBY\_TIMEOUT\_60 |
| Amplifier Thermal Fault Indicator | ampThermalFault | get / subscribe / unsubscribe | Â | THERMAL\_NONE, THERMAL\_WARNING, THERMAL\_FAULT |
| Amplifier Warning Indicator | ampWarning | get / subscribe / unsubscribe | Â | false, true |
| Amplified Output AVB Stream Present Indicator | AVBstreamPresent | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Expected Load Impedance | expectedImpedance | get / set | channel | EXPECT\_8\_OHMS, EXPECT\_4\_OHMS |
| Amplified Output Failover Active Indicator | failoverActive | get / subscribe / unsubscribe | channel | false, true |
| Failover Input Gain | failoverGain | get / set / increment / decrement | channel | 0 - 66 dB in 6 dB increments |
| Amplified Output Failover Input Channel | failoverInputChannel | get / set / increment / decrement | channel | Failover input channel or 0 for none |
| Failover Input Invert | failoverInvert | get / set / toggle | channel | false, true |
| Failover Input Level | failoverLevel | get / set / increment / decrement / subscribe / unsubscribe | channel | failoverMinLevel - failoverMaxLevel dB |
| Failover Input Level Max | failoverMaxLevel | get / set / increment / decrement | channel | failoverMinLevel - 12.0 dB |
| Failover Input Level Min | failoverMinLevel | get / set / increment / decrement | channel | -100.0 - failoverMaxLevel dB |
| Failover Input Mute | failoverMute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Failover Input Peak Indicator | failoverPeak | get / subscribe / unsubscribe | channel | false, true |
| Failover Input Phantom Power | failoverPhantomPower | get / set / toggle | channel | false, true |
| Failover Input Signal Present Indicator | failoverSignalPresent | get / subscribe / unsubscribe | channel | false, true |
| Failover Input Signal Present Threshold | failoverSignalPresentThreshold | get / set / increment / decrement | channel | -64.0 - 30.0 dB |
| Amplified Output Failover Test | failoverTest | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Front Panel Lock | frontPanelLock | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplified Output Sensitivity | gain | get / set / increment / decrement | channel | 0 - 24 dB in 6 dB increments |
| Amplified Output High Impedance Indicator | highImpedance | get / subscribe / unsubscribe | channel | HIGH\_IMPEDANCE\_NONE, HIGH\_IMPEDANCE\_OPEN |
| Amplified Output Input Meter | inputLevel | get / subscribe / unsubscribe | channel | -100.0 - 36.0 dB |
| Amplified Output Invert | invert | get / set / toggle | channel | false, true |
| Amplified Output Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| Amplified Output Limiter Attenuation | limiterAttenuation | get / subscribe / unsubscribe | channel | LIMITER\_ATTENUATION\_NONE, LIMITER\_ATTENUATION\_LIMITING, LIMITER\_ATTENUATION\_CLIPPING |
| Amplified Output Limiter Attenuation Level | limiterAttenuationLevel | get / subscribe / unsubscribe | channel | 0.0 - 24.0 dB |
| Amplified Output Limiter Enable | limiterEnable | get / set / toggle | channel | false, true |
| Amplified Output Low Impedance Indicator | lowImpedance | get / subscribe / unsubscribe | channel | LOW\_IMPEDANCE\_NONE, LOW\_IMPEDANCE\_LOWZ, LOW\_IMPEDANCE\_SHORT |
| Amplified Output Low Impedance Monitoring Enable | lowImpedanceMonitoringEnable | get / set / toggle | channel | false, true |
| Amplified Output Level Max | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Amplified Output Level Min | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Amplified Output Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 8 |
| Amplified Output Current | outputCurrentLevel | get / subscribe / unsubscribe | channel | any value for Arms |
| Amplified Output Voltage | outputVoltageLevel | get / subscribe / unsubscribe | channel | any value for Vrms |
| Selected Time | selectedTime | get / subscribe / unsubscribe | Â | 0 - 2147483647 s |
| Amplified Output Standby Threshold | standbyThreshold | get / set / increment / decrement | channel | -100.0 - 0.0 dB |
| Amplified Output Thermal Fault Indicator | thermalFault | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Thermal Warning Indicator | thermalWarning | get / subscribe / unsubscribe | channel | false, true |

Â Â

Â Â

Â Â


---


# Lab Gruppen Amplifier Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/Lab_Gruppen_Amplifier_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Lab Gruppen Amplifier Block

Â Â

## Service Codes

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service |
| --- | --- |
| TAmp1 | select |

Â Â

| Description | Service | Index | Value |
| --- | --- | --- | --- |
| Identify Amplifier | select | Â | Â |

Â Â

## Status Attributes

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Amplifier Name | ampName | get | Â | Â |
| Amplifier Power | ampPower | get / set / toggle | Â | false, true |
| Amplified Output Amp Status | ampStatus | get / subscribe / unsubscribe | channel | STATUS\_OK, STATUS\_WARNING, STATUS\_ERROR, STATUS\_UNKNOWN |
| Amplified Output Amp Status Reason | ampStatusReason | get | channel | Reason code for any indicator |
| Amplified Output Auto Power Down Threshold | apdThreshold | get / set / increment / decrement | channel | -100.0 - 0.0 dB |
| Auto Power Down Timeout | apdTimeoutMins | get / set / increment / decrement | Â | 0 - 60 min |
| Amplified Output Channel Name | channelName | get | channel | Â |
| Failover Input Gain | failoverGain | get / set / increment / decrement | channel | 0 - 66 dB in 6 dB increments |
| All Failover Input Indicators | failoverIndicators | get / subscribe / unsubscribe | Â | Â |
| Amplified Output Failover Input Channel | failoverInputChannel | get | channel | Failover input channel or 0 for none |
| Failover Input Invert | failoverInvert | get / set / toggle | channel | false, true |
| Failover Input Level | failoverLevel | get / set / increment / decrement | channel | failoverMinLevel - failoverMaxLevel dB |
| Failover Input Level Max | failoverMaxLevel | get / set / increment / decrement | channel | failoverMinLevel - 12.0 dB |
| Failover Input Level Min | failoverMinLevel | get / set / increment / decrement | channel | -100.0 - failoverMaxLevel dB |
| Failover Input Mute | failoverMute | get / set / toggle | channel | false, true |
| Failover Input Peak Indicator | failoverPeak | get subscribe / unsubscribe | channel | false, true |
| Failover Input Phantom Power | failoverPhantomPower | get / set / toggle | channel | false, true |
| Failover Input Signal Present Indicator | failoverSignalPresent | get / subscribe / unsubscribe | channel | false, true |
| Failover Input Signal Present Threshold | failoverSignalPresentThreshold | get / set / increment / decrement | channel | -64.0 - 30.0 dB |
| Amplified Output Failover Test | failoverTest | get / set / toggle | channel | false, true |
| Amplified Output Failover Test Active Indicator | failoverTestActive | get / subscribe / unsubscribe | channel | false, true |
| Frame Status | frameStatus | get / subscribe / unsubscribe | Â | STATUS\_OK, STATUS\_WARNING, STATUS\_ERROR, STATUS\_UNKNOWN |
| Frame Status Reason | frameStatusReason | get | Â | Reason code for any indicator |
| All Frame Indicators | indicators | get / subscribe / unsubscribe | Â | Â |
| Amplified Output Invert | invert | get / set / toggle | channel | false, true |
| Amplified Output Level | level | get / set / increment / decrement | channel | minLevel - maxLevel dB |
| Amplified Output Load Status | loadStatus | get / subscribe / unsubscribe | channel | STATUS\_OK, STATUS\_WARNING, STATUS\_ERROR, STATUS\_UNKNOWN |
| Amplified Output Load Status Reason | loadStatusReason | get | channel | Reason code for any indicator |
| Amplified Output Level Max | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Amplified Output Level Min | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Amplified Output Mute | mute | get /set / toggle | channel | false, true |
| Channel Count | numChannels | get | Â | 4 - 4 |
| Selected Time | selectedTime | get / subscribe / unsubscribe | Â | 0 - 2147483647 s |
| Amplified Output Signal Status | signalStatus | get / subscribe / unsubscribe | channel | STATUS\_OK, STATUS\_WARNING, STATUS\_ERROR, STATUS\_UNKNOWN |
| Amplified Output Signal Status Reason | signalStatusReason | get | channel | Reason code for any indicator |

Â Â

Â Â

## Status Indicator Reason Codes

Indicator reasons provide the user with more detail of indicators by way of text strings. It is possible for this list to change but has no functional effect on the amplifier product. Â Â Â Â

| Reason Code | Text in GUI | Comment |
| --- | --- | --- |
| 1 | PSU SAFEMODE | PSU is in safe mode |
| 2 | SENS FLT:DSP | There is no activity in voltage and current sense on any channel when power is ON |
| 3 | AUDIO FAULT Â | Deactivated Audio OK/ or missing audio clocks. Â |
| 4 | NEED SERVICE:1 | The PSU did not get the PFC state OK signal after turning on the PFC in three attempts OR PFCStateOk has gone low during normal operation (HW error) |
| 5 | NEED SERVICE:2 | The PSU did not get the DC state OK signal after turning on the DC/DC in three attempts OR DCStateOk has gone low during normal operation (HW error) |
| 6 | NEED SERVICE:3 Â | The PFC output voltage did not reach the level where the DC/DC should be turned on within the required time |
| 7 | NEED SERVICE:4 | Communication with DICO was lost Â |
| 8 Â | NEED SERVICE:5 | PSU A/D interrupts are not running Â |
| 9 | NEED SERVICE:6 | NTC fault is detected on a PSU temp sensor |
| 10 | NEED SERVICE:7 | Board Id not recognized Â |
| 11 | NEED SERVICE:8 | Supply voltages to the DSP are failing â This is Analog Ok lost! |
| 12 | TEMP FLT:PSU | Temp warning indicator |
| 13 | TEMP FLT:DSP | Temp warning indicator for P20 slot (Host/DICO4) |
| 14 | MAINS >400 VPK | Mains peak voltage is too high for continued operation |
| 15 | MAINS >270 V | Mains RMS voltage is too high for continued operation. |
| 16 | MAINS <65 V | (MAINS <65V) Mains RMS voltage is too low for continued operation |
| 17 | PSU FAULT | Mains power supply failing. Supply voltages to the DSP are failing |
| 18 | CHECK MAINS | The PFC overvoltage protection (HW) tripped. Retry in 10 seconds |
| 19 | UVL ACTIVE | Output power limited by mains input under voltage |
| 20 | PSU RAIL PROT | An internal voltage went below minimum operating level due to an extreme power demand (40 Hz square wave at 0 dBFS) â This is HW Power Good Lost! |
| 21 | TEMP FAULT | Temp warning indicator Â |
| 22 | NO LOAD | Load monitor detected no load. |
| 23 | SHORT CIRCUIT | Short Circuit Fault |
| 24 | Â  SERVICE CH. Â | Amp channel needs service fault |
| 25 | Â  WRONG LOAD Â | Load monitor correct speaker is connected. Â |
| 26 | CAL ACTIVE | Average current limiter is active |
| 27 | CURRENT CLIP | Current Clip One flash red with defined after glow (400ms) Â |
| 28 | VHF FAULT | Very High Frequency Fault. (15kHz continuously @+2dBu) |
| 29 | PAL ACTIVE | (PAL) Active limitation of mains input due to risk of breaking mains fuse. This flag is valid only for PLM10000 and PLM14000. For PLM20000 see PSU status block below. |
| 30 | VOLTAGE CLIP | Voltage Clip One flash red with defined after glow (400ms) |
| 31 | BEL ACTIVE | Output power limited by fuse model |
| 32 | PAL ACT. WARN | Output power limited by mains input current |
| 33 | PTL ACTIVE | Output power limited by PSU overheat |
| 34 | ATL ACTIVEÂ | Output power limited by amp overheat Â |
| 35 | MAINS GLITCH | A glitch < 8 cycles on the mains voltage was detected. PSU was not turned off. |
| 36 | TEMP WARN: PSU | Temp warning indicator |
| 37 | TEMP WARN Â  Â | Temp warning indicator |
| 38 | UNDER SPKR CNT | Load monitor detected fewer speakers than expected |
| 39 | OVER SPKR CNT | Load monitor detected more speakers than expected |
| 40 | SPKR SHORT | Load monitor speaker magnet temperature warning. Change applies from Tesira v2.3 on |
| 41 | SPKR DAMAGED | Load monitor voice coil temperature warning |
| 42 | UNCERTAIN LOAD | Load monitor is uncertain if correct load is connected or not |
| 43 | SELFTEST ERR | Â |
| 44 | SELFTEST WARN | Â |
| 45 | UPGRADE PSU | Â |

Â Â

Â Â

Â Â


---


# Attribute Tables - Paging


# Paging Zone Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Paging_Blocks/Paging_Zone_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Paging Zone Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Â PagingZone1 | Â get | Â numChannels |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Ducking Level | duckingLevel | get / set / increment / decrement / subscribe / unsubscribe | Â | -100.0 - 0.0 dB |
| Page Max Level | maxPageLevel | get / set / increment / decrement | Â | minPageLevel - 12.0 dB |
| Page Min Level | minPageLevel | get / set / increment / decrement | Â | -100.0 - maxPageLevel dB |
| Number of non-Paging Channels | numChannels | getÂ | Â | 1 - 24 |
| Page Active | pageInProgress | get / subscribe / unsubscribe | Â | false, true |
| Page Level | pageLevel | get / set / increment / decrement / subscribe / unsubscribe | Â | minPageLevel - maxPageLevel dB |

Â Â

Â Â


---


# Paging Control

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Paging_Blocks/Paging_Control.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Paging Control

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Â PageControl1 | Â get | Â pageCodes |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Page Codes | pageCodes | get / set | Â | Â |

Â Â

Â Â


---


# Attribute Tables - Mixers


# Gating Auto Mixer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mixers/Gating_Auto_Mixer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Gating Auto Mixer Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Mixer1 | get | crosspoint | 1 |

Â Â

#### Example

Mixer1 get crosspoint 1 Â 

Mixer2 set crosspoint 1 true

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Crosspoint On | crosspoint | get / set / toggle | channel | false, true |
| Direct Output | directOutputLogic | get / set | channel | POST\_GATE\_PRE\_NOM, POST\_GATE\_POST\_NOM |
| Gate Hold Time | gateHoldTimeMs | get / set / increment / decrement | channel | 0.0 - 6000.0 ms |
| Logic Output | gateLogic | get / set | channel | FOLLOWGATE, ON, OFF |
| Input Label | inputLabel | get / set | channel | Â |
| Input Level | inputLevel | get / set / increment / decrement | channel | inputMinLevel - inputMaxLevel dB |
| Max Input Level | inputMaxLevel | get / set / increment / decrement | channel | inputMinLevel - 12.0 dB |
| Min Input Level | inputMinLevel | get / set / increment / decrement | channel | -100.0 - inputMaxLevel dB |
| Input Mute | inputMute | get / set / toggle | channel | false, true |
| Logic Output Invert | invert | get / set / toggle | channel | false, true |
| Logic Outputs Follow Mic Logic | logicOutputsFollowMicLogic | get / set / toggle | Â | false, true |
| Channel Manual | manual | get / set / toggle | channel | false, true |
| Mic Logic Type | micLogic | get / set | Â | NONE, LASTHOLD, CHAN1, CHAN2, ... |
| Mix Output Label | mixOutputLabel | get / set | Â | Â |
| NOM Gain Enabled | nomGainEnable | get / set / toggle | channel | false, true |
| Open Mic Limit | nomLimit | get / set / increment / decrement | Â | 1 - lesser of numInputs-1 or 7 |
| Open Mic Limit Enabled | nomLimitEnable | get / set / toggle | Â | false, true |
| Input Count | numInputs | get | Â | 2 - 256 |
| Off Attenuation | offGain | get / set / increment / decrement | channel | -80.0 - -10.0 dB |
| Output Level | outputLevel | get / set / increment / decrement | Â | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | Â | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | Â | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle | Â | false, true |

Â Â

Â Â


---


# Gain Sharing Auto Mixer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mixers/Gain_Sharing_Auto_Mixer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Gain Sharing Auto Mixer Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Mixer1 | get | crosspoint | 1 |

Â Â

#### Example

Mixer1 get crosspoint 1 Â 

Mixer2 set crosspoint 1 true

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Level | channelLevel | get / set / increment / decrement / subscribe / unsubscribe | channel | channelMinLevel - channelMaxLevel dB |
| All Channel Levels | channelLevels | get / subscribe / unsubscribe | Â | Â |
| Max Channel Level | channelMaxLevel | get / set / increment / decrement | channel | channelMinLevel - 12.0 dB |
| Min Channel Level | channelMinLevel | get / set / increment / decrement | channel | -100.0 - channelMaxLevel dB |
| Channel Mute | channelMute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Channel Mutes | channelMutes | get / subscribe / unsubscribe | Â | Â |
| Crosspoint On | crosspoint | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Crosspoint States | crosspoints | get / subscribe / unsubscribe | Â | Â |
| Gain Reduction | gainReduction | get / subscribe / unsubscribe | channel | -100.0 - 0.0 dB |
| All Gain Reductions | gainReductions | get / subscribe / unsubscribe | Â | Â |
| Gain Response Time | gainResponseTimeMs | get / set / increment / decrement | Â | 1 - 100 ms |
| Input Label | inputLabel | get / set | channel | Â |
| Input Mute | inputMute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Input Mutes | inputMutes | get / subscribe / unsubscribe | Â | Â |
| Mic Isolation Factor | micIsolationFactor | get / set / increment / decrement | Â | 0.0 - 2.0 |
| Mix Output Label | mixOutputLabel | get / set | Â | Â |
| Input Count | numInputs | get | Â | 2 - 256 |
| Output Level | outputLevel | get / set / increment / decrement / subscribe / unsubscribe | Â | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | Â | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | Â | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle / subscribe / unsubscribe | Â | false, true |

Â Â

Â Â


---


# Standard Mixer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mixers/Standard_Mixer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Standard Mixer Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Index | Value |
| --- | --- | --- | --- | --- | --- |
| Mixer1 | set | crosspoint | 1 | 1 | true |

Result:Â Sets Mixer1 Crosspoint of Input 1 and Output 1 to on.Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Crosspoint On | crosspoint | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| All Crosspoints | crosspointAll | set / toggle | Â | false, true |
| Crosspoint Column | crosspointColumn | set / toggle | output | false, true |
| Crosspoint Diagonal | crosspointDiagonal | set / toggle | input, output | false, true |
| Crosspoint Row | crosspointRow | set / toggle | input | false, true |
| Input Label | inputLabel | get / set | input | name |
| Input Level | inputLevel | get / set / increment / decrement / subscribe / unsubscribe | input | inputMinLevel - inputMaxLevel dB |
| Max Input Level | inputMaxLevel | get / set / increment / decrement | input | inputMinLevel - 12.0 dB |
| Min Input Level | inputMinLevel | get / set / increment / decrement | input | -100.0 - inputMaxLevel dB |
| Input Mute | inputMute | get / set / toggle / subscribe / unsubscribe | input | false, true |
| Input Count | numInputs | get | Â | 2 - 256 |
| Output Count | numOutputs | get | Â | 1 - 256 |
| Output Label | outputLabel | get / set | output | name |
| Output Level | outputLevel | get / set / increment / decrement / subscribe / unsubscribe | output | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | output | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | output | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle / subscribe / unsubscribe | output | false, true |

Â Â

Â Â


---


# Matrix Mixer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mixers/Matrix_Mixer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Matrix Mixer Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Index | Value |
| --- | --- | --- | --- | --- | --- |
| Mixer1 | set | crosspointLevelState | 1 | 1 | true |

Â Â

#### Example

Mixer1 set crosspointLevelState 1 1 true +OK

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Crosspoint Delay | crosspointDelay | get / set / increment / decrement | input, output | 0.0 - 250.0 ms |
| Crosspoint Delay On | crosspointDelayState | get / set / toggle | input, output | false, true |
| All Delay Crosspoints | crosspointDelayStateAll | set / toggle | Â | false, true |
| Delay Crosspoint Column | crosspointDelayStateColumn | set / toggle | output | false, true |
| Delay Crosspoint Diagonal | crosspointDelayStateDiagonal | set / toggle | input, output | false, true |
| Delay Crosspoint Row | crosspointDelayStateRow | set / toggle | input | false, true |
| Crosspoint Level | crosspointLevel | get / set / increment / decrement / subscribe / unsubscribe | input, output | -100.0 - 0.0 dB |
| Crosspoint On | crosspointLevelState | get / set / toggle / subscribe / unsubscribe | input, output | false, true |
| All Crosspoints | crosspointLevelStateAll | set / toggle | Â | false, true |
| Crosspoint Column | crosspointLevelStateColumn | set / toggle | output | false, true |
| Crosspoint Diagonal | crosspointLevelStateDiagonal | set / toggle | input, output | false, true |
| Crosspoint Row | crosspointLevelStateRow | set / toggle | input | false, true |
| Delay Enabled | delayEnabled | get | Â | false, true |
| Input Label | inputLabel | get / set | input | Â |
| Input Level | inputLevel | get / set / increment / decrement / subscribe / unsubscribe | input | inputMinLevel - inputMaxLevel dB |
| Max Input Level | inputMaxLevel | get / set / increment / decrement | input | inputMinLevel - 12.0 dB |
| Min Input Level | inputMinLevel | get / set / increment / decrement | input | -100.0 - inputMaxLevel dB |
| Input Mute | inputMute | get / set / toggle / subscribe / unsubscribe | input | false, true |
| Input Count | numInputs | get | Â | 2 - 256 |
| Output Count | numOutputs | get | Â | 1 - 256 |
| Output Label | outputLabel | get / set | output | Â |
| Output Level | outputLevel | get / set / increment / decrement / subscribe / unsubscribe | output | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | output | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | output | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle / subscribe / unsubscribe | output | false, true |

Â Â

Â Â


---


# Auto Mixer Combiner Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mixers/Auto_Mixer_Combiner_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Auto Mixer Combiner Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| AutoMixerCombiner1 | get | nomLimit | inGroup: | 1 |

Â Â

#### Example

AutoMixerCombiner1 get nomLimit inGroup:1

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Input Group | inputGroup | get / set / increment / decrement | channel | 0 - channel count |
| Last Mic Hold Enabled | lastMicHoldEnable | get / set / toggle | inGroup: | false, true |
| Open Mic Limit | nomLimit | get / set / increment / decrement | inGroup: | 1 - 7 |
| Open Mic Limit Enabled | nomLimitEnable | get / set / toggle | inGroup: | false, true |
| Channel Count | numChannels | get | Â | 2 - 32 |

Â Â

Â Â


---


# Room Combiner Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mixers/Room_Combiner_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Room Combiner Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| RoomCombiner1 | get | wallState | 1 |

Â Â

#### Example

RoomCombiner1 get wallState 1 Â 

RoomCombiner1 set wallState 1 true

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Room Group | group | get / set / increment / decrement / subscribe / unsubscribe | room | 0 - room count |
| Last Mic Hold Enabled | lastMicHoldEnable | get / set / toggle | Â | false, true |
| Input Level | levelIn | get / set / increment / decrement / subscribe / unsubscribe | room | levelInMin - levelInMax dB |
| Max Input Level | levelInMax | get / set / increment / decrement | room | levelInMin - 12.0 dB |
| Min Input Level | levelInMin | get / set / increment / decrement | room | -100.0 - levelInMax dB |
| Output Level | levelOut | get / set / increment / decrement / subscribe / unsubscribe | room | levelOutMin - levelOutMax dB |
| Max Output Level | levelOutMax | get / set / increment / decrement | room | levelOutMin - 12.0 dB |
| Min Output Level | levelOutMin | get / set / increment / decrement | room | -100.0 - levelOutMax dB |
| Source Level | levelSource | get / set / increment / decrement / subscribe / unsubscribe | room | levelSourceMin - levelSourceMax dB |
| Max Source Level | levelSourceMax | get / set / increment / decrement | room | levelSourceMin - 12.0 dB |
| Min Source Level | levelSourceMin | get / set / increment / decrement | room | -100.0 - levelSourceMax dB |
| Input Mute | muteIn | get / set / toggle / subscribe / unsubscribe | room | false, true |
| Output Mute | muteOut | get / set / toggle / subscribe / unsubscribe | room | false, true |
| Source Mute | muteSource | get / set / toggle / subscribe / unsubscribe | room | false, true |
| Open Mic Limit | nomLimit | get / set / increment / decrement | Â | 1 - 7 |
| Open Mic Limit Enabled | nomLimitEnable | get / set / toggle | Â | false, true |
| Input Count | numInputs | get | Â | 2 - 32 |
| Output Count | numOutputs | get | Â | 2 - 32 |
| Wall Room Precedence | preferredRoom | get / set / increment / decrement / subscribe / unsubscribe | Wall Number | A room index |
| Room Label | roomLabel | get / set | room | Â |
| Source Label | sourceLabel | get / set | source | Â |
| Source Selection | sourceSelection | get / set / increment / decrement / subscribe / unsubscribe | room | 0 - 4 |
| Wall Closed | wallState | get / set / toggle / subscribe / unsubscribe | wall number | false, true |

Â Â

Â Â


---


# Attribute Tables - Equalizers


# Parametric Equalizer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Equalizers/Parametric_Equalizer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Parametric Equalizer Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| ParametricEQ1 | get | numbands |

Â Â

#### Example

ParametricEQ1 get numbands Â 

ParametricEQ1 set gain 1 5.0 Â 

ParametricEQ1 set bandwidth 1 0.5Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bandwidth | bandwidth | get / set / increment / decrement | band | 0.01 - 4.0 oct |
| Bypass | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| Center Frequency | frequency | get / set / increment / decrement | band | 20.0 - 20000.0 Hz |
| Frequency & Gain | frequencyGain | get / set | band | [Frequency, gain] Frequency in Hz |
| Band Gain | gain | get / set / increment / decrement | band | minGain - maxGain dB |
| Band Max Gain | maxGain | get / set / increment / decrement | band | 0.0 - 15.0 dB |
| Band Min Gain | minGain | get / set / increment / decrement | band | -30.0 - 0.0 dB |
| Band Count | numBands | get | Â | 1 - 16 |
| Number of Channels | numChannels | get | Â | 1 - 32 |

Â Â

Â Â


---


# Graphic Equalizer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Equalizers/Graphic_Equalizer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Graphic Equalizer Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| GraphicEQ1 | get | gain | 25 |

Â Â

#### Example

GraphicEQ1 get numbands Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bypass Band | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| Band Gain | gain | get / set / increment / decrement | band | minGain - maxGain dB |
| Band Max Gain | maxGain | get / set / increment / decrement | band | 0.0 - 15.0 dB |
| Band Min Gain | minGain | get / set / increment / decrement | band | -30.0 - 0.0 dB |
| Band Count | numBands | get | Â | 10, 15, or 31 |
| Number of Channels | numChannels | get | Â | 1 - 32 |

Â Â

| Band Number | Frequency 1/3 Octave (Hz) | Frequency 2/3 Octave (Hz) | Frequency 1 Octave (Hz) |
| --- | --- | --- | --- |
| 1 | 20 | 25 | 31.5 |
| 2 | 25 | 40 | 63 |
| 3 | 31.5 | 63 | 125 |
| 4 | 40 | 100 | 250 |
| 5 | 50 | 160 | 500 |
| 6 | 63 | 250 | 1000 |
| 7 | 80 | 400 | 2000 |
| 8 | 100 | 630 | 4000 |
| 9 | 125 | 1000 | 8000 |
| 10 | 160 | 1600 | 16000 |
| 11 | 200 | 2500 | Â |
| 12 | 250 | 4000 | Â |
| 13 | 315 | 6300 | Â |
| 14 | 400 | 10000 | Â |
| 15 | 500 | 16000 | Â |
| 16 | 630 | Â | Â |
| 17 | 800 | Â | Â |
| 18 | 1000 | Â | Â |
| 19 | 1250 | Â | Â |
| 20 | 1600 | Â | Â |
| 21 | 2000 | Â | Â |
| 22 | 2500 | Â | Â |
| 23 | 3150 | Â | Â |
| 24 | 4000 | Â | Â |
| 25 | 5000 | Â | Â |
| 26 | 6300 | Â | Â |
| 27 | 8000 | Â | Â |
| 28 | 10000 | Â | Â |
| 29 | 12500 | Â | Â |
| 30 | 16000 | Â | Â |
| 31 | 20000 | Â | Â |

Â Â

Â Â


---


# Feedback Suppressor Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Equalizers/Feedback_Suppressor_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Feedback Suppressor Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| FeedbackSuppressor1 | set | fixedAll | true |

Â Â

#### Example

FeedbackSuppressor1 get numbands Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bandwidth | bandwidth | get / set / increment / decrement | band | 0.01 - 4.0 oct |
| Bypass | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| All Bands Fixed | fixedAll | get / set / toggle | Â | false, true |
| Floating Band Max Depth | floatingBandMaxDepth | get / set / increment / decrement | Â | -20.0 - 0.0 |
| Floating Band Width | floatingBandWidth | get / set | Â | NARROWBAND, WIDEBAND |
| Center Frequency | frequency | get / set / increment / decrement | band | 20.0 - 20000.0 Hz |
| Frequency & Gain | frequencyGain | get / set | band | [Frequency, gain] Frequency in Hz |
| Band Gain | gain | get / set / increment / decrement | band | -30.0 - 0.0 dB |
| Band Fixed | isFixed | get / set / toggle | band | false, true |
| Band Count | numBands | get | Â | 1 - 16 |
| Channel Count | numChannels | get | Â | 1 - 1 |
| Reset Floating Bands | resetFloatingBands | set | Â | Value ignored |

Â Â

Â Â


---


# Frequency Shift

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Equalizers/Frequency_Shift.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Frequency Shift

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| FrequencyShift1 | set | numChannels | 1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bypass | bypass | get / set / toggle | channel | false, true |
| Frequency Shift | frequencyShift | get / set / increment / decrement | channel | 4.0 - 12.0 Hz |
| Channel Count | numChannels | get | Â | 1 - 32 |

Â Â

Â Â


---


# Attribute Tables - Filters


# Pass Filter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Filters/Pass_Filter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Pass Filter Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| PassFilter1 | set | frequency | 100 |

Â Â

#### Example

PassFilter1 set frequency 100 +OK

Â Â

#### Example -Â Filter Type and SlopeÂ Values

Values must be specified within square brackets -filter type must be specified before slope and both parameters MUST be included.

PassFilter1 set filterTypeSlope [LINKWITZ\_RILEY 24] +OK

Â Â

##### Example - Alternate Format

Since "type" and "slope" are clearly denoted within the {braces}, the [value] variables can be provided in either order.

PassFilter1 set filterTypeSlope {"type":LINKWITZ\_RILEY "slope":24} +OK

Â Â

| Attribute | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Bypass | bypass | get / set / toggle | false, true |
| Filter Type | filterType | get | BUTTERWORTH, LINKWITZ\_RILEY, BESSEL |
| Filter Type & Slope | filterTypeSlope | get / set | [Type, slope] or {"type":Type "slope":slope}Â  Type:Â BUTTERWORTH, Slope: 6, 12, 18, 24, 30, 36, 42, 48 Â Â  Type: LINKWITZ\_RILEY, Slope: 12, 24, 36, 48Â Â  Type: BESSEL, Slope: 6, 12, 18, 24, 30, 36, 42, 48 |
| Cutoff Frequency | frequency | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Max Slope | maxSlope | get | Always 48 dB/oct |
| Number of Channels | numChannels | get | 1 - 32 |
| Filter Slope | slope | get | Linkwitz/Riley: 12, 24, 36, 48  Butterworth: 6,12,18, 24, 30, 36, 42, 48  Bessel: 6, 12, 18, 24, 30, 36, 42, 48 Â |

Â Â

Â Â


---


# Shelf Filter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Filters/Shelf_Filter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Shelf Filter Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| ShelfFilter1 | get | frequency |

Â Â

#### Example

ShelfFilter1 get frequency +OK "value":6350.116211Â 

Â Â

| Attribute | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Bypass | bypass | get / set / toggle | false, true |
| Cutoff Frequency | frequency | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Gain | gain | get / set / increment / decrement | -30 - 15.0 dB |
| Number of Channels | numChannels | get | 1 - 32 |

Â Â

Â Â


---


# All Pass Filter Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Filters/All_Pass_Filter_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# All Pass Filter Blocks

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| AllPassFilter1 | get | frequency | 1 |

Â Â

#### Example

AllPassFilter1 get frequency Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bandwidth | bandwidth | get / set / increment / decrement | band | 0.01 - 4.0 oct |
| Bypass | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| Center Frequency | frequency | get / set / increment / decrement | band | 20.0 - 20000.0 Hz |
| Band Enabled | isUsed | get / set / toggle | band | false, true |
| Band Count | numBands | get | Â | 1 - 16 |
| Number of Channels | numChannels | get | Â | 1 - 32 |

Â Â

Â Â


---


# Uber Filter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Filters/Uber_Filter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Uber Filter Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| UberFilter1 | get | frequency | 1 |

Â Â

#### Example

UberFilter1 get frequency 1 Â 

UberFilter1 set frequency 1 4000Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Band Type | bandType | get | band | NONE, PARAMETRIC\_EQ, PASS, SHELF |
| Bandwidth | bandwidth | get / set / increment / decrement | band | 0.01 - 4.0 oct |
| Band Bypass | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| Band Frequency | frequency | get / set / increment / decrement | band | 20.0 - 20000.0 Hz |
| Frequency & Bandwidth | frequencyBandwidth | get / set | band | Â |
| Frequency & Gain | frequencyGain | get / set | band | [Frequency, gain] Must be a parametric or shelf Frequency = Â value in Hz |
| Frequency, Gain & Bandwidth | frequencyGainBandwidth | get / set | band | Â |
| Band Gain | gain | get / set / increment / decrement | band | for shelf bands -30.0 - 15.0 dB , for parametric bandsÂ -30 - 15.0 dB |
| Locked Band Type | locked | get | band | false, true |
| Max Slope | maxSlope | get | Â | Always 48 dB/oct |
| Band Count | numBands | get | Â | 1 - 16 |
| Number of Channels | numChannels | get | Â | 1 - 32 |
| Pass Filter Type | passFilterType | get | band | BUTTERWORTH, LINKWITZ\_RILEY, BESSEL |
| Pass Filter Type & Slope | passFilterTypeSlope | get / set | band | [Type, slope] or {"type":Type "slope":slope} Â  Type:BUTTERWORTH, Slope:6,12,18,24,30,36,42,48 Â Â  Type: LINKWITZ\_RILEY, Slope: 12, 24,36,48 Â Â  Type: BESSEL Slope:6,12,18,24,30,36,42,48 |
| Filter Slope | slope | get | band | Linkwitz/Riley: 12, 24,36,48 Butterworth: 6,12,18,24,30,36,42,48 Bessel: 6,12,18,24,30,36,42,48 |

Â Â

Â Â


---


# FIR Filter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Filters/FIR_Filter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# FIR Filter Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| FIRFilter3 | set | bypass | true |

Â Â

#### Example

FIRFilter3 get numFilterCoefs +OK "value":8

Â Â

| Attribute | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Bypass | bypass | get / set / toggle | false, true |
| Filter Coefficients | filterCoefs | get | Â |
| Number of Channels | numChannels | get | 1 - 32 |
| Number of Filter Coefficients | numFilterCoefs | get | 4 - 2048 |

Â Â

Â Â


---


# Attribute Tables - Crossovers


# Crossover Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Crossovers/Crossover_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Crossover Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Crossover1 | toggle | synchronize |

Band: Indexed by number from high to low, so in a four-way crossover high=1, mid high=2, low mid =3, and low=4.Â 

Filter: Indexed by number. 1 is the high cutoff frequency for each band while 2 is the low.Â 

Â Â

#### Example -Â Filter Type and SlopeÂ ValuesÂ

Values must be specified within square brackets -filter type must be specified before slope and both parameters MUST be included.Â 

Crossover1 set filterTypeSlope 1 1 [LINKWITZ\_RILEY 24] +OKÂ 

Â Â

##### Example - Alternate FormatÂ

Since "type" and "slope" are clearly denoted within the {braces}, the [value] variables can be provided in either order.Â 

Crossover1 set filterTypeSlope 1 1 {"type":LINKWITZ\_RILEY "slope":24} +OKÂ 

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Filter Type | filterType | get | band, filter | BUTTERWORTH, LINKWITZ\_RILEY, BESSEL, CHEBYCHEV, VARIABLE\_Q |
| Filter Type & Slope | filterTypeSlope | get / set | band, filter | Â |
| Cutoff Frequency | frequency | get / set / increment / decrement | band, filter | 20.0 - 20000.0 Hz |
| Input Level | inputLevel | get / set / increment / decrement | Â | inputMinLevel - inputMaxLevel dB |
| Max Input Level | inputMaxLevel | get / set / increment / decrement | Â | inputMinLevel - 12.0 dB |
| Min Input Level | inputMinLevel | get / set / increment / decrement | Â | -100.0 - inputMaxLevel dB |
| Input Mute | inputMute | get / set / toggle | Â | false, true |
| Max Slope | maxSlope | get | Â | Always 48 dB/oct |
| Band Count | numBands | get | Â | 2 - 4 |
| Band Filter Count | numFilters | get | band | 1 - 2 |
| Input Count | numInputs | get | Â | 1 - 1 |
| Output Count | numOutputs | get | Â | 1 - 4 |
| Output Invert | outputInvert | get / set / toggle | band | false, true |
| Output Level | outputLevel | get / set / increment / decrement | band | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | band | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | band | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle | band | false, true |
| Filter Slope | slope | get | band, filter | Linkwitz/Riley: 12 - 48 in inc. of 12; Others: 6 - 48 in inc. of 6; dB/oct |
| Synchronize Bands | synchronize | get / set / toggle | Â | false, true |

Â Â

Â Â


---


# Attribute Tables - Dynamics


# Leveler Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/Leveler_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Leveler Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Leveler1 | get | threshold |

Â Â

#### Example

Leveler1 get threshold Â 

Leveler1 set threshold -40

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| All Gain Reductions | allGainReduction | get / subscribe / unsubscribe | Â | -152.0 - 0.0 dB |
| Bypass | bypass | get / set / toggle | Â | false, true |
| Gain Reduction by channel | gainReduction | get / subscribe / unsubscribe | Channel | -152.0 - 0.0 dBÂ |
| Gain Reduction | gainReductionLevel | get / subscribe / unsubscribe | Â | -152.0 - 0.0 dBÂ (will only work on the first channel of a multi-channel block) |
| Label | label | get / set | Â | Â |
| Number of channels | numChannels | get | Â | 1 - 32 |
| Response Time | responseTime | get / set / increment /Â decrement | Â | 0.1 - 40000.0 ms |
| Threshold | threshold | get / set / increment /Â decrement | Â | -60.0 up to 24.0 dBu |

Â Â

Â Â


---


# Compressor Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/Compressor_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Compressor Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Compressor1 | get | numChannels |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| GR Levels | allGainReduction | get / subscribe / unsubscribe | Â | Â |
| Meter Labels | allMeterLabels | get | Â | Â |
| Attack Time | attackTime | get / set / increment / decrement | Â | 1.0 - 2000.0 ms |
| Bypass | bypass | get / set / toggle | Â | false, true |
| Gain Reduction | gainReduction | get / subscribe / unsubscribe | channel | 1 - 32 |
| Makeup Gain | makeupGain | get / set / increment / decrement | Â | 0.0 - 12.0 dB |
| Meter Label | meterLabel | get / set | channel | Â |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Release Time | releaseTime | get / set / increment / decrement | Â | 5.0 - 10000.0 ms |

Â Â

Â Â


---


# Peak Limiter

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/Peak_Limiter.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Peak Limiter

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| PeakLimiter1 | get | numChannels |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Active LED | activeLED | get / subscribe / unsubscribe | channel | false, true |
| All Active LEDs | allActiveLEDs | get / subscribe / unsubscribe | Â | Â |
| Bypass | bypass | get / set / toggle | Â | false, true |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Release Time | releaseTime | get / set / increment / decrement | Â | 1.0 - 10000.0 ms |
| Peak Threshold | threshold | get / set / increment / decrement | Â | -20.0 - 28.0 dB |

Â Â

Â Â


---


# Ducker Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/Ducker_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Ducker Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Ducker1 | get | attackTime |

Â Â

#### Example

Ducker1 get attackTime

Â Â

| Attribute | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Attack Time | attackTime | get / set / increment / decrement | 0.1 - 2000.0 ms |
| Bypass | bypass | get / set / toggle | false, true |
| Ducking Level | duckingLevel | get / set / increment / decrement | -100.0 - 0.0 dB |
| Input Level | inputLevel | get / set / increment / decrement | -100.0 - 12.0 dB |
| Input Mute | inputMute | get / set / toggle | false, true |
| Logic In Enabled | logicInEnable | get / set / toggle | false, true |
| Logic In Inverted | logicInInvert | get / set / toggle | false, true |
| Logic Out Enabled | logicOutEnable | get / set / toggle | false, true |
| Logic Out Inverted | logicOutInvert | get / set / toggle | false, true |
| Max Input Level | maxInputLevel | get / set / increment / decrement | minInputLevel - 12.0 dB |
| Min Input Level | minInputLevel | get / set / increment / decrement | -100.0 - maxInputLevel dB |
| Mix Sense Enabled | mixSense | get / set / toggle | false, true |
| Number of Channels | numChannels | get | 1 - 32 |
| Release Time | releaseTime | get / set / increment / decrement | 0.1 - 40000.0 ms |
| Sense Level | senseLevel | get / set / increment / decrement | -100.0 - 12.0 dB |
| Sense Mute | senseMute | get / set / toggle | false, true |
| Threshold | threshold | get / set / increment / decrement | -60.0 - 24.0 dBu |

Â Â

Â Â


---


# AI Noise Reduction Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/AI_Noise_Reduction_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AI Noise Reduction Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| AINoiseReduction1 | get | numChannels |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bypass | bypass | get / set / toggle | channel | false, true |
| Deverberation | deverbStrength | get / set | channel | DEVERB\_OFF,  DEVERB\_LOW,  DEVERB\_MED,  DEVERB\_HIGH |
| AI Noise Reduction | nrdMode | get / set | channel | ENRD\_OFF,  ENRD\_LOW,  ENRD\_MED,  ENRD\_HIGH |
| Channel Count | numChannels | get | Â | 1 - 1 |

Â Â

Â Â


---


# Noise Gate Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/Noise_Gate_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Noise Gate Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| NoiseGate1 | get | threshold |

Â Â

#### Example

NoiseGate1 get threshold Â 

NoiseGate1 set threshold -40

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| All Gain Reductions | allGainReduction | get / subscribe / unsubscribe | Â | -152.0 - 0.0 dBÂ |
| Attack Time | attackTime | get / set / increment /Â decrement | Â | 0.1 - 2000.0 ms |
| Bypass | bypass | get / set / toggle | Â | false, true |
| Gain Reduction by channel | gainReduction | get / subscribe / unsubscribe | channel | -152.0 - 0.0 dBÂ |
| Gain Reduction | gainReductionLevel | get / subscribe / unsubscribe | Â | -152.0 - 0.0 dBÂ (will only work on the first channel of a multi-channel block) |
| Label | label | get / set | Â | Â |
| Number of channels | numChannels | get | Â | 1 - 32 |
| Release Time | releaseTime | get / set / increment /Â decrement | Â | 0.1 - 40000.0 ms |
| Threshold | threshold | get / set / increment /Â decrement | Â | -60.0 - 24.0 dBu |

Â Â

Â Â


---


# AGC Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/AGC_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AGC Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| AGC1 | get | speech |

Â Â

#### Example

AGC1 get speech Â 

AGC1 set speech true

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| AGC Active | agcActive | get | Â | false, true |
| All channel meters | allChannelMeters | get / subscribe / unsubscribe | Â | Â |
| All voice detect | allVoiceDetect | get / subscribe / unsubscribe | Â | Â |
| Bypass | bypass | get / set / toggle | Â | false, true |
| Meter by channel | channelMeters | get / subscribe / unsubscribe | channel | Â |
| Gain Level | gainLevel | get | Â | -30.0 - 30.0 dB |
| Hold Time | holdTime | get / set / increment /Â decrement | Â | 0 - 350000 s |
| Input Level | inputLevel | get | Â | -100.0 - 36.0 dBu |
| Limiter On | limiter | get / set / toggle | Â | false, true |
| Limiter Active | limiterActive | get | Â | false, true |
| Max Attenuation | maxAtten | get / set / increment /Â decrement | Â | 0.0 - 30.0 dB |
| Max Gain | maxGain | get / set / increment /Â decrement | Â | 0.0 - 30.0 dB |
| Max Gain Adj. Rate | maxGainRate | get / set / increment /Â decrement | Â | 0.0 - 15.0 dB/s |
| All Meter States | meters | get / subscribe / unsubscribe | Â | (will only work on the first channel of a multi-channel block) |
| Min SNR | minSnr | get / set / increment /Â decrement | Â | 10.0 - 50.0 dB |
| Min Threshold | minThreshold | get / set / increment /Â decrement | Â | -30.0 - 20.0 dBu (Max Value equal to Target Level) |
| Noise Floor Level | noiseFloorLevel | get | Â | -100.0 - 36.0 dBu |
| Number of channels | numChannels | get | Â | 1 - 32 |
| Side Chain Level | sideChainLevel | get | Â | -100.0 - 36.0 dBu |
| SNR Level | snrLevel | get | Â | 0.0 - 136.0 dB |
| Speech On | speech | get / set / toggle | Â | false, true |
| Target Level | targetLevel | get / set / increment /Â decrement | Â | -20.0 - 20.0 dB |
| Voice detect per channel | voiceDetect | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â

Â Â


---


# Attribute Tables - Routers


# Router Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Routers/Router.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Router Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| Router1 | set | input | 1 | 1 |

Â Â

#### Example

Router1 get input 1 +OK "value":0 Â 

Router1 set input 1 1 +OK

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Selected Input | input | get / set / increment / decrement / subscribe / unsubscribe | output | Input index or 0 for no selected input |
| Input Label | inputLabel | get / set | input | Any alphanumeric string |
| Input Count | numInputs | get | Â | 1 - 256 |
| Output Count | numOutputs | get | Â | 1 - 256 |
| Output Label | outputLabel | get / set | output | Any alphanumeric string |

Â Â

Â Â


---


# Source Selector Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Routers/Source_Selector.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Source Selector Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| SourceSelector1 | set | sourceSelection | 1 |

Â Â

#### Example

SourceSelector1 set sourceSelection 1 +OK

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Label | label | get / set | source | Â |
| Input Count | numInputs | get | Â | 2 - 64 |
| Output Count | numOutputs | get | Â | 1 - 2 |
| Source Count | numSources | get | Â | 2 - 32 |
| Output Level | outputLevel | get / set / increment / decrement / subscribe / unsubscribe | Â | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | Â | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | Â | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Source Level | sourceLevel | get / set / increment / decrement / subscribe / unsubscribe | source | sourceMinLevel - sourceMaxLevel dB |
| Max Source Level | sourceMaxLevel | get / set / increment / decrement | source | sourceMinLevel - 12.0 dB |
| Min Source Level | sourceMinLevel | get / set / increment / decrement | source | -100.0 - sourceMaxLevel dB |
| Source is Mono | sourceMono | get / set / toggle | source | false, true |
| Source Selection | sourceSelection | get / set / increment / decrement / subscribe / unsubscribe | Â | Source index or 0 for none |
| Stereo Enabled | stereoEnable | get | Â | false, true |

Â Â

Â Â


---


# AV Router Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Routers/AV_Router_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AV Router Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| AVRouter1 | set | input | 1 | 1 |

Â Â

#### Example

AVRouter1 get input 1 +OK "value":0 Â 

AVRouter1 set input 1 1 +OK

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Selected Input | input | get / set / increment / decrement | output | Input index or 0 for no selected input |
| Input Label | inputLabel | get / set | input | Any alphanumeric string |
| Input Count | numInputs | get | Â | 1 - 512 |
| Output Count | numOutputs | get | Â | 1 - 512 |
| Output Label | outputLabel | get / set | output | Any alphanumeric string |

Â Â

Â Â


---


# Attribute Tables - Delay


# Audio Delay Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Delay/Delay_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Audio Delay Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Delay1 | get | unitsDelay |

Â Â

#### Example

Delay1 get unitsDelay +OK "value":{"units":MILLISECOND "delay":47.3}

Â Â

| Attribute | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Bypass | bypass | get / set / toggle | false, true |
| Delay Value | delay | get | 0 - maxDelay ms converted to selected units |
| Max Delay | maxDelay | get | 5, 10, 50, 100, 500, 1000, or 2000 ms |
| Number of Channels | numChannels | get | 1 - 32 |
| Delay Units | units | get | MILLISECOND, CENTIMETER, METER, INCH, FOOT |
| Delay Setting | unitsDelay | get / set | [unit delay] or {"units":units "delay":delay} |

Â Â

Â Â


---


# Attribute Tables - Control Blocks


# Level Control Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Level_Control_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Level Control Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Level1 | get | levels |

Â Â

#### Example

Level1 get numChannels +OK "value":4 Â  Level1 get levels +OK "value":[0.000000 0.000000 0.000000 0.000000] Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channels Ganged | ganged | get | Â | false, true |
| Label | label | get / set | channel | Â |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Ramp Interval | rampInterval | get / set / increment / decrement | channel | 250.0 - 30000.0 ms in 250.0 ms increments |
| Ramp Step | rampStep | get / set / increment / decrement | channel | 1.0 - 15.0 dB |
| Use Ramping | useRamping | get | Â | false, true |

Â Â

Â Â

Â Â


---


# Invert Control Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Invert_Control_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Invert Control Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Invert1 | get | inverts |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channels Ganged | ganged | get | Â | false, true |
| Invert | invert | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Invert States | inverts | get / subscribe / unsubscribe | Â | Â |
| Label | label | get / set | channel | Â |
| Channel Count | numChannels | get | Â | 1 - 16 |

Â Â

Â Â

Â Â


---


# Mute Control Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Mute_Control_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Mute Control Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Mute1 | get | mutes |

Â Â

#### Example

Mute1 get numChannels +OK "value":3 Â 

Mute1 get mutes +OK "value":[false false false]

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channels Ganged | ganged | get | Â | false, true |
| Label | label | get / set | channel | Â |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 16 |

Â Â

Â Â


---


# Preset Control Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Preset_Button_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Preset Control Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| PresetButton1 | set | preset | 1 | 1001 |

Â Â

#### Example

PresetButton1 get preset 1 +OK "value":1001 Â 

PresetButton1 set preset 1 1001 +OK

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Count | numChannels | get | Â | 1 - 10 |
| Preset ID | preset | get / set / increment / decrement | channel | ID of any preset |

Â Â

Â Â

Â Â


---


# Command String Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Command_String_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Command String Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| CommandString1 | get | command | 1 |

Â Â

#### Example

Level1 get numChannels +OK "value":4Â 

Level1 get levels +OK "value":[0.000000 0.000000 0.000000 0.000000] Â 

Â Â

#### Example - Set Command ID and String

CommandString1 set labelCommand 1 {"label":"Hello" "command":"World"}

CommandString1 set labelCommand1 ["Hello" "World"]

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Autoconnect | autoConnect | get / set / toggle | Â | false, true |
| Command String | command | get / set | command | Â |
| Connection Log | connectionLog | get / subscribe / unsubscribe | Â | Â |
| Expect String | expect | get / set | expect | Â |
| Command ID | label | get / set | command | Â |
| Command ID & String | labelCommand | get / set | command | Set Supports the following format:Â {"label":"Hello" "command":"World"}Â ["Hello" "World"] |
| Network Config | networkConfig | get | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Response Rule | response | get / set | response | Â |
| Serial Config | serialConfig | get | Â | Â |
| Command Status | status | get / subscribe / unsubscribe | Â | Â |
| Command Destination Type | type | get | Â | SERIAL, NETWORK |

Â Â

Â Â

Â Â


---


# Dialer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Dialer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Dialer Block

The dialer block supports Service codes and Attribute codes and may be associated withÂ bothÂ the VoIP Control/Status blockÂ or the VoIP X Control/Status block. The Services Code defines an instruction and function for the dialer block to perform. The attribute Code defines the portion of the DSP block to be controlled such as a fader level.

Â Â

Â Â

## Dialer Service Codes

The Following table summarizes Dialer Service Codes. Due to the nature of the service being requested they do not require specific Attribute commands (get, set,Â etc)

* Dialer blocks associated with STC-2 cards will always use a Call appearance of 1.
* Dialer blocks associated with SVC-2 cards currently support up to six call appearances per line, three call appearances are able to be used in a conference call. (The main call is Call appearance 1)

Inserting pauses in aÂ DialÂ Service Code is supported by using commas between numbers. Each Comma insets a one second pause between numbers. Whenever pauses are used the number must be enclosed in "Double Quotes".Â 

Â Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service Code | Index | Index | Value |
| --- | --- | --- | --- | --- |
| Dialer1 | dial | 1 | 1 | 15036417287 |

Â Â

#### Example - No Pauses

Dialer1 dial 1 1 15036417287Â 

Â Â

#### Example - With Pauses

Dialer1 dial 1 1 "1,5036417287"Â 

Â Â

| Description | Service Code | Index 1 | Value |
| --- | --- | --- | --- |
| Speed Dial | speedDial | Line, Call Appearance | Speed Dialer Entry |
| Redial | redial | Line, Call Appearance | Â |
| End | end | Line, Call Appearance | Â |
| Flash | flash | Line, Call Appearance | Â |
| Send | send | Line, Call Appearance | Â |
| Dial (Used when On Hook Only) | dial | Line, Call Appearance | Number to Dial (A String) |
| DTMF (Used when Off Hook only) | dtmf | Line | One number between 0 - 9, \* or # |
| Answer | answer | Line, Call Appearance | Â |
| Conference (SVC Only) | lconf | Line, Call Appearance | Â |
| Resume (SVC Only) | resume | Line, Call Appearance | Â |
| Leave Conference (SVC Only) | leaveConf | Line, Call Appearance | Â |
| Specify call appearance (SVC Only) | callAppearance | Line, Call Appearance | Â |
| Hold (SVC Only) | hold | Line, Call Appearance | Â |
| Go Off Hook | offHook | Line, Call Appearance | Â |
| Go On Hook | onHook | Line, Call Appearance | Â |

Â Â

Â Â

## Dialer Attributes

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Dialer1 | get | lastNum | 1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Auto Answer | autoAnswer | get / set / toggle / subscribe / unsubscribe | line | false, true |
| Call State | callState | get / subscribe / unsubscribe | Â | Â |
| Display Name Label | displayNameLabel | get / set | Â | Â |
| Do Not Disturb Enabled | dndEnable | get / set / toggle / subscribe / unsubscribe | line | false, true |
| Last Number Dialed | lastNum | get / subscribe / unsubscribe | line | Â |
| Line Label | lineLabel | get / subscribe / unsubscribe | line | Â |
| Line Count | numChannels | get | Â | 1 - 2 |
| Speed Dial Label | speedDialLabel | get / set | line, speed dial entry | Â |
| Speed Dial Number | speedDialNum | get / set | line, speed dial entry | Â |

Â Â

Â Â


---


# DTMF Decode Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/DTMF_Decode_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# DTMF Decode Block

Â Â

Â Â

## DTMF Service Commands

Â Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service |
| --- | --- |
| DTMFDecode1 | clear |

Â Â

| Description | Service | Index | Value |
| --- | --- | --- | --- |
| Clear DTMF | clear | Â | Â |

Â Â

Â Â

## DTMF Attribute Commands

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| DTMFDecode1 | subscribe | dtmfs | MyCustomName | 500 |

Â Â

#### Example - Changes to the DTMF Decode block number 1 will be sent every 500ms

DTMFDecode1 subscribe dtmfs MyCustomName 500

Â Â

| Reason Code | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Decoded Data | dtmfs | get / subscribe / unsubscribe | Â |
| Logic Enabled | enableLogic | get / set / toggle | false, true |
| Channel Count | numChannels | get | 1 - 1 |

Â Â

Â Â

Â Â


---


# HD-1 Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/HD-1_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# HD-1 Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| HD-11 | get | softButtons | Â |

Â Â

| Attributes | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| The target of the HD-1 volume buttons | levelTarget | get / set | Â | Â |
| Feedback logic inputs | logicIn | get / subscribe / unsubscribe | Â | Â |
| Labels and other data for the soft buttons | softButtons | get / set | Â | Â |
| Speed Dial Entries | speedDialEntries | get / set / subscribe / unsubscribe | Â | Parallel sequences of names and numbers |

Â Â

Â Â

Â Â


---


# Parle Processing Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Parl%C3%A9_Processing.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# ParlÃ© Processing Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| ParleProcessing1 | get | mute | Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | Â | false, true |

Â Â

Â Â


---


# Attribute Tables - Meters


# Signal Present Meter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Meters/Signal_Present_Meter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Signal Present Meter Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Index | Value |
| --- | --- | --- | --- | --- | --- |
| SignalPrstMeter1 | subscribe | level | 1 | MyMeterName | 500 |

Â Â

#### Example

SignalPrstMeter1 subscribe level 1Â MyMeterNameÂ 500 Â  ! "publishToken":"MyMeterName" "value":-100.000000 +OK ! "publishToken":"MyMeterName" "value":-98.099998 ! "publishToken":"MyMeterName" "value":-77.800003

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Invert | invert | get / set / toggle | channel | false, true |
| Label | label | get / set | channel | Â |
| Signal Level | level | get / subscribe / unsubscribe | channel | -100.0 - 36.0 dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Logic State | logicState | get | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 16 |
| Off Delay | offDelay | get / set / increment / decrement | channel | 0 - 60000 ms |
| On Delay | onDelay | get / set / increment / decrement | channel | 0 - 60000 ms |
| Signal Present | present | get / subscribe / unsubscribe | channel | false, true |
| All Signal Indicators | presents | get / subscribe / unsubscribe | Â | Â |
| Threshold | threshold | get / set / increment / decrement | channel | -64.0 - 30.0 dBu |

Â Â

Â Â


---


# Audio Meter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Meters/Peak_or_RMS_Meter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Audio Meter Block

The following attributes apply toÂ Peak or RMS Meter blocks.Â Â

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Index | Value |
| --- | --- | --- | --- | --- | --- |
| AudioMeter2 | subscribe | level | 3 | myspecialmeter | 5000 |

Â Â

#### Example-Â To subscribe and unsubscribe to a meter

AudioMeter2 subscribe level 3 myspecialmeter 5000 Â  ! "publishToken":"myspecialmeter" "value":-100.000000 +OK Â  ! "publishToken":"myspecialmeter" "value":-70.000000 ! "publishToken":"myspecialmeter" "value":-40.000000 Â  AudioMeter2 unsubscribe level 3 myspecialmeter +OKÂ 

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Hold Enabled | holdEnabled | get / set / toggle | channel | false, true |
| Hold Time | holdTime | get / set / increment / decrement | channel | 0.0 - 10000.0 ms |
| Hold Indefinitely | indefiniteHold | get / set / toggle | channel | false, true |
| Label | label | get / set | channel | Â |
| Level | level | get / subscribe / unsubscribe | channel | -100.0 - 36.0 dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Type | type | get / set | Â | PEAK, RMS |

Â Â

Â Â


---


# Attribute Tables - Generators


# Tone Generator Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Generators/Tone_Generator_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Tone Generator Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| ToneGenerator1 | set | sweepEnable | true |

Â Â

#### Example

ToneGenerator1 set mute false +OK Â 

Â Â

| Reason Code | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Frequency | frequency | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Frequency Increment | frequencyInterval | get / set | OCTAVE\_1, OCTAVE\_2\_3, OCTAVE\_1\_3, OCTAVE\_1\_6, OCTAVE\_1\_12, OCTAVE\_1\_24, OCTAVE\_1\_48, OCTAVE\_1\_96 |
| Level | level | get / set / increment / decrement | minLevel - maxLevel dBu |
| Max Level | maxLevel | get / set / increment / decrement | minLevel - 36.0 dBu |
| Min Level | minLevel | get / set / increment / decrement | -100.0 - maxLevel dBu |
| Mute | mute | get / set / toggle | false, true |
| Channel Count | numChannels | get | 1 - 1 |
| Sweep Enabled | sweepEnable | get / set / toggle | false, true |
| Sweep Start Frequency | sweepFrequencyStart | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Sweep Stop Frequency | sweepFrequencyStop | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Sweep Increment Time | timeInterval | get / set / increment / decrement | 10 - 60000 ms |

Â Â

Â Â


---


# Noise Generator Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Generators/Noise_Generator_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Noise Generator Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| NoiseGenerator1 | set | mute | true |

Â Â

#### Example

NoiseGenerator1 set mute false +OK Â 

NoiseGenerator1 set level -100 Â 

Â Â

| Reason Code | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Level | level | get / set / increment / decrement | minLevel - maxLevel dBu |
| Max Level | maxLevel | get / set / increment / decrement | minLevel - 36.0 dBu |
| Min Level | minLevel | get / set / increment / decrement | -100.0 - maxLevel dBu |
| Mute | mute | get / set / toggle | false, true |
| Channel Count | numChannels | get | 1 - 1 |
| Noise Type | type | get / set | WHITE, PINK |

Â Â

Â Â


---


# Attribute Tables - Logic Blocks


# Logic Gate Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_Gate_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic Gate Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| Logic1 | get | numInputs | Â | Â |

Â Â

#### Example

Logic1 get numInputs +OK "value":1Â 

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Input Count | numInputs | get | Â | 1 - 32 |
| Output Count | numOutputs | get | Â | 1 - 32 |

Â Â

Â Â


---


# Logic State Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_State_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic State Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| LogicState1 | set | state | 1 | true |

Â Â

#### Example

LogicState1 set state 1 true +OK

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Label | label | get / set | channel | name |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Set | state | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Get All States | states | get / subscribe / unsubscribe | Â | Â |

Â Â

Â  Â


---


# Logic Pulse Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_Pulse_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic Pulse Block

Â  Â

Â Â

## Service Codes

Â Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Service Description | Service Code | Index | Value |
| --- | --- | --- | --- |
| Logic Pulse | startPulse | channel | Â |
| Logic Pulse | stopPulse | channel | Â |

Â Â

#### Example

LogicPulse1 startPulse 3 +OK

Â Â

Â Â

## Status Attributes

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| LogicPulse4 | set | durationOn | 2 | 1500 |

Â Â

#### Example

LogicPulse4 get durationOn 2 +OK "value":1500

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Pulse is active? | active | get | channel | false, true |
| Off Duration | durationOff | get / set / increment / decrement | channel | 1000 - 60000 ms |
| On Duration | durationOn | get / set / increment / decrement | channel | 1000 - 60000 ms |
| Indefinite | indefinite | get / set / toggle | channel | false, true |
| Label | label | get / set | channel | Â |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Pulse Count | pulseCount | get / set / increment / decrement | channel | 1 - 100 |

Â Â

### Pulse Output

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Count | numChannels | get | Â | 1 - 32 |

Â Â

Â Â


---


# Logic Sequence Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_Sequence_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic Sequence Block

Â Â

Â Â

## Service Codes

Â Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Service Description | Service Code | Index | Value |
| --- | --- | --- | --- |
| Logic Sequence | startSequence | Â | Â |
| Logic Sequence | stopSequence | Â | Â |

Â Â

#### Example

LogicSequence2 startSequence +OK

Â Â

Â Â

## Status Attributes

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| LogicSequence1 | set | durationOn | 2 | 1500 |

Â Â

#### Example

LogicSequence1 set durationOn 2 1500 +OK

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Sequence is active? | active | get / subscribe / unsubscribe | Â | false, true |
| Off Duration | durationOff | get / set / increment / decrement | channel | 500 - 60000 ms |
| On Duration | durationOn | get / set / increment / decrement | channel | 500 - 60000 ms |
| Indefinite | indefinite | get / set / toggle | Â | false, true |
| Label | label | get / set | channel | Â |
| Input Count | numInputs | get | Â | 1 - 1 |
| Output Count | numOutputs | get | Â | 1 - 32 |
| Sequence Count | sequenceCount | get / set / increment / decrement | Â | 1 - 100 |

Â Â

Â Â


---


# Logic Selector Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_Selector_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic Selector Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| LogicSelector1 | set | state | 1 | true |

Â Â

#### Example

LogicSelector1 set state 1 true +OK

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Label | label | get / set | channel | name |
| Set | state | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Get All States | states | get / subscribe / unsubscribe | Â | Â |

Â

Â


---


# Flip Flop Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Flip_Flop_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Flip Flop Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| FlipFlop1 | set | state | 1 | true |

Â Â

#### Example

FlipFlop1 set state 1 true +OK

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Label | label | get / set | channel | Â |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Set | state | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Get All States | states | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â


---


# Logic Delay Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_Delay_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic Delay Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| LogicDelay1 | set | offDelayMs | 1 | 1000 |

Â Â

#### Example

LogicDelay1 set offDelayMs 1 1000 +OK

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bypass | bypass | get / set / toggle | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Off Delay | offDelayMs | get / set / increment / decrement | channel | 0 - 60000 ms |
| On Delay | onDelayMs | get / set / increment / decrement | channel | 0 - 60000 ms |

Â Â

Â Â


---


# Logic Meter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_Meter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic Meter Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| LogicMeter1 | get | states |

Â Â

#### Example

LogicMeter1 get states Â  LogicMeter1 subscribe state 1 mylogicstate 500

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Label | label | get / set | channel | Â |
| Channel Count | numChannels | get | Â | 1 - 128 |
| State | state | get / subscribe / unsubscribe | channel | false, true |
| All States | states | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â


---


# Logic Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic Input Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| LogicInput1 | get | numInputs |

Â Â

#### Example

LogicInput1 get numInputs

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Invert | invert | get / set / toggle | channel | false, true |
| Label | label | get / set | channel | Â |
| Input Count | numInputs | get | Â | 1 - 16 |

Â Â

Â Â


---


# Logic Output Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Logic_Output_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Logic Output Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| LogicOutput1 | get | numOutputs |

Â Â

#### Example

LogicOutput1 get numOutputs

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Invert | invert | get / set / toggle | channel | false, true |
| Label | label | get / set | channel | Â |
| Output Count | numOutputs | get | Â | 1 - 16 |
| Powered Outputs Enabled | power | get | Â | false, true |

Â Â

Â Â


---


# Control Voltage Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Logic_Blocks/Control_Voltage_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Control Voltage Block

Â Â

Please refer to theÂ TTP section of the [Tesira Software System Control Overview](../../Tesira_Software_System_Control_Overview.htm)Â pageÂ for more details on the controlling Tesira devices using the TTP protocol.Â

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

The TTP string to adjust a DSP object attribute is structured in the following order:Â

**Instance\_Tag Command Attribute [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| ControlVoltage1 | get | numchannels |

Â Â

#### Example

ControlVoltage1 get numChannels +OK "value":1

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Label | label | get / set | channel | Â |
| Channel Count | numChannels | get | Â | 1 - 4 |

Â Â

Â Â


---

