# Pass Filter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Filters/Pass_Filter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Pass Filter Block

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
| PassFilter1 | set | frequency | 100 |

Â Â

#### Example

PassFilter1 set frequency 100 +OK

Â Â

#### Example -Â Filter Type and SlopeÂ Values

Values must be specified within square brackets -filter type must be specified before slope and both parameters MUST be included.

PassFilter1 set filterTypeSlope [LINKWITZ\_RILEY 24] +OK

Â Â

##### Example - Alternate Format

Since "type" and "slope" are clearly denoted within the {braces}, the [value] variables can be provided in either order.

PassFilter1 set filterTypeSlope {"type":LINKWITZ\_RILEY "slope":24} +OK

Â Â

| Attribute | Attribute Code | Command | Value Range |
| --- | --- | --- | --- |
| Bypass | bypass | get / set / toggle | false, true |
| Filter Type | filterType | get | BUTTERWORTH, LINKWITZ\_RILEY, BESSEL |
| Filter Type & Slope | filterTypeSlope | get / set | [Type, slope] or {"type":Type "slope":slope}Â  Type:Â BUTTERWORTH, Slope: 6, 12, 18, 24, 30, 36, 42, 48 Â Â  Type: LINKWITZ\_RILEY, Slope: 12, 24, 36, 48Â Â  Type: BESSEL, Slope: 6, 12, 18, 24, 30, 36, 42, 48 |
| Cutoff Frequency | frequency | get / set / increment / decrement | 20.0 - 20000.0 Hz |
| Max Slope | maxSlope | get | Always 48 dB/oct |
| Number of Channels | numChannels | get | 1 - 32 |
| Filter Slope | slope | get | Linkwitz/Riley: 12, 24, 36, 48  Butterworth: 6,12,18, 24, 30, 36, 42, 48  Bessel: 6, 12, 18, 24, 30, 36, 42, 48 Â |

Â Â

Â Â
