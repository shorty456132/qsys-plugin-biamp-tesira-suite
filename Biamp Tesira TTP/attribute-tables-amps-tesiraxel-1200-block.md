# TesiraXEL 1200 Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/TesiraXEL_1200.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# TesiraXEL 1200 Block

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

| Instance Tag |
| --- |
| XAmp1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Amplified Output Allowed Power | allowedPowerWatts | get | channel | 0 - 1200 |
| Amplifier Fault Indicator | ampFault | get / subscribe / unsubscribe | Â | false, true |
| Amplifier Fault String | ampFaultString | get / subscribe / unsubscribe | Â | String indicating amplifier fault |
| Amplifier Mute All Channels | ampMuteAll | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplifier Warning Indicator | ampWarning | get / subscribe / unsubscribe | Â | false, true |
| Amplified Output Auto Mute Threshold | automuteThreshold | get / set / increment / decrement | channel | -100.0 - 0.0 |
| Amplified Output Auto Mute Timeout | automuteTimeout | get / set | channel | AUTOMUTE\_TIMEOUT\_DISABLED, AUTOMUTE\_TIMEOUT\_15, AUTOMUTE\_TIMEOUT\_30, AUTOMUTE\_TIMEOUT\_45, AUTOMUTE\_TIMEOUT\_60 |
| Amplified Output Expected Load | expectedLoad | get | channel | EXPECT\_4\_OHMS, EXPECT\_8\_OHMS, EXPECT\_70\_V, EXPECT\_100\_V |
| Front Panel Lock | frontPanelLock | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplified Output High Pass Filter Enable | highPassFilterEnable | get / set / toggle | channel | false, true |
| Amplified Output Impedance | impedance | get / subscribe / unsubscribe | channel | IMPEDANCE\_NONE, IMPEDANCE\_LOWZ, IMPEDANCE\_SHORT, IMPEDANCE\_OPEN |
| Amplified Output Input Clipping | inputClip | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Input Meter | inputLevel | get / subscribe / unsubscribe | channel | -100.0 - 36.0 dBu |
| Amplified Output Invert | invert | get / set / toggle | channel | false, true |
| Amplified Output Level | level | get / set/ increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dBu |
| Amplified Output Limiter Attenuation | limiterAttenuation | get / subscribe / unsubscribe | channel | LIMITER\_ATTENUATION\_NONE, LIMITER\_ATTENUATION\_LIMITING, LIMITER\_ATTENUATION\_CLIPPING |
| Amplified Output Level Max | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dBu |
| Amplified Output Level Min | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dBu |
| Amplified Output Mute | mute | get / set / toggle / subscribe /Â  unsubscribe | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 4 |
| Amplified Output Clipping | outputClip | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Meter | outputLevel | get / subscribe / unsubscribe | channel | -100.0 - 36.0 |
| Amplified Output Protection | protect | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Fault Reporting Enable | reportingEnable | get / set / toggle | channel | false, true |
| Amplified Output Selected Time | selectedTime | get / subscribe / unsubscribe | Â | 0 - 2147483647 |
| Amplified Output Thermal Protection | thermal | get / subscribe / unsubscribe | channel | THERMAL\_NONE, THERMAL\_WARNING, THERMAL\_FAULT |

Â  Â

Â Â

Â Â
