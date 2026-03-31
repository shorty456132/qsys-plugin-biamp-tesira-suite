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
