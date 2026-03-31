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
