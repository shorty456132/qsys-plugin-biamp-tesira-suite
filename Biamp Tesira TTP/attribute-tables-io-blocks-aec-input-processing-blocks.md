# AEC Input & Processing Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/IO_Blocks/AEC_Input_%26_Processing_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AEC Input & Processing Blocks

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

## AEC Input Block

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â AecInput1 | Â get | Â aecEnable | Â 1 |

Â Â

#### Example -Â Confirm number of channels and set Input gain on Channel 1

AecInput1 get numChannels +OK "value":2 Â 

AecInput1 get gain 1 +OK "value":0.000000 Â 

AecInput1 set gain 1 48 +OKÂ 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Gain | gain | get / set / increment /Â decrement | channel | 0 - 66 dB in 6 dB increments |
| Channel Count | numChannels | get | Â | 1 - 24 |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Phantom Power On | phantomPower | get / set / toggle / subscribe /Â  unsubscribe | channel | false, true |
| All Phantom Power States | phantomPowers | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â

## AEC Processing Block

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â Aec1 | Â get | Â aecEnable | Â 1 |

Â Â

#### Example -Â Confirm processing on Aec1 Instance tag is enabledÂ

Aec1 get aecEnable 1 +OK "value":true

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| AEC Enabled | aecEnable | get / set / toggle | channel | false, true |
| Reset AEC | aecReset | get / set / toggle | channel | false, true |
| Bypass AGC | agcBypass | get / set / toggle | channel | false, true |
| Hold Time | holdTime | get / set / increment / decrement | channel | 0 - 350000 s |
| HPF Bypass | hpfBypass | get / set / toggle | channel | false, true |
| HPF Center Freq. | hpfCutoff | get / set / increment / decrement | channel | 20.0 - 500.0 Hz |
| Invert | invert | get / set / toggle | channel | false, true |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Limiter Enabled | limiterEnable | get / set / toggle | channel | false, true |
| Max Attenuation | maxAttenuation | get / set / increment / decrement | channel | 0.0 - 12.0 dB |
| Max Gain | maxGain | get / set / increment / decrement | channel | 0.0 - 12.0 dB |
| Max Gain Adj. Rate | maxGainAdjRate | get / set / increment / decrement | channel | 0.0 - 5.0 dB/s |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| All Meter States | meters | get / subscribe / unsubscribe | channel | Â |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Min SNR | minSnr | get / set / increment / decrement | channel | 10.0 - 50.0 dB |
| Min Threshold | minThreshold | get / set / increment / decrement | channel | -30.0 - 10.0 dBu |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Nonlinear Processing Mode | nlpMode | get / set | channel | NLPMODE\_NONE, NLPMODE\_LOW, NLPMODE\_MEDIUM, NLPMODE\_HIGH |
| Noise Reduction | nrdMode | get / set | channel | OFF, LOW, MED, HIGH, NOISE\_RED\_MODE\_CUSTOM |
| Channel Count | numChannels | get | Â | 1 - 24 |
| Pre-Emphasis Slope | preEmphasisSlope | get / set | channel | Slope\_0, Slope\_1, Slope\_2, Slope\_3 |
| Speech Mode | speechMode | get / set / toggle | channel | false, true |
| Target Level | targetLevel | get / set / increment / decrement | channel | -10.0 - 10.0 dB |

Â Â

### AEC Reference

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Count | numChannels | get | Â | 1 - 24 |

Â Â

Â Â
