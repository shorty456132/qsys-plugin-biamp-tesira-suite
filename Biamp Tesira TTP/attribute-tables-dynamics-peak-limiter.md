# Peak Limiter

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/Peak_Limiter.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Peak Limiter

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
| PeakLimiter1 | get | numChannels |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Active LED | activeLED | get / subscribe / unsubscribe | channel | false, true |
| All Active LEDs | allActiveLEDs | get / subscribe / unsubscribe | Â | Â |
| Bypass | bypass | get / set / toggle | Â | false, true |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Release Time | releaseTime | get / set / increment / decrement | Â | 1.0 - 10000.0 ms |
| Peak Threshold | threshold | get / set / increment / decrement | Â | -20.0 - 28.0 dB |

Â Â

Â Â
