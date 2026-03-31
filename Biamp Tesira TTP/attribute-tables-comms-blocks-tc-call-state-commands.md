# TC Call State Commands

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/TC_Call_State_Commands.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# TC Call State Commands

The analog Control Status Block supports the use of Call State monitoring in order to poll information about the current call state of the telephone card. The response will include multiple information fields for the line. Call State is also available as a subscribed service to allow unsolicited feedback to a connected control system via TTP. A full call state subscription update will be sent if any single part of the call state has changed. Â 

Â Â

Â Â

## Definitions

### Line

A single extension on the STC-2 card. A line will have a dedicated phone number and the voice signals for this line are available as an independent input and output in the Tesira system. Each STC-2 card supports two lines and these lines may be used at the same time. Â 

### Call Appearance

A call appearance can be viewed as a voice connection point on a line. Each line supports a single call appearance. The call appearance will always indicate a 0 in the Tesira STC card. Â Note that this does not mean that the card does not support call waiting or line conferencing, it simply means that this would be a function of the phone system.Â Â 

Â Â

### Call State Requests

Get the status of the Call State:Â 

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| TIControlStatus1 | get | callState |

This command will give a onetime indication of the current state of the analog phone.Â

The Instance Tag field is variable and needs to match what is running in the current configuration. Â

Â Â

Â Â

## Subscriptions

### Subscribe to a Call State

This command will set a subscription to a VoIP cardâs current state. Review [TTPÂ Subscriptions](../../Tesira_Text_Protocol/TTP_Subscriptions.htm)Â for additional details. If any portion of the cardâs call state changes, a subscription response will be provided indicating the current status of all call states.Â

The response of the subscription depends on theÂ [Session](../Service_Addresses/Session.htm) verboseÂ State that was active at the time the subscription was setup.Â 

| Instance Tag | Command | Attribute Code | Index | Value |
| --- | --- | --- | --- | --- |
| TIControlStatus1 | subscribe | callState | [CustomLabel] | [Time(ms)] |

IndexÂ can be used to assign a custom label to the subscription. This label is not required but is recommended, especially if there is more than one STC-2 card in the system.Â The label would indicate to the control system which card is providing the state change.Â Instance Tags are not included in call state subscriptions responses.Â

ValueÂ can be used to throttle the rate of response to the control system. Since a call state subscription update is only provided after a state change there should be no need to place a value in this field. Placing a value, especially if it is too high, could introduce a missed update effectively getting the STC card and the control system out of sync. By default the call state subscription has a 200ms delay, this ensures that the as many changed states as possible are included in a single call state response. Â

Subscriptions are lost when the Tesira server is rebooted.Â Subscriptions can be re-validated by subscribing to the same block at regular intervals. If this is done ensure that the custom label used inÂ IndexÂ is used in the re-subscription. If this label is not included it is possible to inadvertently open multiple subscriptions to the same call state.Â

Â Â

### Unsubscribing from a Call State

Use this command will cancel a previously set subscription.Â 

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| TIControlStatus1 | unsubscribe | callState | [CustomLabel] |

Â Â

Â Â

## Call State Indication Fields

A Call State response will provide information for the requested STC-2 card line. Â Every Call State response will include the following information fields. Â

### State

The State response gives the current operating conditions of the call on the analog line.Â  Â

* The verbose indicator for the State field is: âstateâÂ
* Non-Verbose indicator responses will be numeric and are shown below.Â Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| TI\_CALL\_STATE\_IDLE | 1 | The analog line is on hook and ready to make a call |
| TI\_CALL\_STATE\_DIALING | 2 | A number has been entered in the STC card and it is currently dialing |
| TI\_CALL\_STATE\_RINGBACK | 3 | The far end is ringing |
| TI\_CALL\_STATE\_BUSY\_TONE | 4 | The far end has presented a busy indication |
| TI\_CALL\_STATE\_ERROR\_TONE | 5 | The STC card has received an error tone on the line |
| TI\_CALL\_STATE\_CONNECTED | 6 | The call to the far end has been connected |
| TI\_CALL\_STATE\_RINGING | 7 | A STC card has detected an incoming call |
| TI\_CALL\_STATE\_DROPPED | 8 | The far end has hung up the call |
| TI\_CALL\_STATE\_INIT | 12 | The card is booting |
| TI\_CALL\_STATE\_FAULT | 13 | A fault has been detected on the phone line (reference the prompt field for more information) |
| TI\_CALL\_STATE\_CONNECTED\_MUTED | 14 | A call has been connected but the SVC receive block mute has been engaged |

Â Â

### Line ID

Each STC-2 card supports two phone lines. A line is indicated as a unique extension on the analog system. The Line ID field indicates which line of the card the particular Call State response is located for. Â

* A Call State response is only valid for a single line; the line of the Control Status block that the request was sent to.Â
* The first line is indicated as Line ID 0 and the second line is Line ID 1.Â
* The verbose indicator for Line ID is: âlineIdâ (Note: the upper case âIâ in this indicator)Â

Â Â

### Call ID

Unlike the Tesira SVC-2 (VoIP) card, each line of the STC-2 card only supports a single call appearance. A call appearance is defined as a separate phone connection point of a single phone extension. The Call ID field indicates which call appearance the particular Call State response is reporting. This will vary in the SVC-2 card but the STC-2 card will always report 0. Although the information contained in this Call State response field may not be pertinent to the STC operation, it has been left in so the same control system parser can be used for both types of telephony cards. Â

The verbose indicator for Call ID is: âcallIdâ. (Note: the upper case âIâ in this indicator)Â

Â Â

### Action

The Action field of the Call State response is a function of the Tesira SVC-2 (VoIP) interface. Â Although the information contained in this Call State response field may not be pertinent to the STC operation, it has been left in so the same control system parser can be used for both types of telephony cards. Â

The information provided in this field for the STC card willÂ alwaysÂ be:Â

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| UI\_DISPLAY\_STATUS | 1 | Call State response |

The verbose indicator for Action is: âactionâÂ

Â Â

### Caller ID

If caller ID information is available it will be included in the Call State response.Â Â 

#### Format

"\"MMDDHHmm\"\"incoming\_number\"\"caller\_Name\""Â 

* If no caller ID is available the Call State response for this field will be ""Â
* The first set of quotes contains the date and time in the format MMDDHHmm.Â
* The second set of quotes represents the incoming phone number in the format 5036417287.Â
* The third set of quotes contains the name of the caller. If there are quotes contained within the name, there will be a backslash preceding the quotes within the name, i.e. âJohn \"Johnny\" Doe"Â
* A Backslash ( \ ) is used as a separator in the caller ID stringÂ
* The verbose indicator for Caller ID is: âcidâÂ

#### Example - Caller ID Response with all Information Provided

"\"07131134\"\"15036260281\"\"Biamp Systems\""Â 

#### Example - Caller ID Response without all Information Provided

"\"07131134\"\"15036260281\"\"\""Â 

Â Â

### Prompt

The function of the prompt field in the STC Call State response is to provide further information on fault states detected on the analog line. Â

The verbose indicator for Prompt is: âpromptâÂ

| Verbose | Non-Verbose | Description |
| --- | --- | --- |
| FAULT\_NONE | 1 | No line fault has been detected |
| FAULT\_OVERCURRENT | 2 | STC-2 card has detected excessive current on the phone line. \* |
| FAULT\_UNDERVOLTAGE | 3 | STC-2 card has detected a low voltage condition on the phone line. \* Â |
| FAULT\_UNDERCURRENT | 4 | Â STC-2 card has detected a low current condition on the phone line. \*Â |
| FAULT\_OVERVOLTAGE | 5 | STC-2 card has detected excessive voltage on the phone line. \*Â |
| FAULT\_POLARITY\_REVERSAL | 6 | The + & - legs of the analog telephone line are reversed |

\* Note:Â The trigger point of a voltage fault is dependent on the Country of Origin settings defined in Tesira software.Â 

Â Â

### Syntax of the Call State Response

Call State response information order:Â

The Call State response will present the information listed above for each line and call appearance of the STC card. If a subscription to a Call State response is setup, the subscription will update if a change is detected in any of the information fields. Call State is available in both verbose and non-verbose responses. Below is an example of the order of information in a Call State response. Â

HEADER\_TOKEN:[{STATE: LINE\_ID: CALL\_ID: ACTION: CALLER\_ID: PROMPT}]Â

Â Â

### Call State Full Command Examples

In the following examples a Call State response will be given in both verbose and non-verbose formats. This information is intended to show a clear example of the expected response order.Â

All subscription responses will start with the â!â character for easy recognition. The response will also include token information in the form of the custom label associated with the subscription. Custom labels are defined in theÂ IndexÂ of the Call State command when the subscription is setup. Â

In the following examples custom label was defines as âRoom\_1â. The call in each example shows the call state immediately after a call has been placed on line 0.Â

#### Verbose Format

! "publishToken":" Room 1" "value":{"callStateInfo":[{"state":TI\_CALL\_STATE\_DIALING "lineId":0 "callId":0 "action":UI\_DISPLAY\_STATUS "cid":"\"07131038\"\"146\"\"\"" "prompt":FAULT\_NONE} ]}Â 

#### Non-Verbose Format

! "Room\_1" [[[2 0 0 2 "\"07131038\"\"146\"\"\"" 1]]]Â 

Â Â

Â Â
