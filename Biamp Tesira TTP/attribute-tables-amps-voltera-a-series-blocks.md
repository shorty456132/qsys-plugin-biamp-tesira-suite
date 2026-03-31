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
