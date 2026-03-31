# Graphic Equalizer Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Equalizers/Graphic_Equalizer_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Graphic Equalizer Block

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
| GraphicEQ1 | get | gain | 25 |

Â Â

#### Example

GraphicEQ1 get numbands Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bypass Band | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| Band Gain | gain | get / set / increment / decrement | band | minGain - maxGain dB |
| Band Max Gain | maxGain | get / set / increment / decrement | band | 0.0 - 15.0 dB |
| Band Min Gain | minGain | get / set / increment / decrement | band | -30.0 - 0.0 dB |
| Band Count | numBands | get | Â | 10, 15, or 31 |
| Number of Channels | numChannels | get | Â | 1 - 32 |

Â Â

| Band Number | Frequency 1/3 Octave (Hz) | Frequency 2/3 Octave (Hz) | Frequency 1 Octave (Hz) |
| --- | --- | --- | --- |
| 1 | 20 | 25 | 31.5 |
| 2 | 25 | 40 | 63 |
| 3 | 31.5 | 63 | 125 |
| 4 | 40 | 100 | 250 |
| 5 | 50 | 160 | 500 |
| 6 | 63 | 250 | 1000 |
| 7 | 80 | 400 | 2000 |
| 8 | 100 | 630 | 4000 |
| 9 | 125 | 1000 | 8000 |
| 10 | 160 | 1600 | 16000 |
| 11 | 200 | 2500 | Â |
| 12 | 250 | 4000 | Â |
| 13 | 315 | 6300 | Â |
| 14 | 400 | 10000 | Â |
| 15 | 500 | 16000 | Â |
| 16 | 630 | Â | Â |
| 17 | 800 | Â | Â |
| 18 | 1000 | Â | Â |
| 19 | 1250 | Â | Â |
| 20 | 1600 | Â | Â |
| 21 | 2000 | Â | Â |
| 22 | 2500 | Â | Â |
| 23 | 3150 | Â | Â |
| 24 | 4000 | Â | Â |
| 25 | 5000 | Â | Â |
| 26 | 6300 | Â | Â |
| 27 | 8000 | Â | Â |
| 28 | 10000 | Â | Â |
| 29 | 12500 | Â | Â |
| 30 | 16000 | Â | Â |
| 31 | 20000 | Â | Â |

Â Â

Â Â
