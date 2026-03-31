# TTP Responses

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Responses.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Responses

A Verbose or non-verbose response can be configured as part of theÂ [Session](../Attribute_Tables/Service_Addresses/Session.htm)Â Command type.Â

Â Â

Verbose:Â

+OK âtimeâ:â12:00â ânumberâ:â503-367-3568â âlineâ:â2âÂ

Â Â

Non-Verbose:Â

+OK â12:00â â503-367-3568â â2âÂ

Â Â

#### ExampleÂ

SESSION set verbose trueÂ

Mute1 get numChannelsÂ

+OK "value":2Â

Â Â

SESSION set verbose falseÂ

+OKÂ

Mute1 get numChannelsÂ

+OK 2Â

Â Â

Â Â

## TTP Feedback

Tesira Text Protocol will provide user feedback if a command is incorrect. The response will vary depending on the command. The TesiraÂ TTP error responses for the most common types of external programming errors include:Â

* Canât forward a request to a device thatâs not on the networkÂ
* If an invalid address is usedÂ
* If an invalid attribute or service for a block type (it might be valid for aÂ differentÂ object)Â
* Right address, right attribute or service, but the request doesnât make sense given the state of the target objectÂ
* Case-and-spelling errors of various kindsÂ

Please refer to the table below for some examples and details of some of the expected error responses.Â

| TTP Command String | Message | Resolution |
| --- | --- | --- |
| Â | Â +OK | The command was understood and completed successfully.Â |
| Â Session getÂ  aliases | Â -ERR address not found: {"deviceId":0 "classCode":0 "instanceNum":0} | The requested address is not valid due to incorrect formatting. The Address field is case sensitive.Â SessionÂ commands must be in capitals. Reformat the command asÂ SESSION get aliases.Â |
| Â SESSION Get aliases | Â -ERR Parse error at 8: verb was not one of the commands supported by Services | There is a problem 8 characters into the command. TheÂ getÂ command is incorrectly formatted - it has a capital 'G'. Reformat the command asÂ SESSION get aliases.Â |
| Â SESSION get Aliases | Â -ERR 'Aliases' is not supported by TextSession::Attributes | AliasesÂ is not correctly formatted. It has a capital 'A'. Reformat the command asÂ SESSION get aliases.Â |
| Â Mixer1 set inputMute 1 | Â -ERR Parse error at 22: not enough parameters supplied | The command is missing the value. Reformat the command asÂ Mixer1 set inputMute 1 true.Â |
| Â Mixer1 get inputLevel 1 | Â +OK "value":0.000000 | The command was delivered and the value of the Input level is 0.0dB.Â |
| Â Input1 get gain channel1 | Â -ERR Parse error at 16: could not parse value | Channel1 command is invalid. The Input block channel is numerical. Reformat the command asÂ Input1 get gain 1.Â |
| Â AudioMeter2 subscribe level 3 mymeter 1000 | Â ! "publishToken":"mymeter" "value":-100.000000  +OK | A subscribe of the meter refreshing every 1 second.Â |
| Â MyLevel1 get level 10 | Â -ERR INVALID\_PARAMETER Index out of range:channelIndex min:1 max:8 received:10 | Channel 10 not available. Index indicates channels 1 to 8 available.Â |
| Â | Â -ERR WRONG\_STATE | VoIP card has received a command it cannot action (For example if the card is not connected to the Call Manager and is given a request to make a call) |
| Â | Â -CANNOT\_DELIVER | Typically seen on a system with multiple Server devices when connected to one Server and addressing a DSP object in another server. Would indicate a communication issue between servers.Â |
| Â | Â -GENERAL\_FAILURE | A 'catch all' error code. Can occur when referencing a Instance Tag that is not in the TesiraÂ file.Â |

Â Â

Â Â

Â Â
