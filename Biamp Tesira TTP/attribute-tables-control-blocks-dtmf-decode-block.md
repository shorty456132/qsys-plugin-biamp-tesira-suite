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
