# Dialer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Dialer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Dialer Block

The dialer block supports Service codes and Attribute codes and may be associated withÂ bothÂ the VoIP Control/Status blockÂ or the VoIP X Control/Status block. The Services Code defines an instruction and function for the dialer block to perform. The attribute Code defines the portion of the DSP block to be controlled such as a fader level.

Â Â

Â Â

## Dialer Service Codes

The Following table summarizes Dialer Service Codes. Due to the nature of the service being requested they do not require specific Attribute commands (get, set,Â etc)

* Dialer blocks associated with STC-2 cards will always use a Call appearance of 1.
* Dialer blocks associated with SVC-2 cards currently support up to six call appearances per line, three call appearances are able to be used in a conference call. (The main call is Call appearance 1)

Inserting pauses in aÂ DialÂ Service Code is supported by using commas between numbers. Each Comma insets a one second pause between numbers. Whenever pauses are used the number must be enclosed in "Double Quotes".Â 

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

| Instance Tag | Service Code | Index | Index | Value |
| --- | --- | --- | --- | --- |
| Dialer1 | dial | 1 | 1 | 15036417287 |

Â Â

#### Example - No Pauses

Dialer1 dial 1 1 15036417287Â 

Â Â

#### Example - With Pauses

Dialer1 dial 1 1 "1,5036417287"Â 

Â Â

| Description | Service Code | Index 1 | Value |
| --- | --- | --- | --- |
| Speed Dial | speedDial | Line, Call Appearance | Speed Dialer Entry |
| Redial | redial | Line, Call Appearance | Â |
| End | end | Line, Call Appearance | Â |
| Flash | flash | Line, Call Appearance | Â |
| Send | send | Line, Call Appearance | Â |
| Dial (Used when On Hook Only) | dial | Line, Call Appearance | Number to Dial (A String) |
| DTMF (Used when Off Hook only) | dtmf | Line | One number between 0 - 9, \* or # |
| Answer | answer | Line, Call Appearance | Â |
| Conference (SVC Only) | lconf | Line, Call Appearance | Â |
| Resume (SVC Only) | resume | Line, Call Appearance | Â |
| Leave Conference (SVC Only) | leaveConf | Line, Call Appearance | Â |
| Specify call appearance (SVC Only) | callAppearance | Line, Call Appearance | Â |
| Hold (SVC Only) | hold | Line, Call Appearance | Â |
| Go Off Hook | offHook | Line, Call Appearance | Â |
| Go On Hook | onHook | Line, Call Appearance | Â |

Â Â

Â Â

## Dialer Attributes

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
| Dialer1 | get | lastNum | 1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Auto Answer | autoAnswer | get / set / toggle / subscribe / unsubscribe | line | false, true |
| Call State | callState | get / subscribe / unsubscribe | Â | Â |
| Display Name Label | displayNameLabel | get / set | Â | Â |
| Do Not Disturb Enabled | dndEnable | get / set / toggle / subscribe / unsubscribe | line | false, true |
| Last Number Dialed | lastNum | get / subscribe / unsubscribe | line | Â |
| Line Label | lineLabel | get / subscribe / unsubscribe | line | Â |
| Line Count | numChannels | get | Â | 1 - 2 |
| Speed Dial Label | speedDialLabel | get / set | line, speed dial entry | Â |
| Speed Dial Number | speedDialNum | get / set | line, speed dial entry | Â |

Â Â

Â Â
