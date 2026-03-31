# RS-232

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/RS-232.htm

Tesira Software Help

[Click here to see this page in full context](#)

# RS-232

A Tesira SERVERÂ or SERVER I/OÂ has two RS-232 ports. AÂ TesiraFORTÃ, IDH-1 and OH-1 have one RS-232 port. Each Port can be configured to:Â

* Send Command Strings for controlling other devices via theÂ Command String BlockÂ
* Accept full duplex TTP commands for Third Party controlÂ
* Both of the aboveÂ
* None of the aboveÂ
* Enable Control Tunneling communications from 3rd-party control systems to a controlled end deviceÂ

Â Troubleshooting TTPÂ gives information on configuring a PC to connect to a TesiraÂ system for testing purposes.Â

The baud rate can be adjusted inÂ Device Maintenance using the Serial Port SettingsÂ dialog. Baud rate of the RS-232 port can be set to 300,1200, 2400, 4800, 9600, 19200, 38400, 57600, or 115200.Â Â

| Device | Port Name | Default Setting |
| --- | --- | --- |
| Â SERVER and SERVER I/O | Â Serial 1 | Â 9600, Command String |
| Â SERVER and SERVER I/O | Â Serial 2 | Â 115200, TTP |
| Â TesiraFORTÃ | Â RS-232 | Â 115200, Both |
| Â IDH-1 | Â RS-232 | Â 115200, Both |
| Â OH-1 | Â RS-232 | Â 115200, Both |

If multiple servers are connected together in a system then only one RS-232 port needs to be connected to a third-party control system; TTP commands are proxied via the Ethernet port to other devices in the system. In an unsecured Tesira system RS-232 connections do not require authentication.Â

If a system has security enabled the RS-232 will not require authentication until the connection is fully terminated using a 'exit' command. There will then be a requirement to authenticate at the next log on.Â Once logged in to a secured server via RS-232, this user has access until a 'exit' command is sent, even if the serial connection is removed and restored.Â Please review theÂ TTP securityÂ setting for more details.Â 

When controlling multiple TesiraÂ units that are not part of the same TMF file, each Tesira server unit will need to be addressed via its own RS-232 port. Tesira units cannot be linked together via RS-232.Â

A straight through PC Serial Cable is used to communicate from an RS-232 port on a third-party controller (or PC\*) to the RS-232 port located on the back of an Tesira Server.Â

Serial Connection

Pin #1: not usedÂ

Pin #2: Transmit data (TxD) OutputÂ

Pin #3: Receive data (RxD) OutputÂ

Pin #4: not usedÂ

Pin #5: not usedÂ

Pin #6: not usedÂ

Pin #7: not usedÂ

Pin #8: not usedÂ

Pin #9: not usedÂ

(\* A PC can send/receive TTP Strings using a terminal emulator program such as HyperTerminal or PuTTY.)Â 

Â Â

Â Â

Â Â
