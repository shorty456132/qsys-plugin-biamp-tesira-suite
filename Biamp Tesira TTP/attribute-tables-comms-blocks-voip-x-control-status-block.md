# VoIP X Control Status Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_X_Control_Status_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP X Control Status Block

The VoIP X Control/Status blocks allows TTP control of a number ofÂ Dialer Service CodesÂ that can be used for call based functions. It also enables a number ofÂ VoIP X Call State CommandsÂ that allows monitoring and feedback to a control system as well asÂ VoIP X Control Status attributesÂ for controlling general VoIP X functions.Â See below for details.

When a Dialer is added and associated with the respective VoIP X Control/Status block there are also a number of dialer specific attributes. Please refer to theÂ [Dialer](../Control_Blocks/Dialer_Block.htm)Â section for more information.Â

If there are 2 calls on hold the user may choose any one of those to become an active call. If 2 calls are in conference, any attempt to have a 3rd call appearance dial in will result in a busy tone, redirect to voicemail etc. since the system is already fully engaged.Â

Each element of the Service Code instruction in delimited by a single space. The commands are case sensitive and upper and lower case characters are used. The TTP string is structured in the in the order below.Â

Â Â

Â Â

## Dialer Service Codes

TheÂ TesiraFORTÃÂ X can support a single phone line, with up to 2 call appearances. Each call appearance can be a call to a different far end. However, there are limitations on active call appearances. When a call is active, the other call appearance must be on hold, unless involved in a conference call.Â 

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

| Instance Tag | Service | Index | Index | Value |
| --- | --- | --- | --- | --- |
| VoIPXControlStatus1 | dial | 1 | 1 | 15036417287 |

Â Â

| Instance Tag | Service | Index | Value |
| --- | --- | --- | --- |
| Redial | redial | Line,Call Appearance | Â |
| End | end | Line,Call Appearance | Â |
| Send | send | Line,Call Appearance | Â |
| Dial | send | Line, Call Appearance | Â |
| DTMF (Used when Off Hook only) | dtmf | Line | One number between 0 - 9, \* or # |
| Answer | answer | Line,Call Appearance | Â |
| Conference | lconf | Line,Call Appearance | Â |
| Resume | resume | Line, Call Appearance | Â |
| Leave Conference | leaveConf | Line, Call Appearance | Â |
| Hold | hold | Line,Call Appearance | Â |
| Go Off Hook | offHook | Line,Call Appearance | Â |
| Go On Hook | onHook | Line,Call Appearance | Â |
| Transfer | transfer | Line,Call Appearance | Â Refer to theÂ VoIP Transfer CommandsÂ section |

Â Â

Â Â

## VoIP X Call State Commands

The VoIP X Control Status Block supports the use of Call State monitoring in order to poll information about the current call state of the telephone card. The response will include multiple information fields for all lines and call appearances of the card. Call State response includes several fields of information including Caller ID which may be useful. Call State is also available as a subscribed service to allow unsolicited feedback to a connected control system via TTP. A full call state subscription update will be sent if any single part of the call state has changed.Â

Please refer to the [VoIP/VoIP XÂ Call State Commands](VoIP_Call_State_Commands.htm)Â for more information.Â

Â Â

Â Â

## VoIP X Control & Status Attributes

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

| Instance Tag | Command | Attribute Code | Index | Index |
| --- | --- | --- | --- | --- |
| VoIPXControlStatus1 | get | lineInUse | 1 | 1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Auto Answer | autoAnswer | get / set / toggle | line (1) | false, true |
| Auto Answer Ring Count | autoAnswerRingCount | get / set | line (1) | AA\_IMMEDIATELY, AA\_ONE\_RING, AA\_TWO\_RINGS, AA\_THREE\_RINGS |
| Call State | callState | get / subscribe / unsubscribe | Â | Refer to theÂ VoIP Call State CommandsÂ section |
| Do Not Disturb Enabled | dndEnable | get / set / toggle | line (1) | false, true Â |
| Last Number Dialed | lastNum | get / subscribe / unsubscribe | line (1) | Â |
| Line In Use | lineInUse | get / subscribe / unsubscribe | line (1), call appearance index (1-2) | false, true |
| Line Ready | lineReady | get / subscribe / unsubscribe | line (1) | false, true |
| Ringing | ringing | get / subscribe / unsubscribe | line (1), call appearance index (1-2) | false, true |

Â Â

Â Â

Â Â
