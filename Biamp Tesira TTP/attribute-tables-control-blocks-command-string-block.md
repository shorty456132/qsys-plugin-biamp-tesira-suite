# Command String Block

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Control_Blocks/Command_String_Block.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Command String Block

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
| CommandString1 | get | command | 1 |

Â Â

#### Example

Level1 get numChannels +OK "value":4Â 

Level1 get levels +OK "value":[0.000000 0.000000 0.000000 0.000000] Â 

Â Â

#### Example - Set Command ID and String

CommandString1 set labelCommand 1 {"label":"Hello" "command":"World"}

CommandString1 set labelCommand1 ["Hello" "World"]

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Autoconnect | autoConnect | get / set / toggle | Â | false, true |
| Command String | command | get / set | command | Â |
| Connection Log | connectionLog | get / subscribe / unsubscribe | Â | Â |
| Expect String | expect | get / set | expect | Â |
| Command ID | label | get / set | command | Â |
| Command ID & String | labelCommand | get / set | command | Set Supports the following format:Â {"label":"Hello" "command":"World"}Â ["Hello" "World"] |
| Network Config | networkConfig | get | Â | Â |
| Channel Count | numChannels | get | Â | 1 - 32 |
| Response Rule | response | get / set | response | Â |
| Serial Config | serialConfig | get | Â | Â |
| Command Status | status | get / subscribe / unsubscribe | Â | Â |
| Command Destination Type | type | get | Â | SERIAL, NETWORK |

Â Â

Â Â

Â Â
