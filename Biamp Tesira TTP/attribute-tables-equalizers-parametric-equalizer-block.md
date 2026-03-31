# Parametric Equalizer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Equalizers/Parametric_Equalizer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Parametric Equalizer Block

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
| ParametricEQ1 | get | numbands |

Â Â

#### Example

ParametricEQ1 get numbands Â 

ParametricEQ1 set gain 1 5.0 Â 

ParametricEQ1 set bandwidth 1 0.5Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bandwidth | bandwidth | get / set / increment / decrement | band | 0.01 - 4.0 oct |
| Bypass | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| Center Frequency | frequency | get / set / increment / decrement | band | 20.0 - 20000.0 Hz |
| Frequency & Gain | frequencyGain | get / set | band | [Frequency, gain] Frequency in Hz |
| Band Gain | gain | get / set / increment / decrement | band | minGain - maxGain dB |
| Band Max Gain | maxGain | get / set / increment / decrement | band | 0.0 - 15.0 dB |
| Band Min Gain | minGain | get / set / increment / decrement | band | -30.0 - 0.0 dB |
| Band Count | numBands | get | Â | 1 - 16 |
| Number of Channels | numChannels | get | Â | 1 - 32 |

Â Â

Â Â
