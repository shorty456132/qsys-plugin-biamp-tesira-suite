# TI Control Status Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/TI_Control_Status_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# TI Control Status Block

The TI Control/Status blocks allows TTP control of a number ofÂ TI Service CodesÂ that can be used for call based functions. It also enables a number ofÂ [STC Call State commands](TC_Call_State_Commands.htm)Â that allows monitoring and feedback to a control system as well as TI Control Status AttributesÂ for controlling general STC-2 functions.Â See below for details.

When aÂ STC-2Â card is used and a Dialer is added and associated with the respective Control/Status block there are also a number of dialer specific attributes. Please refer to theÂ [Dialer](../Control_Blocks/Dialer_Block.htm)Â section for more information.Â

Â Â

Â Â

## TI Service Codes

The Following table summarizes TI Service Codes. Due to the nature of the service being requested they do not require specific Attribute commands (get, set, etc). Adding aÂ Dialer Component objectÂ will allow many more calling functions. Please refer to theÂ Dialer BlockÂ section for more information.Â 

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

| Instance Tag | Service Code | Value |
| --- | --- | --- |
| TIControlStatus1 | dial | +15036417287 |

Â Â

| Description | Service Code | Value |
| --- | --- | --- |
| Answer | answer | Â |
| Dial (used when On Hook only) | dial | Number to Dial (A String) |
| DTMF (used when Off Hook only) | dtmf | One number between 0 - 9, \* or # |
| End | end | Â |
| Flash | flash | Â |
| Redial | redial | Â |
| Â | suspend | Â |
| Â | test | Â |
| Â | testResult | Â |

Â Â

Â Â

## TI Control Status Attributes

When aÂ STC-2Â card is used it also allows access to all the dialer functions. Please refer to theÂ [Dialer](../Control_Blocks/Dialer_Block.htm)Â section for more information.Â 

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

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| TIControlStatus1 | set | autoAnswer | true |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Auto Answer | autoAnswer | get / set / toggle | Â | false, true |
| Auto Answer Ring Count | autoAnswerRingCount | get / set | Â | AA\_ONE\_RING, AA\_TWO\_RINGS, AA\_THREE\_RINGS, AA\_FOUR\_RINGS, AA\_FIVE\_RINGS |
| Auto Disconnect Type | autoDisconnect | get / set | Â | AD\_NONE, AD\_LOOP\_DROP, AD\_CALL\_PROGRESS, AD\_LOOP\_DROP\_PLUS\_CALL\_PROGRESS |
| Busy Tone Detected | busyToneDetected | get / subscribe / unsubscribe | Â | false, true |
| Caller ID Enabled | callerIdEnable | get / set / toggle | Â | false, true |
| Call State | callState | get / subscribe / unsubscribe | Â | Â |
| Simple Caller ID | cid | get | Â | Â |
| Full Caller ID | cidUser | get | Â | Â |
| Dialing | dialing | get / subscribe / unsubscribe | Â | false, true |
| Dial Tone Detected | dialToneDetected | get / subscribe / unsubscribe | Â | false, true |
| Dial Tone Level | dialToneLevel | get / set / increment / decrement | Â | -70.0 - 12.0 dB |
| Line Fault | faultCondition | get / subscribe / unsubscribe | Â | LINE\_NO\_FAULT, LINE\_OVERCURRENT\_FAULT, LINE\_UNDERVOLTAGE\_FAULT, LINE\_UNDERCURRENT\_FAULT, LINE\_OVERVOLTAGE\_FAULT, LINE\_POLARITY\_REVERSAL\_FAULT |
| Flash | hookFlash | set | Â | Value ignored |
| Flash Duration | hookFlashDuration | get / set / increment / decrement | Â | 100 - 800 ms |
| Hook State | hookState | get / set / subscribe / unsubscribe | Â | OFFHOOK, ONHOOK |
| Last Number Dialed | lastNum | get / subscribe / unsubscribe | Â | Â |
| Line Fault | lineFault | get / subscribe / unsubscribe | Â | false, true |
| Line Intrusion | lineIntrusion | get / subscribe / unsubscribe | Â | false, true |
| Line In Use | lineInUse | get / subscribe / unsubscribe | Â | false, true |
| Line Ready | lineReady | get / subscribe / unsubscribe | Â | false, true |
| Line Voltage | lineVoltage | get / subscribe / unsubscribe | Â | Actual line voltage |
| DTMF Local Level | localDtmfToneLevel | get / set / increment / decrement | Â | -100.0 - 12.0 dB |
| Loop Current | loopCurrent | get / subscribe / unsubscribe | Â | Actual loop current |
| Channel Count | numChannels | get | Â | Always 1 |
| Ring Back Tone Detected | ringBackToneDetected | get / subscribe / unsubscribe | Â | false, true |
| Ringing | ringing | get / subscribe / unsubscribe | Â | false, true |
| Use Redial | useRedial | get / set / toggle | Â | false, true |
| Wait For Dial Tone | waitForDialTone | get / set / toggle | Â | false, true |

Â Â

Â Â
