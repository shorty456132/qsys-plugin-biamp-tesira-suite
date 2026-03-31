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
