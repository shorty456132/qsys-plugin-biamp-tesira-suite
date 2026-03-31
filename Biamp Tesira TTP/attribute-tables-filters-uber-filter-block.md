# Uber Filter Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Filters/Uber_Filter_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Uber Filter Block

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
| UberFilter1 | get | frequency | 1 |

Â Â

#### Example

UberFilter1 get frequency 1 Â 

UberFilter1 set frequency 1 4000Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Band Type | bandType | get | band | NONE, PARAMETRIC\_EQ, PASS, SHELF |
| Bandwidth | bandwidth | get / set / increment / decrement | band | 0.01 - 4.0 oct |
| Band Bypass | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| Band Frequency | frequency | get / set / increment / decrement | band | 20.0 - 20000.0 Hz |
| Frequency & Bandwidth | frequencyBandwidth | get / set | band | Â |
| Frequency & Gain | frequencyGain | get / set | band | [Frequency, gain] Must be a parametric or shelf Frequency = Â value in Hz |
| Frequency, Gain & Bandwidth | frequencyGainBandwidth | get / set | band | Â |
| Band Gain | gain | get / set / increment / decrement | band | for shelf bands -30.0 - 15.0 dB , for parametric bandsÂ -30 - 15.0 dB |
| Locked Band Type | locked | get | band | false, true |
| Max Slope | maxSlope | get | Â | Always 48 dB/oct |
| Band Count | numBands | get | Â | 1 - 16 |
| Number of Channels | numChannels | get | Â | 1 - 32 |
| Pass Filter Type | passFilterType | get | band | BUTTERWORTH, LINKWITZ\_RILEY, BESSEL |
| Pass Filter Type & Slope | passFilterTypeSlope | get / set | band | [Type, slope] or {"type":Type "slope":slope} Â  Type:BUTTERWORTH, Slope:6,12,18,24,30,36,42,48 Â Â  Type: LINKWITZ\_RILEY, Slope: 12, 24,36,48 Â Â  Type: BESSEL Slope:6,12,18,24,30,36,42,48 |
| Filter Slope | slope | get | band | Linkwitz/Riley: 12, 24,36,48 Butterworth: 6,12,18,24,30,36,42,48 Bessel: 6,12,18,24,30,36,42,48 |

Â Â

Â Â
