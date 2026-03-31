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
