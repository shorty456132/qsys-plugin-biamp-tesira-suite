# TTP Troubleshooting

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Troubleshooting.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Troubleshooting

Brief overview of Tesira Text Protocol troubleshooting steps.Â

Â Â

Â Â

## Configuring a PC to connect to Tesira

Connecting a PC to a Tesira System to troubleshoot may be required. Using a PC allows testing of the strings and responses in real time to prove valid commands are being used. A terminal Emulator program is recommended to connect to the system. Suggested programs include TerraTerm or PuTTY.Â

Putty is used throughout this document in any examples given this allows connections usingÂ RS-232,Â TelnetÂ orÂ SSH.Â

If usingÂ TelnetÂ orÂ SSH, ensure these services are enabled inÂ [Device MaintenanceÂ](../../Tabs/System/Device_Maintenance/Device_Maintenance_Network_Settings.htm)[Network Settings](../../Tabs/System/Device_Maintenance/Device_Maintenance_Network_Settings.htm)Â or via theÂ DeviceÂ TTP command.Â

Opening aÂ TelnetÂ orÂ SSHÂ session to a Tesira Server results in a login prompt.Â Valid credentials must be provided to access the system in any way.Â One must be logged in as controller or higher level to make any changes to the system, while an observer can only query the system for levels and other current parameters.Â

The SSH Login requires case sensitive User and Password authentication. In an unprotected system, the Username and Password are âdefaultâ and âdefaultâ respectively.Â In a protected system, the credentials configured in the system must be provided.Â

PuTTY is a free implementation of Telnet and SSH for Windows and Unix platforms, along with an xterm terminal emulator. This software can be downloaded from the following link:Â [http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)Â

Instructions on its use can be found here:Â [http://www.chiark.greenend.org.uk/~sgtatham/putty/docs.html](https://www.chiark.greenend.org.uk/~sgtatham/putty/docs.html)Â

Â

Â Â

Â Â

## Configuring a PC to connect to Tesira using Telnet

If you require a secure method to connect to a Tesira Server, please refer toÂ connecting via SSH.Â

The use of a terminal emulation program such as PuTTY is recommended in order to establish a command session to a Tesira Server.Â

If the convenience of using the Windows command prompt to initiate a Telnet session is required, you can use Windows Programs and Features to enable the Telnet Client.Â

* To enable Telnet navigate to:Â Start > Control Panel > Programs & Features > Turn Windows Features on and offÂ
* Find the entry forÂ Telnet ClientÂ
* Select the tick boxÂ
* SelectÂ OKÂ
* To Initiate a TELNET session with a Tesira Server:Â
* SelectÂ Start>programs>accessories> Command PromptÂ
* At the command prompt typeÂ telnet xxx.xxx.xxx.xxxÂ (xxx.xxx.xxx.xxx is the IP address of the Tesira Server.)Â

Â

Â Â

Tesira Text Protocol will provide user feedback if a command is incorrect. The response will vary depending on the command, please review theÂ ResponsesÂ section for more details.Â 

Â Â

Â Â

Â Â
