# Tone Generator Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Generators/Tone_Generator_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Tone Generator Block

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

| Instance Tag | Command | Attribute Code | Value |
| --- | --- | --- | --- |
| ToneGenerator1 | set | sweepEnable | true |

Â Â

#### Example

ToneGenerator1 set mute false +OK Â 

Â Â

| Reason Code | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Frequency | frequency | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Frequency Increment | frequencyInterval | get / set | OCTAVE\_1, OCTAVE\_2\_3, OCTAVE\_1\_3, OCTAVE\_1\_6, OCTAVE\_1\_12, OCTAVE\_1\_24, OCTAVE\_1\_48, OCTAVE\_1\_96 |
| Level | level | get / set / increment / decrement | minLevel - maxLevel dBu |
| Max Level | maxLevel | get / set / increment / decrement | minLevel - 36.0 dBu |
| Min Level | minLevel | get / set / increment / decrement | -100.0 - maxLevel dBu |
| Mute | mute | get / set / toggle | false, true |
| Channel Count | numChannels | get | 1 - 1 |
| Sweep Enabled | sweepEnable | get / set / toggle | false, true |
| Sweep Start Frequency | sweepFrequencyStart | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Sweep Stop Frequency | sweepFrequencyStop | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Sweep Increment Time | timeInterval | get / set / increment / decrement | 10 - 60000 ms |

Â Â

Â Â
