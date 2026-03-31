# Tesira Amplifier Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/Tesira_Amplifier.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Tesira Amplifier Blocks

Tesira rack mount amplifiers attributes. These models include:Â AMP-4175R / AMP-4350R / AMP-4300R CV / AMP-8175R.Â Â 

Â Â

## Service Codes

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Instance Tag | Service |
| --- | --- |
| TAmp1 | select |

Â Â

| Description | Service | Index | Value |
| --- | --- | --- | --- |
| Identify amplifier | select | Â | Â |

Â Â

## Status Attributes

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

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Amplifier Fault Indicator | ampFault | get / subscribe / unsubscribe | Â | false, true |
| Amplified Output Mute All Channels | ampMuteAll | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplifier Power | ampPower | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplifier Standby Timeout | ampStandbyTimeout | get / set | Â | STANDBY\_TIMEOUT\_DISABLED, STANDBY\_TIMEOUT\_15, STANDBY\_TIMEOUT\_30, STANDBY\_TIMEOUT\_45, STANDBY\_TIMEOUT\_60 |
| Amplifier Thermal Fault Indicator | ampThermalFault | get / subscribe / unsubscribe | Â | THERMAL\_NONE, THERMAL\_WARNING, THERMAL\_FAULT |
| Amplifier Warning Indicator | ampWarning | get / subscribe / unsubscribe | Â | false, true |
| Amplified Output AVB Stream Present Indicator | AVBstreamPresent | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Expected Load Impedance | expectedImpedance | get / set | channel | EXPECT\_8\_OHMS, EXPECT\_4\_OHMS |
| Amplified Output Failover Active Indicator | failoverActive | get / subscribe / unsubscribe | channel | false, true |
| Failover Input Gain | failoverGain | get / set / increment / decrement | channel | 0 - 66 dB in 6 dB increments |
| Amplified Output Failover Input Channel | failoverInputChannel | get / set / increment / decrement | channel | Failover input channel or 0 for none |
| Failover Input Invert | failoverInvert | get / set / toggle | channel | false, true |
| Failover Input Level | failoverLevel | get / set / increment / decrement / subscribe / unsubscribe | channel | failoverMinLevel - failoverMaxLevel dB |
| Failover Input Level Max | failoverMaxLevel | get / set / increment / decrement | channel | failoverMinLevel - 12.0 dB |
| Failover Input Level Min | failoverMinLevel | get / set / increment / decrement | channel | -100.0 - failoverMaxLevel dB |
| Failover Input Mute | failoverMute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Failover Input Peak Indicator | failoverPeak | get / subscribe / unsubscribe | channel | false, true |
| Failover Input Phantom Power | failoverPhantomPower | get / set / toggle | channel | false, true |
| Failover Input Signal Present Indicator | failoverSignalPresent | get / subscribe / unsubscribe | channel | false, true |
| Failover Input Signal Present Threshold | failoverSignalPresentThreshold | get / set / increment / decrement | channel | -64.0 - 30.0 dB |
| Amplified Output Failover Test | failoverTest | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Front Panel Lock | frontPanelLock | get / set / toggle / subscribe / unsubscribe | Â | false, true |
| Amplified Output Sensitivity | gain | get / set / increment / decrement | channel | 0 - 24 dB in 6 dB increments |
| Amplified Output High Impedance Indicator | highImpedance | get / subscribe / unsubscribe | channel | HIGH\_IMPEDANCE\_NONE, HIGH\_IMPEDANCE\_OPEN |
| Amplified Output Input Meter | inputLevel | get / subscribe / unsubscribe | channel | -100.0 - 36.0 dB |
| Amplified Output Invert | invert | get / set / toggle | channel | false, true |
| Amplified Output Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| Amplified Output Limiter Attenuation | limiterAttenuation | get / subscribe / unsubscribe | channel | LIMITER\_ATTENUATION\_NONE, LIMITER\_ATTENUATION\_LIMITING, LIMITER\_ATTENUATION\_CLIPPING |
| Amplified Output Limiter Attenuation Level | limiterAttenuationLevel | get / subscribe / unsubscribe | channel | 0.0 - 24.0 dB |
| Amplified Output Limiter Enable | limiterEnable | get / set / toggle | channel | false, true |
| Amplified Output Low Impedance Indicator | lowImpedance | get / subscribe / unsubscribe | channel | LOW\_IMPEDANCE\_NONE, LOW\_IMPEDANCE\_LOWZ, LOW\_IMPEDANCE\_SHORT |
| Amplified Output Low Impedance Monitoring Enable | lowImpedanceMonitoringEnable | get / set / toggle | channel | false, true |
| Amplified Output Level Max | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Amplified Output Level Min | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Amplified Output Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Channel Count | numChannels | get | Â | 1 - 8 |
| Amplified Output Current | outputCurrentLevel | get / subscribe / unsubscribe | channel | any value for Arms |
| Amplified Output Voltage | outputVoltageLevel | get / subscribe / unsubscribe | channel | any value for Vrms |
| Selected Time | selectedTime | get / subscribe / unsubscribe | Â | 0 - 2147483647 s |
| Amplified Output Standby Threshold | standbyThreshold | get / set / increment / decrement | channel | -100.0 - 0.0 dB |
| Amplified Output Thermal Fault Indicator | thermalFault | get / subscribe / unsubscribe | channel | false, true |
| Amplified Output Thermal Warning Indicator | thermalWarning | get / subscribe / unsubscribe | channel | false, true |

Â Â

Â Â

Â Â
