# Lab Gruppen Amplifier Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Amps/Lab_Gruppen_Amplifier_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Lab Gruppen Amplifier Block

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
| Identify Amplifier | select | Â | Â |

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

Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Amplifier Name | ampName | get | Â | Â |
| Amplifier Power | ampPower | get / set / toggle | Â | false, true |
| Amplified Output Amp Status | ampStatus | get / subscribe / unsubscribe | channel | STATUS\_OK, STATUS\_WARNING, STATUS\_ERROR, STATUS\_UNKNOWN |
| Amplified Output Amp Status Reason | ampStatusReason | get | channel | Reason code for any indicator |
| Amplified Output Auto Power Down Threshold | apdThreshold | get / set / increment / decrement | channel | -100.0 - 0.0 dB |
| Auto Power Down Timeout | apdTimeoutMins | get / set / increment / decrement | Â | 0 - 60 min |
| Amplified Output Channel Name | channelName | get | channel | Â |
| Failover Input Gain | failoverGain | get / set / increment / decrement | channel | 0 - 66 dB in 6 dB increments |
| All Failover Input Indicators | failoverIndicators | get / subscribe / unsubscribe | Â | Â |
| Amplified Output Failover Input Channel | failoverInputChannel | get | channel | Failover input channel or 0 for none |
| Failover Input Invert | failoverInvert | get / set / toggle | channel | false, true |
| Failover Input Level | failoverLevel | get / set / increment / decrement | channel | failoverMinLevel - failoverMaxLevel dB |
| Failover Input Level Max | failoverMaxLevel | get / set / increment / decrement | channel | failoverMinLevel - 12.0 dB |
| Failover Input Level Min | failoverMinLevel | get / set / increment / decrement | channel | -100.0 - failoverMaxLevel dB |
| Failover Input Mute | failoverMute | get / set / toggle | channel | false, true |
| Failover Input Peak Indicator | failoverPeak | get subscribe / unsubscribe | channel | false, true |
| Failover Input Phantom Power | failoverPhantomPower | get / set / toggle | channel | false, true |
| Failover Input Signal Present Indicator | failoverSignalPresent | get / subscribe / unsubscribe | channel | false, true |
| Failover Input Signal Present Threshold | failoverSignalPresentThreshold | get / set / increment / decrement | channel | -64.0 - 30.0 dB |
| Amplified Output Failover Test | failoverTest | get / set / toggle | channel | false, true |
| Amplified Output Failover Test Active Indicator | failoverTestActive | get / subscribe / unsubscribe | channel | false, true |
| Frame Status | frameStatus | get / subscribe / unsubscribe | Â | STATUS\_OK, STATUS\_WARNING, STATUS\_ERROR, STATUS\_UNKNOWN |
| Frame Status Reason | frameStatusReason | get | Â | Reason code for any indicator |
| All Frame Indicators | indicators | get / subscribe / unsubscribe | Â | Â |
| Amplified Output Invert | invert | get / set / toggle | channel | false, true |
| Amplified Output Level | level | get / set / increment / decrement | channel | minLevel - maxLevel dB |
| Amplified Output Load Status | loadStatus | get / subscribe / unsubscribe | channel | STATUS\_OK, STATUS\_WARNING, STATUS\_ERROR, STATUS\_UNKNOWN |
| Amplified Output Load Status Reason | loadStatusReason | get | channel | Reason code for any indicator |
| Amplified Output Level Max | maxLevel | get / set / increment / decrement | channel | minLevel - 0.0 dB |
| Amplified Output Level Min | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Amplified Output Mute | mute | get /set / toggle | channel | false, true |
| Channel Count | numChannels | get | Â | 4 - 4 |
| Selected Time | selectedTime | get / subscribe / unsubscribe | Â | 0 - 2147483647 s |
| Amplified Output Signal Status | signalStatus | get / subscribe / unsubscribe | channel | STATUS\_OK, STATUS\_WARNING, STATUS\_ERROR, STATUS\_UNKNOWN |
| Amplified Output Signal Status Reason | signalStatusReason | get | channel | Reason code for any indicator |

Â Â

Â Â

## Status Indicator Reason Codes

Indicator reasons provide the user with more detail of indicators by way of text strings. It is possible for this list to change but has no functional effect on the amplifier product. Â Â Â Â

| Reason Code | Text in GUI | Comment |
| --- | --- | --- |
| 1 | PSU SAFEMODE | PSU is in safe mode |
| 2 | SENS FLT:DSP | There is no activity in voltage and current sense on any channel when power is ON |
| 3 | AUDIO FAULT Â | Deactivated Audio OK/ or missing audio clocks. Â |
| 4 | NEED SERVICE:1 | The PSU did not get the PFC state OK signal after turning on the PFC in three attempts OR PFCStateOk has gone low during normal operation (HW error) |
| 5 | NEED SERVICE:2 | The PSU did not get the DC state OK signal after turning on the DC/DC in three attempts OR DCStateOk has gone low during normal operation (HW error) |
| 6 | NEED SERVICE:3 Â | The PFC output voltage did not reach the level where the DC/DC should be turned on within the required time |
| 7 | NEED SERVICE:4 | Communication with DICO was lost Â |
| 8 Â | NEED SERVICE:5 | PSU A/D interrupts are not running Â |
| 9 | NEED SERVICE:6 | NTC fault is detected on a PSU temp sensor |
| 10 | NEED SERVICE:7 | Board Id not recognized Â |
| 11 | NEED SERVICE:8 | Supply voltages to the DSP are failing â This is Analog Ok lost! |
| 12 | TEMP FLT:PSU | Temp warning indicator |
| 13 | TEMP FLT:DSP | Temp warning indicator for P20 slot (Host/DICO4) |
| 14 | MAINS >400 VPK | Mains peak voltage is too high for continued operation |
| 15 | MAINS >270 V | Mains RMS voltage is too high for continued operation. |
| 16 | MAINS <65 V | (MAINS <65V) Mains RMS voltage is too low for continued operation |
| 17 | PSU FAULT | Mains power supply failing. Supply voltages to the DSP are failing |
| 18 | CHECK MAINS | The PFC overvoltage protection (HW) tripped. Retry in 10 seconds |
| 19 | UVL ACTIVE | Output power limited by mains input under voltage |
| 20 | PSU RAIL PROT | An internal voltage went below minimum operating level due to an extreme power demand (40 Hz square wave at 0 dBFS) â This is HW Power Good Lost! |
| 21 | TEMP FAULT | Temp warning indicator Â |
| 22 | NO LOAD | Load monitor detected no load. |
| 23 | SHORT CIRCUIT | Short Circuit Fault |
| 24 | Â  SERVICE CH. Â | Amp channel needs service fault |
| 25 | Â  WRONG LOAD Â | Load monitor correct speaker is connected. Â |
| 26 | CAL ACTIVE | Average current limiter is active |
| 27 | CURRENT CLIP | Current Clip One flash red with defined after glow (400ms) Â |
| 28 | VHF FAULT | Very High Frequency Fault. (15kHz continuously @+2dBu) |
| 29 | PAL ACTIVE | (PAL) Active limitation of mains input due to risk of breaking mains fuse. This flag is valid only for PLM10000 and PLM14000. For PLM20000 see PSU status block below. |
| 30 | VOLTAGE CLIP | Voltage Clip One flash red with defined after glow (400ms) |
| 31 | BEL ACTIVE | Output power limited by fuse model |
| 32 | PAL ACT. WARN | Output power limited by mains input current |
| 33 | PTL ACTIVE | Output power limited by PSU overheat |
| 34 | ATL ACTIVEÂ | Output power limited by amp overheat Â |
| 35 | MAINS GLITCH | A glitch < 8 cycles on the mains voltage was detected. PSU was not turned off. |
| 36 | TEMP WARN: PSU | Temp warning indicator |
| 37 | TEMP WARN Â  Â | Temp warning indicator |
| 38 | UNDER SPKR CNT | Load monitor detected fewer speakers than expected |
| 39 | OVER SPKR CNT | Load monitor detected more speakers than expected |
| 40 | SPKR SHORT | Load monitor speaker magnet temperature warning. Change applies from Tesira v2.3 on |
| 41 | SPKR DAMAGED | Load monitor voice coil temperature warning |
| 42 | UNCERTAIN LOAD | Load monitor is uncertain if correct load is connected or not |
| 43 | SELFTEST ERR | Â |
| 44 | SELFTEST WARN | Â |
| 45 | UPGRADE PSU | Â |

Â Â

Â Â

Â Â
