# EX-UBT, EX-USB, & USB X Blocks

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/EX-UBT_%26_EX-USB_Blocks.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# EX-UBT, EX-USB, & USB X Blocks

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

Â Â

## EX-UBT, EX-USB, USB X Status Attributes

The EX-USB and USB X share all of the same attributes as the EX-UBT excluding Bluetooth functions.Â 

Â Â

### USB Input Block Status Attributes

Â Â

| Instance Tag |
| --- |
| USBInput1Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Connection StatusÂ | connectedÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| Hook Switch StatusÂ | hookSwitchÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| LevelÂ | levelÂ | get / set / increment / decrement / subscribe / unsubscribeÂ | channelÂ | minLevel - maxLevel dBÂ |
| All LevelsÂ | levelsÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Max LevelÂ | maxLevelÂ | get / set / increment / decrementÂ | channelÂ | minLevel - 0.0 dBÂ |
| Min LevelÂ | minLevelÂ | get / set / increment / decrementÂ | channelÂ | -100.0 - maxLevel dBÂ |
| MuteÂ | muteÂ | get / set / toggle / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| Mute Inputs as GroupÂ | muteAsGroupÂ | getÂ | Â | false, trueÂ |
| All Mute StatesÂ | mutesÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Channel CountÂ | numChannelsÂ | getÂ | Â | 1 - 8Â |
| Peak OccurringÂ | peakÂ | get / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| All PeaksÂ | peaksÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Streaming StatusÂ | streamingÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| USB Device NameÂ | usbDeviceNameÂ | get / setÂ | Â | Â |

Â Â

### USB Output Block Status Attributes

Â Â

| Instance Tag |
| --- |
| USBOutput1Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Connection StatusÂ | connectedÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| Hook Switch StatusÂ | hookSwitchÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |
| LevelÂ | levelÂ | get / set / increment / decrement / subscribe / unsubscribeÂ | channelÂ | minLevel - maxLevel dBÂ |
| All LevelsÂ | levelsÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Max LevelÂ | maxLevelÂ | get / set / increment / decrementÂ | channelÂ | minLevel - 0.0 dBÂ |
| Min LevelÂ | minLevelÂ | get / set / increment / decrementÂ | channelÂ | -100.0 - maxLevel dBÂ |
| Mute StatusÂ | muteÂ | get / set / toggle / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| Mute Outputs as GroupÂ | muteAsGroupÂ | getÂ | Â | false, trueÂ |
| All Mute StatesÂ | mutesÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Channel CountÂ | numChannelsÂ | getÂ | Â | 1 - 8Â |
| Streaming StatusÂ | streamingÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ |

Â Â

Â Â

## EX-UBT Bluetooth Attributes

The following Bluetooth attributes are exclusively available for the EX-UBT.Â 

Â Â

### Bluetooth Input Block Status Attributes

Â Â

| Instance Tag |
| --- |
| BluetoothInput1Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| LevelÂ | levelÂ | get / set / increment / decrement / subscribe / unsubscribeÂ | channelÂ | minLevel - maxLevel dBÂ |
| All LevelsÂ | levelsÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Max LevelÂ | maxLevelÂ | get / set / increment / decrementÂ | channelÂ | minLevel - 0.0 dBÂ |
| Min LevelÂ | minLevelÂ | get / set / increment / decrementÂ | channelÂ | -100.0 - maxLevel dBÂ |
| MuteÂ | muteÂ | get / set / toggle / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| All Mute StatesÂ | mutesÂ | get / subscribe / unsubscribeÂ | Â | Â |
| Channel CountÂ | numChannelsÂ | getÂ | Â | 2 - 2Â |
| Peak OccurringÂ | peakÂ | get / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| All PeaksÂ | peaksÂ | get / subscribe / unsubscribeÂ | Â | Â |

Â  Â

### Bluetooth Output Block Status Attributes

Â Â

| Instance Tag |
| --- |
| BluetoothOutput1Â |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| LevelÂ | levelÂ | get / set / increment / decrement / subscribe / unsubscribeÂ | channelÂ | minLevel - maxLevel dBÂ |
| Max LevelÂ | maxLevelÂ | get / set / increment / decrementÂ | channelÂ | minLevel - 0.0 dBÂ |
| Min LevelÂ | minLevelÂ | get / set / increment / decrementÂ | channelÂ | -100.0 - maxLevel dBÂ |
| Mute StateÂ | muteÂ | get / set / toggle / subscribe / unsubscribeÂ | channelÂ | false, trueÂ |
| Channel CountÂ | numChannelsÂ | getÂ | Â | 1 - 1Â |

Â Â

### Bluetooth Control & Status Block

#### ServicesÂ

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

#### Â Â

| Service Code | Parameters |
| --- | --- |
| disconnectÂ | (none)Â |

Â Â

#### AttributesÂ

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

Â  Â Â

| Instance Tag |
| --- |
| BluetoothControlStatus1 |

Â Â

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Bluetooth Device NameÂ | deviceNameÂ | get / setÂ | Â | text up to 32 charactersÂ |
| Bluetooth MAC AddressÂ | deviceMACÂ | get / subscribe / unsubscribeÂ | Â | string in format XX:XX:XX:XX:XX:XXÂ |
| Bluetooth DiscoverableÂ | discoverableÂ | get / set / toggle / subscribe / unsubscribeÂ | Â | false, true Â |
| Bluetooth EnabledÂ | enableÂ | get / set / toggle / subscribe / unsubscribeÂ | Â | false, true Â |
| Bluetooth Inactivity TimeoutÂ | inactivityTimeoutÂ | get / setÂ | Â | 0-1800s. 0 denotes no timeoutÂ |
| Connected Device NameÂ | connectedDeviceNameÂ | get / subscribe / unsubscribeÂ | Â | string with 0 - 248 characters. "None" when no devices are connected.Â |
| Streaming ProfileÂ | profileÂ | get / subscribe / unsubscribeÂ | Â | String containing: Profile, CODEC, Sample Rate. e.g., "HFP, SBC, 16kHz"Â |
| Connection StatusÂ | connectedÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ  Â |
| Disconnects Paired BluetoothÂ  Device | disconnectÂ | Â | Â | Â |
| Streaming StatusÂ | streamingÂ | get / subscribe / unsubscribeÂ | Â | false, trueÂ  Â |

Â Â

Â Â

Â Â
