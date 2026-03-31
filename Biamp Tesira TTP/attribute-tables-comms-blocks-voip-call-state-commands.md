# VoIP Call State Commands

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_Call_State_Commands.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP Call State Commands

Â Â

Â Â

## Using the TTP Call State Commands

The VoIP Control Status Block supports the use of Call State monitoring in order to poll information about the current call state of the telephone card.Â The response will include multiple information fields for all lines and call appearances of the card. Call State is also available as a subscribed service to allow unsolicited feedback to a connected control system via TTP. A full call state subscription update will be sent if any single part of the call state has changed.Â 

Â Â

### VoIP Definitions

* Line:Â A single extension on the SVC-2 card. Â A line will have a dedicated phone number and the voice signals for this line are available as an independent input and output in the Tesira system. Each SVC-2 card supports two lines and these lines may be used at the same time.Â
* Call Appearance:Â Each line supports up to 6 call appearances. A call appearance can be viewed as a voice connection point on a line. A call appearance can be used to open another call from the same line by placing an active call on hold. Call appearances also allow the SVC-2 card to support call waiting.Â
* Conference: The SVC card can create a local conference by joining two call appearances into a single active call. There is no support for a conference larger than a 3-way conference (two call appearances). It is possible to have an active 3-way conference on both lines of the SVC card at the same time.Â

Â Â

### VoIP X Definitions

* Line: A line will have a dedicated phone number and the voice signals for this line are available as an independent input and output in the Tesira system. Each VoIP X Â supports one line.Â
* Call Appearance:Â Each line supports up to 2 call appearances. A call appearance can be viewed as a voice connection point on a line. A call appearance can be used to open another call from the same line by placing an active call on hold. Call appearances also allow the VoIP X to support call waiting.Â
* Conference: The VoIP X can create a local conference by joining two call appearances into a single active call.Â

Â Â

Â Â

## Call State Requests

This command will give a onetime indication of the current state of the VoIP phone. TheÂ Instance TagÂ is variable and needs to match what is running in the current configuration.Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| VoIPControlStatus1 | get | callState |

Â Â

Note:Â The following details and examples are specific to the SVC-2 VoIP implementation. VoIP X implementation will be limited according to its line and call appearance capability.Â 

Â Â

Â Â

## Subscriptions

### Subscribe to a Call State

This command will set a subscription to a VoIP cardâs current state. Please review theÂ subscriptionsÂ section for more details. If any portion of the cardâs call state changes, a subscription response will be provided indicating the current status of all call states.

The response of the subscription depends on theÂ SESSION verboseÂ State that was active at the time the subscription was setup. Examples will be given to show the response of a call state in both verbose and non-verbose formats.

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| VoIPControlStatus1 | subscribe | callState | [CustomLabel] | [Time(ms)] |

* IndexÂ can be used to assign a custom label to the subscription. This label is not required but is recommended, especially if there is more than one SVC-2 card in the system. The label would indicate to the control system which card is providing the state change. Instance Tags are not included in call state subscriptions responses.
* ValueÂ can be used to throttle the rate of response to the control system. Since a call state subscription update is only provided after a state change there should be no need to place a value in this field. Placing a value, especially if it is too high, could introduce a missed update effectively getting the SVC card and the control system out of sync. By default the call state subscription has a 200ms delay, this ensures that the as many changed states as possible are included in a single call state response. Â
* Subscriptions are lost when the Tesira server is rebooted.
* Subscriptions can be re-validated by subscribing to the same block at regular intervals. If this is done ensure that the custom label used inÂ IndexÂ is used in the re-subscription. If this label is not included it is possible to inadvertently open multiple subscriptions to the same call state. Â

Â Â

### Unsubscribing from a Call State

This command will cancel a previously set subscription.Â 

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| VoIPControlStatus1 | unsubscribe | callState | [CustomLabel] |

Â Â

### Call State Indication Fields

A Call State response will provide information for the entire SVC-2 card. The response will include both VoIP lines with 6 call appearances per line. Â 

#### Example - Note Line Feeds are Shown to Aid Readability

! "publishToken":" Room1" "value":{"callStateInfo":[ {"state":VOIP\_CALL\_STATE\_RINGBACK "lineId":0 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"\"07131038\"\"146\"\"\"" "prompt":VOIP\_PROMPT\_CONNECTING} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":1 "action": UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":2 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":3 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":4 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":5 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":1 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":2 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":3 "action":UI\_CLEAR\_STATUS"cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":4 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":5 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED}]}

Â Â

### Call Appearance - Information Included in Call State Response

Each call appearance provides the following information fields in the Call State response. Â

#### State

* The State response gives the current operating conditions of the call appearance on the VoIP line. Â
* The verbose indicator for the State field is: âstateâ
* Non-Verbose indicator responses will be numeric and are shown below.Â Â Â  Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| VOIP\_CALL\_STATE\_INIT | 1 | The call appearance is initializing indicating general setup is in place; DHCP in progress, registration is taking place, etc. This can also indicate that the line has not been configured. The SVC-2 card will not be able to dial when this state is displayed. |
| VOIP\_CALL\_STATE\_FAULT | 2 | General Fault condition; Network link is down, IP address conflict in place. The SVC-2 card will not be able to dial when this state is displayed. |
| VOIP\_CALL\_STATE\_IDLE | 3 | Call Appearance is part of a registered connection to a Proxy Server and is ready to make or receive a call. Â |
| VOIP\_CALL\_STATE\_DIALTONE | 4 | Call appearance is off hook and dial tone is present. |
| VOIP\_CALL\_STATE\_SILENT | 5 | User has started dialing numbers but has yet to hit send |
| VOIP\_CALL\_STATE\_DIALING | 6 | User has hit send on the call appearance and the card has sent an INVITE to the proxy or the called party. No response has been received at this point. Â |
| VOIP\_CALL\_STATE\_RINGBACK | 7 | The far end is ringing |
| VOIP\_CALL\_STATE\_RINGING | 8 | The call appearance has an incoming call |
| VOIP\_CALL\_STATE\_ANSWER\_CALL | 9 | The call has been answered but the call isn't active yet |
| VOIP\_CALL\_STATE\_BUSY | 10 | The far end is busy |
| VOIP\_CALL\_STATE\_REJECT | 11 | User has rejected the incoming call |
| VOIP\_CALL\_STATE\_INVALID\_NUMBER | 12 | The user has dialed an invalid number on this call appearance |
| VOIP\_CALL\_STATE\_ACTIVE | 13 | A call has been connected to the call appearance |
| VOIP\_CALL\_STATE\_ACTIVE\_MUTED | 14 | A call is established but audio is muted in the VoIP Receive block |
| VOIP\_CALL\_STATE\_ON\_HOLD | 15 | The near end has placed the call appearance on hold |
| VOIP\_CALL\_STATE\_WAITING\_RING | 16 | The call appearance has received a call waiting indication |
| VOIP\_CALL\_STATE\_CONF\_ACTIVE | 17 | The call appearance has been placed in a local conference |
| VOIP\_CALL\_STATE\_CONF\_HOLD | 18 | The call appearance is part of a local conference that has been placed on hold |
| VOIP\_CALL\_STATE\_XFER\_INIT | 19 | The call appearance is initializing |
| VOIP\_CALL\_STATE\_XFER\_SILENT | 20 | The call appearance is silent |
| VOIP\_CALL\_STATE\_XFER\_REQ\_DIALING | 21 | The call appearance is awaiting number to be dialed |
| VOIP\_CALL\_STATE\_XFER\_PROCESS | 22 | The call appearance is in a process of transferring |
| VOIP\_CALL\_STATE\_XFER\_REPLACES\_PROCESS | 23 | The call appearance is updating the transfer process |
| VOIP\_CALL\_STATE\_XFER\_ACTIVE | 24 | The call appearance transfer is active |
| VOIP\_CALL\_STATE\_XFER\_RINGBACK | 25 | The call appearance is seeing DTMF tones from the proxy server |
| VOIP\_CALL\_STATE\_XFER\_ON\_HOLD | 26 | The call appearance is on hold |
| VOIP\_CALL\_STATE\_XFER\_DECISION | 27 | The call appearance is awaiting confirmation to transfer |
| VOIP\_CALL\_STATE\_XFER\_INIT\_ERROR | 28 | The call appearance has experienced an error initializing the transfer process |
| VOIP\_CALL\_STATE\_XFER\_WAIT | 29 | The call appearance is waiting |

Â Â

Note:Â The following details and examples are specific to the SVC-2 VoIP implementation. VoIP X implementation will be limited according to its line and call appearance capability.

Â Â

### Line ID

* Each SVC-2 card supports two phone lines. A line is indicated as a unique extension on the VoIP system. The Line ID field indicates which line the particular Call State response is located on. Â
* The first line is indicated as Line ID 0 and the second line is Line ID 1.
* The verbose indicator for Line ID is: âlineIdâ. Note the upper case âIâ in this indicator. Â

Â Â

### Call ID

* Each line of the SVC-2 card supports six call appearances. A call appearance is defined as a separate phone connection point of a single phone extension. The Call ID field indicates which call appearance the particular Call State response is reporting. Â
* The first call appearance of a line is indicated as Call ID 0 and the last call appearance of a line is indicated as Call ID 5.
* The verbose indicator for Call ID is: âcallIdâ. Note the upper case âIâ in this indicator.

Â Â

### Action

* The Tesira user interface supports the shifting of focus of a call appearance selection. For example if a call is in place on call appearance 1 and call appearance 2 rings, the user can shift focus in the UI to call appearance 2 to check Caller ID. This action would shift the focus from appearance 1 to 2. Â
* The Call State response will indicate which call appearance is the point of focus for each line in the Action field. A control system program could track this action if multiple devices are providing VoIP dialer control. Â
* There can only be a single focused call appearance per line. Â
* The verbose indicator for Action is: âactionâÂ  Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| UI\_CLEAR\_STATUS | 1 | This call appearance is not the current point of focus in the user interface. |
| UI\_DISPLAY\_STATUS | 2 | This call appearance is the current point of focus in the user interface. |

Â Â

### Caller ID

If caller ID information is available it will be included in the Call State response.

#### Format

"\"MMDDHHmm\"\"incoming\_number\"\"caller\_Name\""

* If no caller ID is available the Call State response for this field will be ""
* The first set of quotes contains the date and time in the format MMDDHHmm.
* The second set of quotes represents the incoming phone number in the format 5036417287.
* The third set of quotes contains the name of the caller. If there are quotes contained within the name, there will be a backslash preceding the quotes within the name, i.e. âJohn \"Johnny\" Doe"
* A Backslash ( \ ) is used as a separator in the caller ID string

Â Â

#### Example - Caller ID Response with All Information Provided

"\"07131134\"\"15036260281\"\"Biamp Systems\""

Â Â

#### Example - Caller ID Response without All Information Provided

"\"07131134\"\"15036260281\"\"\""

Â Â

The verbose indicator for Caller ID is: âcidâ

Â Â

### Prompt

The Tesira user interface provides prompting indications of the state of the call appearance that is currently in focus. This prompting information is also included in the Call State response. A control system can use the prompt indications to provide users information about the individual call appearance states. Note that a prompt is provided for each call appearance in the Call State response. Â

The verbose indicator for Prompt is: "prompt"Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| VOIP\_PROMPT\_NONE | 1 | Nothing to display in prompt field |
| VOIP\_PROMPT\_STARTING | 2 | SVC-2 card is booting. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_REGISTERING | 3 | SVC-2 is registering to a Proxy Server. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED | 6 | SIP User field has not been configured on the line properties page. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_ENTER\_NUMBER | 7 | SVC-2 card is off hook and waiting for a number entry |
| VOIP\_PROMPT\_CONNECTING | 8 | Connecting to the number dialed |
| VOIP\_PROMPT\_INCOMING\_CALL\_FROM | 9 | Incoming call from a far end |
| VOIP\_PROMPT\_PEER\_BUSY | 10 | The far end device is busy |
| VOIP\_PROMPT\_CALL\_CANNOT\_BE\_COMPLETED | 11 | The number called from the SVC-2 card cannot be completed |
| VOIP\_PROMPT\_ON\_HOLD | 12 | The SVC-2 card has placed the call on hold |
| VOIP\_PROMPT\_CALL\_ON\_HELD | 13 | The far end device has placed the call on hold |
| VOIP\_PROMPT\_CONFERENCE | 14 | The SVC-2 card has placed this call appearances into a conference |
| VOIP\_PROMPT\_CONFERENCE\_ON\_HOLD | 15 | The SVC-2 card has placed a conference on hold |
| VOIP\_PROMPT\_CONNECTED | 16 | The call appearance is connected to a far end device |
| VOIP\_PROMPT\_CONNECTED\_MUTED | 17 | The call appearance is connected to a far end device but the VoIP Receive block has been muted |
| VOIP\_PROMPT\_AUTH\_FAILURE | 18 | Authentication to Proxy Server has failed |
| VOIP\_PROMPT\_PROXY\_NOT\_CONFIGURED | 19 | A Proxy Address has not been entered in the SVC line properties page |
| VOIP\_PROMPT\_NETWORK\_INIT | 20 | The SVC-2 card is setting up network communications. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_DHCP\_IN\_PROGRESS | 21 | The SVC-2 card is requesting an IP address via DHCP. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_NETWORK\_LINK\_DOWN | 22 | The SVC-2 network link sees no connection. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_NETWORK\_LINK\_UP | 23 | The SVC-2 network port sees a connection point but cannot make use of it due to its current IP settings. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_IPADDR\_CONFLICT | 24 | An IP Address is conflict has been detected. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_NETWORK\_CONFIGURED | 25 | The SVC network interface has been configured. The SVC-2 card will not be able to dial when this prompt is displayed. |
| VOIP\_PROMPT\_CODEC\_NEGOTIATION\_FAILURE | 26 | Codec negotiation between the endpoints has failed |
| VOIP\_PROMPT\_UNEXPECTED\_ERROR | 27 | The SVC card has encountered an unexpected error |
| VOIP\_PROMPT\_AUTH\_USER\_NOT\_CONFIGURED | 28 | Authentication Username has not been configured in the SVC line properties page |
| VOIP\_PROMPT\_AUTH\_PASSWORD\_NOT\_CONFIGURED | 29 | Authentication Password has not been configured in the SVC line properties page |
| VOIP\_PROMPT\_DND | 30 | Do Not Disturb |
| VOIP\_PROMPT\_INVALID\_NUMBER | 31 | Invalid Dialed Number (Number not routable by proxy server) |
| VOIP\_PROMPT\_TEMP\_UNAVAILABLE | 32 | Temporary Not Available (The caller is temporarily unavailable such as DND is on) |
| VOIP\_PROMPT\_DECLINED | 33 | Call is Declined (the call is declined by the far end or the server) |
| VOIP\_PROMPT\_SERVICE\_UNAVAILABLE | 34 | Service Unavailable (such as a PSTN call but PSTN gateway isnât configured or no rule to get there) |
| VOIP\_PROMPT\_FORBIDDEN | 35 | Call Forbidden (The call is prohibited because of policy) |
| VOIP\_PROMPT\_BEING\_XFER\_TO | 36 | Call is Being Transfer to |
| VOIP\_PROMPT\_XFER\_IN\_PROCESS | 37 | Transfer in Process |
| VOIP\_PROMPT\_XFER\_TIME\_OUT | 38 | Transfer Timeout (Transfer not finished in a designated time) |
| VOIP\_PROMPT\_PROXY\_UNAVAILABLE | 39 | Proxy Unavailable (such as the configurable proxy is down) |

Â Â

### Syntax of the Call State Response

Call State response information order:

The Call State response will present the information listed above for each line and call appearance of the VoIP instance. If a subscription to a Call State response is setup, the subscription will update if a change is detected in any of the information fields. Call State is available in both verbose and non-verbose responses. Below is an example of the order of information in a Call State response. Note that the â{â¦.}â field indicates the additional lines and call appearances on the VoIP instance. Â

HEADER\_TOKEN:[{STATE: LINE\_ID: CALL\_ID: ACTION: CALLER\_ID: PROMPT} {â¦.} {â¦.}]

Â Â

### Call State Subscription Header Examples

All subscription responses will start with the â!â character for easy recognition. The response will also include token information in the form of the custom label associated with the subscription. Custom labels are defined in the Index command when the subscription is setup. Below is an example or the subscription header of a Call State response in both verbose and non-verbose formats. In each case the custom label was defines as âRoom\_1â and the â{â¦}â symbol indicates the additional responses from the specific call appearances.Â

Â Â

Note:Â The following details and examples are specific to the SVC-2 VoIP implementation. VoIP X implementation will be limited according to its line and call appearance capability.Â

Â Â

#### Verbose Format

! "publishToken":" Room\_1" "value":{"callStateInfo":[{â¦.} {â¦.}]}Â 

Â Â

#### Non-Verbose Format

! "Room\_1" [[â¦.] [â¦.]]Â 

Â Â

### Single Call Appearance Response Examples

Below is an example of a response from a single call appearance in both verbose and non-verbose formats. This information is intended to show a clear example of the response order of a single appearance.Â

The call in each example shows the call state after a call was placed on line 0, call appearance 3, with the far end currently ringing. Caller ID information is also included.Â

Â Â

#### Verbose Format

{"state":VOIP\_CALL\_STATE\_RINGBACK "lineId":0 "callId":3 "action":UI\_DISPLAY\_STATUS "cid":"\"07131124\â\â146\â\âJohn Smith\ââ "prompt":VOIP\_PROMPT\_CONNECTING}

Â Â

#### Non-Verbose Format

[7 0 3 2 "\"07131124\â\â146\â\âJohn Smith\ââ 8]

Â Â

### Call State Full Command Examples

An actual Call State response will include two separate lines, each with 6 call appearances. An example of a full response is provided below in both verbose and non-verbose formats. The following responses show a ring-back on line 0, call appearance 0. All other call appearances on line 0 are idle. Line 1 has not been configured. Â 

Â Â

#### Verbose Format

! "publishToken":" Room 1" "value":{"callStateInfo":[{"state":VOIP\_CALL\_STATE\_RINGBACK "lineId":0 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"\"07131038\"\"146\"\"\"" "prompt":VOIP\_PROMPT\_CONNECTING} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":1 "action": UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":2 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":3 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":4 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_IDLE "lineId":0 "callId":5 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_NONE} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":1 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":2 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":3 "action":UI\_CLEAR\_STATUS"cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":4 "action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED} {"state":VOIP\_CALL\_STATE\_INIT "lineId":1 "callId":5"action":UI\_CLEAR\_STATUS "cid":"" "prompt":VOIP\_PROMPT\_SIP\_USER\_NOT\_CONFIGURED}]}

Â Â

#### Non-Verbose Format

! "Room\_1" [[[7 0 0 2 "\"07131038\"\"146\"\"\"" 8] [3 0 1 1 ââ 1] [3 0 2 1 ââ 1] [3 0 3 1 "" 1] [3 0 4 1 "" 1] [3 0 5 1 "" 1] [1 1 0 2 "" 6] [1 1 1 1 ââ 6] [1 1 2 1 ââ 6] [1 1 3 1 "" 6] [1 1 4 1 "" 6] [1 1 5 1 "" 6]]]

Â Â

Â Â
