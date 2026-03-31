# VoIP Control Status Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_Control_Status_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP Control Status Block

The VoIP Control/Status blocks allows TTP control of a number ofÂ Dialer Service CodesÂ that can be used for call based functions. It also enables a number ofÂ VoIP Call State CommandsÂ that allows monitoring and feedback to a control system as well asÂ VoIP Control Status attributesÂ for controlling general VoIP functions. See below for details.

When aÂ SVC-2Â card is used and a Dialer is added and associated with the respective VoIP Control/Status block there are also a number of dialer specific attributes. Please refer to theÂ [Dialer](../Control_Blocks/Dialer_Block.htm)Â pageÂ for more information.Â

Â Â

Â Â

## Dialer Service Codes

The Tesira SERVER or SERVER I/OÂ SVC-2Â VoIP card orÂ TesiraFORTÃ VIÂ orÂ [TesiraFORTÃ VT](../../../Tabs/Audio_Objects/Forte/Forte_VT.htm)Â can support two independent phone lines. Each independent line can support up to 6 call appearances. Each call appearance can be a call to a different far end. However, there are limitations on active call appearances that apply to each line independently within an SVC-2 card.Â

* Two active call appearances:Â The maximum number of active call appearances (i.e. call appearances that are not on hold) per line is two. When two call appearances are active, no other call appearances can be used for any purpose (an active call or a call on hold).Â
* Less than two active call appearances:Â If there is only one active call appearance (or none), then all of the remaining call appearances can have calls on hold. In this case, the SVC-2 card will allow a call appearance to be put on hold and a different call appearance made active.Â

If you have 3 calls on hold you can choose any one of those to become an active call, but to conference in a second call appearance you need to disconnect the 3rd call before the conferencing can take place. Similarly, if 2 calls are in conference, any attempt to have a 3rd appearance dial in will result in a busy tone / redirect to voicemail / etc. since the system is already fully engaged. If a user tries to initiate a 3rd call appearance from the Tesira VoIP they will get an audible error tone / warble indicating they cannot complete the action.Â

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

| Instance Tag | Service | Index | Index | Value |
| --- | --- | --- | --- | --- |
| VoIPControlStatus1 | dial | 1 | 1 | 15036417287 |

Â Â

| Description | Service | Index | Value |
| --- | --- | --- | --- |
| Answer | answer | Line, Call Appearance | Â |
| Specify call appearance | callAppearance | Line, Call Appearance (0 - 5) | Â |
| Dial (used when On Hook only) | dial | Line, Call Appearance | Number to Dial (A String) |
| DTMF (used when Off Hook only) | dtmf | Line | One number between 0 - 9, \* or # |
| End | end | Line, Call Appearance | Â |
| Flash | flash | Line, Call Appearance | Â |
| Hold | hold | Line, Call Appearance | Â |
| Conference | lconf | Line, Call Appearance | Â |
| Leave Conference | leaveConf | Line, Call Appearance | Â |
| Go Off Hook | offHook | Line, Call Appearance | Â |
| Go On Hook | onHook | Line, Call Appearance | Â |
| Redial | redial | Line, Call Appearance | Â |
| Resume | resume | Line, Call Appearance | Â |
| Send | send | Line, Call Appearance | Â |
| Transfer | transfer | Line, Call Appearance | Refer to the [VoIP Transfer Commands](VoIP_VoIP_X_Transfer.htm) section |

Â Â

Â Â

## VoIP Call State Commands

The VoIP Control Status Block supports the use of Call State monitoring in order to poll information about the current call state of the telephone card. The response will include multiple information fields for all lines and call appearances of the card. Call State is also available as a subscribed service to allow unsolicited feedback to a connected control system via TTP. A full call state subscription update will be sent if any single part of the call state has changed.Â

Please refer to theÂ [VoIP Call State commands](VoIP_Call_State_Commands.htm)Â for more information.Â

Â Â

Â Â

## VoIP Control Status Attributes

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
| VoIPControlStatus1 | get | lineInUse | 1 | 1 |

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Auto Answer | autoAnswer | get / set / toggle | line | false, true |
| Auto Answer Ring Count | autoAnswerRingCount | get / set | line | AA\_IMMEDIATELY, AA\_ONE\_RING, AA\_TWO\_RINGS, AA\_THREE\_RINGS |
| Call State | callState | get / subscribe / unsubscribe | Â | Â |
| Statistics | cardStat | get / subscribe / unsubscribe | Â | Â |
| Simple Caller ID | cid | get / subscribe / unsubscribe | line, call appearance index | Â |
| Full Caller ID | cidUser | get / subscribe / unsubscribe | line, call appearance index | Â |
| Codec Priorities | codecPriority | get / set | line | Â |
| Call Progress Tone Level | cptLevel | get / set / increment / decrement | line | -100.0 - 0.0 dB |
| Dialing Timeout | dialingTimeOut | get / set / increment / decrement | line | 0 - 20 s |
| Direct URL Dialing Enabled | directUrlDialing | get / set / toggle | line | false, true |
| Do Not Disturb Enabled | dndEnable | get / set / toggle | line | false, true |
| Do Not Disturb Response Code | dndMode | get / set | line | DND\_480, DND\_486, DND\_603 |
| DTMF Off Time | dtmfOffTime | get / set / increment / decrement | line | 40 - 1000 ms |
| DTMF On Time | dtmfOnTime | get / set / increment / decrement | line | 40 - 1000 ms |
| DTMF via SIP Info | dtmfSipInfo | get / set | line | DTMF\_SIP\_INFO\_OFF, DTMF\_SIP\_INFO\_NORMAL, DTMF\_SIP\_INFO\_SIMPLE |
| Last Number Dialed | lastNum | get / subscribe / unsubscribe | line | Â |
| Line In Use | lineInUse | get / subscribe / unsubscribe | line, call appearance index | false, true |
| Line Ready | lineReady | get / subscribe / unsubscribe | line | false, true |
| DTMF Local Mute | localDtmfMute | get / set / toggle | line | false, true |
| DTMF Local Level | localDtmfToneLevel | get / set / increment / decrement | line | -100.0 - 0.0 dB |
| NAT Info | nat | get / subscribe / unsubscribe | Â | Â |
| Network Info | network | get / subscribe / unsubscribe | Â | Â |
| Line Count | numChannels | get | Â | Always 2 |
| Out-Of-Band DTMF Enabled | oobDtmf | get / set / toggle | line | false, true |
| Out-Of-Band DTMF Payload Type | oobDtmfPayload | get / set / increment / decrement | line | 97 - 127 |
| Protocol Info | protocols | get / subscribe / unsubscribe | Â | Â |
| Redial Enabled | redialEnable | get / set / toggle | line | false, true |
| RFC 2543-Style Hold Enabled | rfc2543StyleHold | get / set / toggle | line | false, true |
| Ringing | ringing | get / subscribe / unsubscribe | line, call appearance index | false, true |
| Ring Type | ringType | get / set | line | RING\_TYPE\_CLASSIC, RING\_TYPE\_SILENT |
| Synchronized Time | syncTime | set | Â | hh:mm:ss:MM:DD:YYYY |
| VAD Enabled | vad | get / set / toggle | line | false, true |
| VAD Threshold | vadThreshold | get / set / increment / decrement | line | -64.0 - 24.0 dB |

Â Â

### Synchronized Time

Synchronized time is formatted as follows:

* hh = Hours
* mm = minutes
* ss = Seconds. Leap seconds (SS=60) specification are forbidden.
* MM =month of year 1-12
* DD =day of month 1-(28,29,30,31) according to the month and year
* YYYY = Year must be >= 2000
* Spaces are not permitted after the : and before YYYY so â: 2000â is not valid.

Â Â

### Set Synchronized Time

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| VoIPControlStatus1 | set | syncTime | "00:00:00:02:29:2014" |

Â Â

#### Example

VoIPControlStatus1 set syncTime "00:00:00:02:29:2014"Â 

Â Â

Â Â

Â Â
