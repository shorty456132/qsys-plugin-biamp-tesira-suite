# Crossover Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Crossovers/Crossover_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Crossover Block

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
| Crossover1 | toggle | synchronize |

Band: Indexed by number from high to low, so in a four-way crossover high=1, mid high=2, low mid =3, and low=4.Â 

Filter: Indexed by number. 1 is the high cutoff frequency for each band while 2 is the low.Â 

Â Â

#### Example -Â Filter Type and SlopeÂ ValuesÂ

Values must be specified within square brackets -filter type must be specified before slope and both parameters MUST be included.Â 

Crossover1 set filterTypeSlope 1 1 [LINKWITZ\_RILEY 24] +OKÂ 

Â Â

##### Example - Alternate FormatÂ

Since "type" and "slope" are clearly denoted within the {braces}, the [value] variables can be provided in either order.Â 

Crossover1 set filterTypeSlope 1 1 {"type":LINKWITZ\_RILEY "slope":24} +OKÂ 

Â Â

| Reason Code | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Filter Type | filterType | get | band, filter | BUTTERWORTH, LINKWITZ\_RILEY, BESSEL, CHEBYCHEV, VARIABLE\_Q |
| Filter Type & Slope | filterTypeSlope | get / set | band, filter | Â |
| Cutoff Frequency | frequency | get / set / increment / decrement | band, filter | 20.0 - 20000.0 Hz |
| Input Level | inputLevel | get / set / increment / decrement | Â | inputMinLevel - inputMaxLevel dB |
| Max Input Level | inputMaxLevel | get / set / increment / decrement | Â | inputMinLevel - 12.0 dB |
| Min Input Level | inputMinLevel | get / set / increment / decrement | Â | -100.0 - inputMaxLevel dB |
| Input Mute | inputMute | get / set / toggle | Â | false, true |
| Max Slope | maxSlope | get | Â | Always 48 dB/oct |
| Band Count | numBands | get | Â | 2 - 4 |
| Band Filter Count | numFilters | get | band | 1 - 2 |
| Input Count | numInputs | get | Â | 1 - 1 |
| Output Count | numOutputs | get | Â | 1 - 4 |
| Output Invert | outputInvert | get / set / toggle | band | false, true |
| Output Level | outputLevel | get / set / increment / decrement | band | outputMinLevel - outputMaxLevel dB |
| Max Output Level | outputMaxLevel | get / set / increment / decrement | band | outputMinLevel - 12.0 dB |
| Min Output Level | outputMinLevel | get / set / increment / decrement | band | -100.0 - outputMaxLevel dB |
| Output Mute | outputMute | get / set / toggle | band | false, true |
| Filter Slope | slope | get | band, filter | Linkwitz/Riley: 12 - 48 in inc. of 12; Others: 6 - 48 in inc. of 6; dB/oct |
| Synchronize Bands | synchronize | get / set / toggle | Â | false, true |

Â Â

Â Â
