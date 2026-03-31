# Gating Auto Mixer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mixers/Gating_Auto_Mixer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Gating Auto Mixer Block

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
| Crosspoint On | crosspoint | get / set / toggle | channel | false, true |
| Direct Output | directOutputLogic | get / set | channel | POST\_GATE\_PRE\_NOM, POST\_GATE\_POST\_NOM |
| Gate Hold Time | gateHoldTimeMs | get / set / increment / decrement | channel | 0.0 - 6000.0 ms |
| Logic Output | gateLogic | get / set | channel | FOLLOWGATE, ON, OFF |
| Input Label | inputLabel | get / set | channel | Â |
| Input Level | inputLevel | get / set / increment / decrement | channel | inputMinLevel - inputMaxLevel dB |
| Max Input Level | inputMaxLevel | get / set / increment / decrement | channel | inputMinLevel - 12.0 dB |
| Min Input Level | inputMinLevel | get / set / increment / decrement | channel | -100.0 - inputMaxLevel dB |
| Input Mute | inputMute | get / set / toggle | channel | false, true |
| Logic Output Invert | invert | get / set / toggle | channel | false, true |
| Logic Outputs Follow Mic Logic | logicOutputsFollowMicLogic | get / set / toggle | Â | false, true |
| Channel Manual | manual | get / set / toggle | channel | false, true |
| Mic Logic Type | micLogic | get / set | Â | NONE, LASTHOLD, CHAN1, CHAN2, ... |
| Mix Output Label | mixOutputLabel | get / set | Â | Â |
| NOM Gain Enabled | nomGainEnable | get / set / toggle | channel | false, true |
| Open Mic Limit | nomLimit | get / set / increment / decrement | Â | 1 - lesser of numInputs-1 or 7 |
| Open Mic Limit Enabled | nomLimitEnable | get / set / toggle | Â | false, true |
| Input Count | numInputs | get | Â | 2 - 256 |
| Off Attenuation | offGain | get / set / increment / decrement | channel | -80.0 - -10.0 dB |
| Output Level | outputLevel | get / set / increment / decrement | Â | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | Â | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | Â | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle | Â | false, true |

Â Â

Â Â
