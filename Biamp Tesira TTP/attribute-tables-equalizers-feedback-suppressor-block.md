# Feedback Suppressor Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Equalizers/Feedback_Suppressor_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Feedback Suppressor Block

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
| FeedbackSuppressor1 | set | fixedAll | true |

Â Â

#### Example

FeedbackSuppressor1 get numbands Â 

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bandwidth | bandwidth | get / set / increment / decrement | band | 0.01 - 4.0 oct |
| Bypass | bypass | get / set / toggle | band | false, true |
| Bypass All | bypassAll | get / set / toggle | Â | false, true |
| All Bands Fixed | fixedAll | get / set / toggle | Â | false, true |
| Floating Band Max Depth | floatingBandMaxDepth | get / set / increment / decrement | Â | -20.0 - 0.0 |
| Floating Band Width | floatingBandWidth | get / set | Â | NARROWBAND, WIDEBAND |
| Center Frequency | frequency | get / set / increment / decrement | band | 20.0 - 20000.0 Hz |
| Frequency & Gain | frequencyGain | get / set | band | [Frequency, gain] Frequency in Hz |
| Band Gain | gain | get / set / increment / decrement | band | -30.0 - 0.0 dB |
| Band Fixed | isFixed | get / set / toggle | band | false, true |
| Band Count | numBands | get | Â | 1 - 16 |
| Channel Count | numChannels | get | Â | 1 - 1 |
| Reset Floating Bands | resetFloatingBands | set | Â | Value ignored |

Â Â

Â Â
