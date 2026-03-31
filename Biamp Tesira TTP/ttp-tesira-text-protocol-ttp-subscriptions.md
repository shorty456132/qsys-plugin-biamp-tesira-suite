# TTP Subscriptions

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Subscriptions.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Subscriptions

Subscriptions enable the updating of metering and level values to be sent to a external control system without the control system requesting information.Â

Elements of a processing object can be subscribed to such as channel levels and meters. TheÂ Attribute tablesÂ will indicate which functions support subscription.Â

If subscriptions are used the TesiraÂ server may be sending back replies that were not individually requested from the control system (they were subscribed to). All subscribed objects will be preceded by a ! "publishToken"Â statement would indicate to the control system that the returned packet is from a subscription not a response to a command that was just sent.Â

Subscriptions are lost when the TesiraÂ server is rebooted or a change in configuration is sent to the system. Subscriptions can be revalidated by subscribing to the same block at regular intervals. If this is done ensure that the custom label used inÂ IndexÂ is used in the re-subscription. If this label is not included it is possible to inadvertently open multiple subscriptions to the same call state.Â

Â Â

**Instance\_Tag Command Attribute [Index] [Value] LF**

* Instance Tag:Â Is always required.Â
* Command: Is always required.Â
* Attribute:Â Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.

For additional information on individual elements of a TTP string please review the [TTP Syntax](TTP_Syntax.htm) page.

Â Â

## Subscribe

An example subscribing to a level with a 500ms refresh.Â

| Instance Tag | Command | Attribute Code | Index | Index | Value |
| --- | --- | --- | --- | --- | --- |
| Â MyLevel1 | Â subscribe | Â level | Â 1 | Â MyLevelName | Â 500 |

### Verbose Subscription Responses

When the subscription command is first sent the first reply will be:Â

! "publishToken":"[CustomName]" "value":[Value] +OKÂ

Â Â

Subsequent subscription replies will be formatted:Â

! "publishToken":"[CustomName]" "value":[Value]Â

* TheÂ [CustomName]Â is used as an identifier. The identifier returned is specified in the Index field of the original subscribe command. This name can then be used in a parsing routine for the subscribed item. If no identifier is specified then empty double speech-marks ("") are shown in the response as a delimiter.Â
* TheÂ [Value]Â is the current state of the control being subscribed to. This will be formatted as an integer or boolean depending on the subscription attribute.Â

Â Â

#### Verbose Example

MyLevel1 subscribe level 1Â MyLevelNameÂ 500 Â  ! "publishToken":"MyLevelName" "value":-100.000000 +OK ! "publishToken":"MyLevelName" "value":-98.099998 ! "publishToken":"MyLevelName" "value":-77.800003 ! "publishToken":"MyLevelName" "value":-35.299999Â 

Â Â

#### Verbose Example

MyLevel1 subscribe level 1 Â  ! "publishToken":"" "value":-100.000000 +OK ! "publishToken":"" "value":-98.099998 ! "publishToken":"" "value":-77.800003 ! "publishToken":"" "value":-35.299999Â 

Â Â

### Non-Verbose Subscription Responses

If a non-verbose response is required this must be specified before as a SESSION command and must be configured before the subscription.Â 

Â Â

When the subscription command is first sent the first reply will be:Â

! "[CustomName]" [Value] +OKÂ

Â Â

Subsequent subscription replies will be formattedÂ

! "[CustomName]" [Value]Â

* TheÂ [CustomName]Â is used as an identifier. The identifier returned is specified in the Index field of the original subscribe command. This name can then be used in a parsing routine for the subscribed item. If no identifier is specified then empty double speech-marks ("") are shown in the response as a delimiter.Â
* TheÂ [Value]Â is the current state of the control being subscribed to. This will be formatted as an integer or boolean depending on the subscription attribute.Â

Â Â

#### Verbose Example

Welcome to the Tesira Text Protocol Server... Â  SESSION set verbose false +OK Â  MyLevel1 subscribe level 1 myLevelName 500 ! "myLevelName" -40.244328 +OK ! "myLevelName" -38.992748 ! "myLevelName" -41.044147 ! "myLevelName" -40.063908 ! "myLevelName" -38.674465Â 

Â Â

Â Â

## Unsubscribe

Once a value has been subscribed to, the unsubscribe command is used to cancel the request. If an Index and value have been specified in the original subscribe request they must be used in the unsubscribe request.Â

Â Â

**Instance\_Tag Command Attribute [Index] [Index]Â LF**

* Instance Tag:Â Is always required. Is the same Instance Tag used to originally subscribe.Â
* Command: Is always required. Is the same Command used to originally subscribe.Â
* Attribute:Â Is always required. Is the same Attribute used to originally subscribe.Â
* [Index]: Is required if specified as part of the Attribute. Is the same Attribute index or indexes used to originally subscribe.Â
* [Index]:Â Is required if specified as part of the original subscription. Must match the custom name given in the original subscription.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

Â Â

An example unsubscribing to a level.Â

| Instance Tag | Command | Attribute Code | Index | Index |
| --- | --- | --- | --- | --- |
| Â MyLevel1 | Â unsubscribe | Â level | Â 1 | Â MyLevelName |

#### Â Â

#### Example

MyLevel1 subscribe level 1Â MyLevelNameÂ 500 Â  ! "publishToken":"MyLevelName" "value":-100.000000 +OK ! "publishToken":"MyLevelName" "value":-98.099998 ! "publishToken":"MyLevelName" "value":-77.800003 ! "publishToken":"MyLevelName" "value":-35.299999 Â 

MyLevel1 unsubscribe level 1Â MyLevelNameÂ +OKÂ 

Â Â

Â Â

Â Â
