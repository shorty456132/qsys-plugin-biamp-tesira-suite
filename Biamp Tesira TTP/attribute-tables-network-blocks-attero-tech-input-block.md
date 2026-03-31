# Attero Tech Input Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Network_Blocks/Attero_Tech_Input_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Attero Tech Input Block

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
| WallPlateIn1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Name (in Dante terms, 'RX Channel Label') | channelName | get / set | channel | Case-insensitive, up to 31 characters except '=' '.' and '@' |
| Connected Dante Device Name | deviceName | get / subscribe / unsubscribe | channel | Â |
| All Connected Dante Device Names | deviceNames | get / subscribe / unsubscribe | Â | Â |
| Gain | gain | get / set / increment / decrement | channel | Float dB; Value snaps to nearest valid value depending on channel |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Locate Mode Enable | locateMode | get / set / toggle | Â | false, true |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 4 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Phantom Power | phantomPower | get / set / toggle | channel | false, true |
| Source Control | sourceControl | get / set | channel | RCA, HEADPHONE, MIXED |
| Wallplate Model | wallPlateModel | get | Â | ATND971, ATND8677, ANYTYPE, ATND8734, MXA910, MXA310, UNDX2IOP, UNDX4I, UND6IO |

Â Â

Â Â

Â Â

Â
