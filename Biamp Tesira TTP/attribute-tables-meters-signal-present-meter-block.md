# Signal Present Meter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Meters/Signal_Present_Meter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Signal Present Meter Block

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

| Instance Tag | Command | Attribute Code | Index | Index | Value |
| --- | --- | --- | --- | --- | --- |
| SignalPrstMeter1 | subscribe | level | 1 | MyMeterName | 500 |

Â Â

#### Example

SignalPrstMeter1 subscribe level 1Â MyMeterNameÂ 500 Â  ! "publishToken":"MyMeterName" "value":-100.000000 +OK ! "publishToken":"MyMeterName" "value":-98.099998 ! "publishToken":"MyMeterName" "value":-77.800003

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Invert | invert | get / set / toggle | channel | false, true |
| Label | label | get / set | channel | Â |
| Signal Level | level | get / subscribe / unsubscribe | channel | -100.0 - 36.0 dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Logic State | logicState | get | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 16 |
| Off Delay | offDelay | get / set / increment / decrement | channel | 0 - 60000 ms |
| On Delay | onDelay | get / set / increment / decrement | channel | 0 - 60000 ms |
| Signal Present | present | get / subscribe / unsubscribe | channel | false, true |
| All Signal Indicators | presents | get / subscribe / unsubscribe | Â | Â |
| Threshold | threshold | get / set / increment / decrement | channel | -64.0 - 30.0 dBu |

Â Â

Â Â
