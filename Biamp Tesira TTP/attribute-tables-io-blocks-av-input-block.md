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
