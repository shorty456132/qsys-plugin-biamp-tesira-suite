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
