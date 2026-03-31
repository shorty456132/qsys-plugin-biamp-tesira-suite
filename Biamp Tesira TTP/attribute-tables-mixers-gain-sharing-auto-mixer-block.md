# Gain Sharing Auto Mixer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mixers/Gain_Sharing_Auto_Mixer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Gain Sharing Auto Mixer Block

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

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Mixer1 | get | crosspoint | 1 |

Â Â

#### Example

Mixer1 get crosspoint 1 Â 

Mixer2 set crosspoint 1 true

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Level | channelLevel | get / set / increment / decrement / subscribe / unsubscribe | channel | channelMinLevel - channelMaxLevel dB |
| All Channel Levels | channelLevels | get / subscribe / unsubscribe | Â | Â |
| Max Channel Level | channelMaxLevel | get / set / increment / decrement | channel | channelMinLevel - 12.0 dB |
| Min Channel Level | channelMinLevel | get / set / increment / decrement | channel | -100.0 - channelMaxLevel dB |
| Channel Mute | channelMute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Channel Mutes | channelMutes | get / subscribe / unsubscribe | Â | Â |
| Crosspoint On | crosspoint | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Crosspoint States | crosspoints | get / subscribe / unsubscribe | Â | Â |
| Gain Reduction | gainReduction | get / subscribe / unsubscribe | channel | -100.0 - 0.0 dB |
| All Gain Reductions | gainReductions | get / subscribe / unsubscribe | Â | Â |
| Gain Response Time | gainResponseTimeMs | get / set / increment / decrement | Â | 1 - 100 ms |
| Input Label | inputLabel | get / set | channel | Â |
| Input Mute | inputMute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Input Mutes | inputMutes | get / subscribe / unsubscribe | Â | Â |
| Mic Isolation Factor | micIsolationFactor | get / set / increment / decrement | Â | 0.0 - 2.0 |
| Mix Output Label | mixOutputLabel | get / set | Â | Â |
| Input Count | numInputs | get | Â | 2 - 256 |
| Output Level | outputLevel | get / set / increment / decrement / subscribe / unsubscribe | Â | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | Â | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | Â | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle / subscribe / unsubscribe | Â | false, true |

Â Â

Â Â
