# Source Selector Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Routers/Source_Selector.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Source Selector Block

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

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| SourceSelector1 | set | sourceSelection | 1 |

Â Â

#### Example

SourceSelector1 set sourceSelection 1 +OK

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Label | label | get / set | source | Â |
| Input Count | numInputs | get | Â | 2 - 64 |
| Output Count | numOutputs | get | Â | 1 - 2 |
| Source Count | numSources | get | Â | 2 - 32 |
| Output Level | outputLevel | get / set / increment / decrement / subscribe / unsubscribe | Â | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | Â | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | Â | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Source Level | sourceLevel | get / set / increment / decrement / subscribe / unsubscribe | source | sourceMinLevel - sourceMaxLevel dB |
| Max Source Level | sourceMaxLevel | get / set / increment / decrement | source | sourceMinLevel - 12.0 dB |
| Min Source Level | sourceMinLevel | get / set / increment / decrement | source | -100.0 - sourceMaxLevel dB |
| Source is Mono | sourceMono | get / set / toggle | source | false, true |
| Source Selection | sourceSelection | get / set / increment / decrement / subscribe / unsubscribe | Â | Source index or 0 for none |
| Stereo Enabled | stereoEnable | get | Â | false, true |

Â Â

Â Â
