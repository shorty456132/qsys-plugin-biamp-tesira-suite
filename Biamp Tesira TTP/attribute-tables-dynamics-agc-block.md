# AGC Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Dynamics/AGC_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# AGC Block

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
| AGC1 | get | speech |

Â Â

#### Example

AGC1 get speech Â 

AGC1 set speech true

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| AGC Active | agcActive | get | Â | false, true |
| All channel meters | allChannelMeters | get / subscribe / unsubscribe | Â | Â |
| All voice detect | allVoiceDetect | get / subscribe / unsubscribe | Â | Â |
| Bypass | bypass | get / set / toggle | Â | false, true |
| Meter by channel | channelMeters | get / subscribe / unsubscribe | channel | Â |
| Gain Level | gainLevel | get | Â | -30.0 - 30.0 dB |
| Hold Time | holdTime | get / set / increment /Â decrement | Â | 0 - 350000 s |
| Input Level | inputLevel | get | Â | -100.0 - 36.0 dBu |
| Limiter On | limiter | get / set / toggle | Â | false, true |
| Limiter Active | limiterActive | get | Â | false, true |
| Max Attenuation | maxAtten | get / set / increment /Â decrement | Â | 0.0 - 30.0 dB |
| Max Gain | maxGain | get / set / increment /Â decrement | Â | 0.0 - 30.0 dB |
| Max Gain Adj. Rate | maxGainRate | get / set / increment /Â decrement | Â | 0.0 - 15.0 dB/s |
| All Meter States | meters | get / subscribe / unsubscribe | Â | (will only work on the first channel of a multi-channel block) |
| Min SNR | minSnr | get / set / increment /Â decrement | Â | 10.0 - 50.0 dB |
| Min Threshold | minThreshold | get / set / increment /Â decrement | Â | -30.0 - 20.0 dBu (Max Value equal to Target Level) |
| Noise Floor Level | noiseFloorLevel | get | Â | -100.0 - 36.0 dBu |
| Number of channels | numChannels | get | Â | 1 - 32 |
| Side Chain Level | sideChainLevel | get | Â | -100.0 - 36.0 dBu |
| SNR Level | snrLevel | get | Â | 0.0 - 136.0 dB |
| Speech On | speech | get / set / toggle | Â | false, true |
| Target Level | targetLevel | get / set / increment /Â decrement | Â | -20.0 - 20.0 dB |
| Voice detect per channel | voiceDetect | get / subscribe / unsubscribe | Â | Â |

Â Â

Â Â

Â Â
