# Audio-Technica Mic Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Mics/Audio-Technica_Mic_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Audio-Technica Mic Block

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

| Instance Tag |
| --- |
| DanteMic1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Channel Name (Dante Â 'RX Channel Label') | channelName | get / set | channel | Case-insensitive, up to 31 characters except '=' '.' '@' '\' '<' '>' |
| Device Name (Dante 'Hostname of TX Device') | deviceName | get / subscribe / unsubscribe | channel | Â |
| All Device Names (Dante 'Hostnames of all TX Devices') | deviceNames | get / subscribe / unsubscribe | Â | Â |
| Logic Output Enable | enableLogicOutputs | get | Â | false, true |
| Fault on Inactive | faultOnInactive | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| Gain | gain | get / set / increment / decrement | channel | 30-50 dB in 10 dB increments |
| Invert | invert | get / set / toggle | channel | false, true |
| LED Logic | ledLogic | get | Â | NONE, Â  ONE\_LOGIC\_INPUT\_ ALTERNATELY\_DRIVES \_TWO\_LEDS, Â  TWO\_LOGIC\_INPUTS \_FOR\_SEPARATE\_ CONTROL\_OF\_TWO\_LEDS |
| Level | level | get / set / increment / decrement / subscribe / unsubscribe | channel | minLevel - maxLevel dB |
| All Levels | levels | get / subscribe / unsubscribe | Â | Â |
| Locate Mode Enable | locateMode | get / set / toggle | channel | false, true |
| Low Cut | lowCut | get / set / toggle | channel | false, true |
| Max Level | maxLevel | get / set / increment / decrement | channel | minLevel - 12.0 dB |
| Microphone Mode | micMode | get | Â | TOGGLE\_MUTE, TOGGLE\_TALK, PUSH\_TO\_TALK, PUSH\_TO\_MUTE, EXTERNAL |
| Microphone Model | micModel | get | Â | ATND971, ATND8677, ATND8734, ANYTYPE |
| Microphone Mute Occurring | micMute | get / subscribe / unsubscribe | channel | false, true |
| All Microphone Mute Occurring States | micMutes | get / subscribe / unsubscribe | Â | Â |
| Min Level | minLevel | get / set / increment / decrement | channel | -100.0 - maxLevel dB |
| Mute | mute | get / set / toggle / subscribe / unsubscribe | channel | false, true |
| All Mute States | mutes | get / subscribe / unsubscribe | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 64 |
| Logic Input Count | numLogicInputs | get | Â | Zero to three per input channel |
| Peak Occurring | peak | get / subscribe / unsubscribe | channel | false, true |
| All Peaks | peaks | get / subscribe / unsubscribe | Â | Â |
| Phantom Power | phantomPower | get / set / toggle | channel | false, true |

Â Â

Â Â
