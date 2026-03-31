# Leveler Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/Leveler_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Leveler Block

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
| Leveler1 | get | threshold |

Â Â

#### Example

Leveler1 get threshold Â 

Leveler1 set threshold -40

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| All Gain Reductions | allGainReduction | get / subscribe / unsubscribe | Â | -152.0 - 0.0 dB |
| Bypass | bypass | get / set / toggle | Â | false, true |
| Gain Reduction by channel | gainReduction | get / subscribe / unsubscribe | Channel | -152.0 - 0.0 dBÂ |
| Gain Reduction | gainReductionLevel | get / subscribe / unsubscribe | Â | -152.0 - 0.0 dBÂ (will only work on the first channel of a multi-channel block) |
| Label | label | get / set | Â | Â |
| Number of channels | numChannels | get | Â | 1 - 32 |
| Response Time | responseTime | get / set / increment /Â decrement | Â | 0.1 - 40000.0 ms |
| Threshold | threshold | get / set / increment /Â decrement | Â | -60.0 up to 24.0 dBu |

Â Â

Â Â
