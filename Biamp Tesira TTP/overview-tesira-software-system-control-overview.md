# Tesira Software System Control Overview

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Software_System_Control_Overview.htm

Tesira Software Help

[Click here to see this page in full context](#)

# Tesira Software System Control Overview

Once a system design is compiled and downloaded into Tesira Server devices, the system can be controlled in real-time via the TesiraÂ software. The extent of control can be limited with different password levels.Â 

Â Â

Â Â

## Third Party Control

After initial programming & configuration,Â Tesira systems may be controlled by RS-232 communication from third-party control systems, such as AMXÂ®or CrestronÂ®, using a Serial Control Port or Ethernet Connection.Â 

The ability for Tesira Server, Server IO, Tesira Amplifiers or TesiraFORTÃÂ devices to use Telnet or SSH can be enabled or disabled via aÂ [Device](Attribute_Tables/Service_Addresses/Device.htm) TTP commandÂ or in theÂ [Device MaintenanceÂ Network Settings](../Tabs/System/Device_Maintenance/Device_Maintenance_Network_Settings.htm)Â dialog. AÂ Tesira Text Protocol (TTP)Â is used to interface to third party controllers.Â

Â Â

Â Â

## Tesira Text Protocol (TTP)

Tesira can be controlled via the control dialog menusÂ in theÂ Tesira software, viaÂ third-partyÂ controllers or via a computer based terminal application. Supported connection methods include serialÂ RS-232Â or Ethernet. If using Ethernet aÂ TelnetÂ orÂ Secure Shell Console (SSH)Â session can be initiated.Â 

Â Â

To facilitate external control of Tesira servers BiampÂ uses TTP. This allows external control of a programmed TesiraÂ system via ASCII characters.Â

Â Â

TTP command strings allow the control ofÂ AttributesÂ orÂ Services. AnÂ AttributeÂ defines the portion of the DSP Processing block to be controlled such as a fader level, crosspoint mute, and would depend on the specific DSP processing block. AÂ ServiceÂ defines an instruction and function specific to a DSP Processing block (such as theÂ dialer blockÂ dial command), Tesira Hardware (Such as aÂ DeviceÂ Command referencing a Tesira Server) or to perform a system wide command such as recalling aÂ [Preset](../Tabs/View/Show/Preset_Manager.htm).Â

Â Â

The command is case sensitive and uses upper and lower case characters. A line feed needs to be sent after each command. See [TTP Syntax](Tesira_Text_Protocol/TTP_Syntax.htm) for additional details.Â

Â Â

TTP has built in error handling and the response will indicate the reason and location in the command where an error has been encountered. An error response will includeÂ -ERRÂ at the beginning of the response. A successful response will includeÂ +OKÂ at the beginning of the response. Review theÂ ResponsesÂ section for examples.Â

Â Â

When Online with the Tesira Software any Attribute or Service changes made via TTP will update the values in real time.Â

Â Â

When online - selecting a processing block will show theÂ Instance IDÂ in the Left hand Corner of the [Status bar](../Software_Tools/Workspaces/Status_Bar.htm).Â 

Â Â

### String Structure

The commands outlined in this manual are formatted so that any command not in square brackets must be defined as part of the command. These include theÂ Instance Tag,Â CommandÂ andÂ AttributesÂ of a command.Â

Any commands shown in square brackets (such asÂ [Index]Â andÂ [Value]Â )are dependent on the command being performed. They may not be required at all in which case no value is entered.Â

Â Â

### TTP in Multiple Device Systems

Commands that act on the entire system (For Example- start audio) are forwarded to all the devices automatically, and commands that act on a block (such as set attribute) are automatically forwarded to the device hosting the block.Â 

Â Â

### TTP Resources

To generate command strings to control TesiraÂ products a calculator is available on Cornerstone:Â [TTP Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)Â 

Â Â

Â Â

Â Â
