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
