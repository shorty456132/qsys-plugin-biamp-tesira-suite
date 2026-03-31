# Session

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Service_Addresses/Session.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Session

The SESSION Instance Tag is case sensitive and must be in capital letters. It is used to send session specific Attributes and Commands. This includes the response method and can be used to query the commands.Â 

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

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Â SESSION | Â get | Â aliases |

#### ExampleÂ Â

SESSION get aliases +OK "list":["123" "AudioMeter1" "AudioMeter2" "AudioMeter3" "DEVICE" "Input1" "Mixer1" "Mute1" "Level1" "Output1"]Â Â

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Alias | alias | get | name | Â |
| Aliases | aliases | get | Â | Â |
| Detailed Responses Enabled | detailedResponse | get / set / toggle | Â | false, true |
| Get TTP session ID | sessionID | get | Â | Â |
| Enable/Disable TTP logging | ttpLoggingEnable | get / set / toggle | Â | false, true |
| Verbose Output Enabled | verbose | get / set / toggle | Â | false, true |

Â Â

Â Â

## Output Styles

A Verbose or concise response can be configured as part of the Session type.

* Verbose:Â +OK âtimeâ:â12:00â ânumberâ:â503-367-3568â âlineâ:â2â
* Concise:Â +OK â12:00â â503-367-3568â â2â

Â Â

#### Example

SESSION set verbose true Mute1 get numChannels +OK "value":2

SESSION set verbose false +OK

Mute1 get numChannels +OK 2 Â 

#### Â Â

Â Â

Â Â
