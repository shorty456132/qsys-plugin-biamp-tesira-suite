# TTP Syntax

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Syntax.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Syntax

TheÂ Services CodeÂ defines a instruction and function for a DSP block to perform. TheÂ Attribute CodeÂ defines the portion of the DSP block to be controlled such as a fader level. Each element of the command instruction is delimited by a single space. The commands are case sensitive and upper and lower case characters are used.Â 

Â Â

Â Â

## Instance Tag

TheÂ Instance TagÂ is case sensitive and is the unique name of a software object used in a TesiraÂ project. The Instance Tag can be found when disconnected from the System in theÂ DSP Properties tab of the [Properties](../../Tabs/View/Show/Properties.htm) docking menu. This defaults to the object code when compiled but can be customized by the user. The TesiraÂ compiler will also check for duplicate Instance Tags. Instance tags can be defined within speech marks. If instance tags have no spaces they do not require speech marks. Instance tags can be numerical and contain spaces. Any Customized Instance tags that contain spaces must be defined within speech marks.Â Duplicate instance tags are not allowed. If duplicates are created a dialog will appear allowing editing of the tags.Â 

Â Â

Note: The following Instance Tag characters are illegal:Â / &Â 

Â Â

### Available Instance Tags

AÂ [Session](../Attribute_Tables/Service_Addresses/Session.htm)Â command can be used to get a listing of available Instance Tags. Any devices that have an incomplete audio path will not be listed.Â 

Â

#### ExampleÂ

SESSION get aliasesÂ

+OK "list":["123" "AudioMeter1" "AudioMeter2" "AudioMeter3" "DEVICE" "Input1" "Mixer1" "Mute1" "Level1" "Output1"]Â

Â Â

#### Example - Using an Instance Tag Called Level1Â

Level1 get level 1Â

+OK "value":0.000000Â

Â Â

#### Example -Â Instance tags can contain spaces enclosed in speech marksÂ

"my level 2" get level 1Â

+OK "value":-10.000000Â

Â Â

Missing speech marks will return an error:Â

my level 2 get level 1Â

-ERR address not found: {"deviceId":0 "classCode":0 "instanceNum":0}Â

Â Â

#### Example - Instance Tags may be NumericalÂ

123 get level 1Â

+OK "value":-10.000000Â

Â Â

Â Â

## Command

The Command field specifies what is to be done with the DSP processing block Attribute.Â TesiraÂ Text Protocol supports different Attribute commands as listed below. These are case sensitive and the availability of the command would depend on the DSP object Attribute Code. The following table shows the Commands which only apply to Attribute Codes. An Attribute Code may not support all of them, but it will support at least one.Â Â 

Â Â

Â Â

## Attribute

The attribute Code defines the portion of the DSP Processing block to be controlled such as a fader level, crosspoint mute, etc.Â 

Â Â

Â Â

## Service

The Services Code defines a instruction and function for a Hardware item to perform or a system wide command such as recalling a Preset. Any Service Code commands do not use AttributeÂ CommandsÂ such as get, set, etc. Instead they use their own commands such asÂ recallPresetÂ orÂ dial.Â

Â Â

Â Â

## Index

Attribute Codes use Index fields to refer to inputs, outputs, or cross attribute of a DSP Block. Due to the different types of DSP blocks, some attributes will not require and Index so no value should be used. Some DSP blocks require a single index such as a level control. Some DSP blocks require 2 indexes such as a matrix mixer. The first index would be the Input or Row and the second index would be the Output or Column.Â

Â Â

For aÂ Crossover,Â IndexÂ bandÂ is indexed by number from high to low, so in a four-way crossover high=1, mid high=2, low mid =3 and low=4.Â filterÂ is indexed by number. 1 is the high cutoff frequency for each band while 2 is the low.Â

Â Â

#### Example -Â Index values can be Encased in Double Quotes

Mixer1 set crosspoint 1 1 true +OK Mixer1 set crosspoint "1""1" true +OKÂ 

Â Â

When aÂ subscriptionÂ command is configured a unique custom name can be used in the second Index of the command line. This is used as the identifier for the subscribed item.Â

Â Â

Some Service Codes use index fields to define the hardware channel that is being controlled. For example, aÂ Dialer BlockÂ will require theÂ lineÂ andÂ Call appearanceÂ indexes to be specified.Â

Â Â

Â Â

## Value

Value determines what a DSP block is being set to, incremented by, or decremented by. TheÂ interface definition tablesÂ define which type of value the string will need in order to execute the TTP string.Â

Â Â

A TTP value will depend on the attribute being controlled. It can be:Â

* A numberÂ
* A string (in double quotes)Â
* A Boolean (true or false)Â
* nullÂ

Â Â

| Required Action | Value Example | Description |
| --- | --- | --- |
| Â Turn On | Â true | Refers to the 'on' state of a processing object component with two states such as a crosspoint, mute or similar.Â |
| Â Turn Off | Â false | Refers to the 'off' state of a processing object component with two states such as a crosspoint, mute or similar.Â |
| Â Adjust Level (set, increment, decrement) | Â 1.0 -1.0 -15 etc... | A numerical decimal value used to represent the new state.Â For a 'set' command this will move the value to the specified level. For an increment it will adjust the value from the current value by the specified amount. |
| Â State | Â BUTTERWORTH | A text string can be used to represent a value such as a filter type |
| Â Preset | Â 1001 | An Integer that is the required state. |

Â Â

Â Â

## Special Addresses

### Device

The local unit currently connected. SeeÂ [Device](../Attribute_Tables/Service_Addresses/Device.htm)Â for a full listing of commands.Â 

| Instance Tag | Command | Attribute Code | Index | Line\_Feed |
| --- | --- | --- | --- | --- |
| Â DEVICE | Â get | Â ipStatus | Â interface | Â LF |

Â Â

### Session

The currentÂ RS-232,Â TelnetÂ orÂ SSHÂ text session. See [Session](../Attribute_Tables/Service_Addresses/Session.htm)Â for a full listing of commands.Â 

| Instance Tag | Command | Attribute Code | Value | Line\_Feed |
| --- | --- | --- | --- | --- |
| Â SESSION | Â set | Â Verbose | Â false | Â LF |

Â Â

Â Â

Â Â
