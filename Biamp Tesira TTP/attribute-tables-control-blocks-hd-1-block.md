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
