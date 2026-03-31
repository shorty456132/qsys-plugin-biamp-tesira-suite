# Telnet

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/Telnet.htm

Tesira Software Help

[Click here to see this page in full context](#)

# Telnet

Please also review theÂ Troubleshooting TTPÂ which gives information on configuring a PC to connect to a TesiraÂ system for testing purposes.Â

Telnet is configured by specifying the IP address of the Tesira Server and connecting via port 23. A maximum of 32 Telnet connections per server are supported. The ability for Tesira SERVER, SERVER I/O, Tesira Amplifiers, or TesiraFORTÃÂ devices to use Telnet can be enabled or disabled via aÂ DEVICE TTP commandÂ or in theÂ Device Maintenance SettingsÂ Network SettingsÂ dialog.Â

When controlling multiple TesiraÂ units that are not part of the same TMF file, each TesiraÂ Server unit will need to be addressed via its own Telnet Session. Commands sent via Telnet are not encrypted.Â

Â Â

### VoIP Telnet

The option to disable Telnet connections (port 23) on the VoIP enabled FORTÃ and Server devices is available from within theÂ VoIP Property Sheet.Â This is an engineering diagnostic interface only however for installations with security concerns about this port being open, it can be disabled. Also refer to theÂ VoIP Property SheetÂ to disable HTTP or HTTPs access to the VoIP management webpage.Â 

Â Â

Â Â

## Negotiation Required to Establish a Telnet Control Session

Â Â

### Session Options

Tesira implements a Telnet server on port 23. When the request from the control system to open a session is received, theÂ Tesira Telnet server attempts to negotiate the sessionâs options, following specifications described in the Telnet standard document RFC 854 as well as document RFC 855, Telnet Option Specifications.Â 

A standard Telnet client would be able to negotiate the session options without problem, but several third partyÂ controllers do not implement a Telnet client by default. Instead, they implement control over TCP/IP using whatâs commonly known as a âRAWâ connection. If the Control System does not respond to the Telnet session options negotiations, the session will not go ahead. As such, the control system will have to be programmed to negotiate the Telnet options with Tesiraâs Telnet server. Many of the available options can be useful during a control session and indeed a programmer may choose to enable some of them, but if the desire is to continue using a âRAWâ connection, the simplest way to initiate a control session is for the control system to respond with a rejection to any option negotiation request from the server.Â 

Â Â

### Negotiation

The best way to understand the Telnet options negotiation procedure is by looking at the data in Hex format. Notation will be â0xFFâ for Hex character FF.

The Telnet commands we are concerned with are always three bytes long. The first is theÂ Interpret As CommandÂ (IAC) character, and it is always 0xFF. The second character is theÂ CommandÂ and the last character is theÂ OptionÂ beingÂ negotiated.Â 

Commands can be:Â

* WILL, or 0xFBÂ
* DO, or 0xFDÂ
* DONâT, or 0xFEÂ
* WONâT, or 0xFCÂ

Negotiated options can be (but not limited to\*):Â

* Binary Transmission, 0x00Â
* Echo, 0x01Â
* Suppress Go Ahead, 0x03Â
* Status, 0x05Â
* Terminal Type, 0x18Â

\* There are many different Telnet options in existence; a list is maintained byÂ IANAÂ [http://www.iana.org/assignments/telnet-options](https://www.iana.org/assignments/telnet-options/telnet-options.xhtml)Â

The control system needs to react to any incoming string that begins with 0xFF, and decide whether the option is desiredÂ or not. If the intent is to control TesiraÂ using a ârawâ connection, all thatâs required is to always reject the option negotiation. If TesiraÂ sends a âWILLâ Command, the control system shall respond with âDONâTâ, and if TesiraÂ sends a âDOâ, the response should be âWONâTâ. The Option byte needs to be returned as received.Â 

In essence, the mechanism is as follows:Â Â

|  |  |  |  |
| --- | --- | --- | --- |
| Â When the server sendsÂ | Â 0xFF | Â WILL | Â <byte X> |
| Â The control system responds withÂ | Â 0xFF | Â DON'T | Â <byte X> |
| Â When the server sendsÂ | Â 0xFF | Â WILL | Â <byte X> |
| Â The control system responds withÂ | Â 0xFF | Â DON'T | Â <byte X> |

Â Â

### Examples

| Source | IAC | Command | Option | Notes |
| --- | --- | --- | --- | --- |
| Â Tesira Server | Â 0xFF | Â 0xFD | Â 0x01 | Â Do Echo |
| Â Control System / Client | Â 0xFF | Â 0xFC | Â 0x01 | Â Won't Echo |

Â Â

| Source | IAC | Command | Option | Notes |
| --- | --- | --- | --- | --- |
| Â Tesira Server | Â 0xFF | Â 0xFB | Â 0x03 | Â Will Suppress Go Ahead |
| Â Control System / Client | Â 0xFF | Â 0xFE | Â 0x03 | Â Don't Suppress Go Ahead |

Â Â

Once all options are negotiated, theÂ TesiraÂ server will send the message âWelcome to the TesiraÂ Text Protocol Serverâ, preceded and followed by 0x0D and 0x0A. The control system is now free to send TTP commands.Â 

Â Â

Â Â

## Other Considerations

Please note that the Tesira server will usually end any string with either 0x0D (CR character) followed by 0x0A (LFÂ character), but as per Telnet RCF it may also use 0x0D (CR character) followed by 0x00 (NUL character). As such, the third party control system must be able to read one more character after it sees a 0x0D, which will always be either 0x0A or 0x00, and handle them appropriately.Â 

In addition, and while in practice most of the negotiations will always take place at the beginning of a session, Telnet allows for them to happen at any point during the session.Â

Â Â

Â Â

## Example Negotiation

Below is an example session options negotiation at the beginning of a Telnet session between TesiraÂ and a TCP Client whichÂ was programmed to reject all options offered by the server. Please note this is for illustrations purposes only and the order and quantity of options negotiated may vary depending on firmware release. Strings have been organized below for clarity; however multiple Telnet strings may arrive from the Server in one Ethernet frame. Responses can be sent one at the time, or multiple responses in a single frame. Â 

| Source | IAC | Command | Option | Notes |
| --- | --- | --- | --- | --- |
| Tesira Server | 0xFF | 0xFD | 0x18 | Do Terminal Type |
| Client | 0xFF | 0xFC | 0x18 | Won't Terminal Type |
| TesiraÂ Server | 0xFF | 0xFD | 0x20 | Do Terminal Speed |
| Client | 0xFF | 0xFC | 0x20 | Won't Terminal Speed |
| Tesira Server | 0xFF | 0xFD | 0x23 | Display Location |
| Client | 0xFF | 0xFC | 0x23 | Wonât X Display Location |
| Tesira Server | 0xFF | 0xFD | 0x27 | Do New Environment Option |
| Client | 0xFF | 0xFC | 0x27 | Won't New Environment Option |
| Tesira Server | 0xFF | 0xFD | 0x24 | Do Environment Option |
| Client | 0xFF | 0xFC | 0x24 | Won't Environment Option |
| Tesira Server | 0xFF | 0xFB | 0x03 | Will Suppress Go Ahead |
| Client | 0xFF | 0xFE | 0x03 | Donât Suppress Go Ahead |
| Tesira Server | 0xFF | 0xFD | 0x01 | Do Echo |
| Client | 0xFF | 0xFC | 0x01 | Wonât Echo |
| Tesira Server | 0xFF | 0xFD | 0x22 | Do Linemode |
| Client | 0xFF | 0xFC | 0x22 | Wonât Linemode |
| Tesira Server | 0xFF | 0xFD | 0x1F | Do Negotiate About Window Size |
| Client | 0xFF | 0xFC | 0x1F | Won't Negotiate About Window Size |
| Tesira Server | 0xFF | 0xFB | 0x05 | Will Status |
| Client | 0xFF | 0xFE | 0x05 | Don't Status |
| Tesira Server | 0xFF | 0xFD | 0x21 | Do Remote Flow Control |
| Client | 0xFF | 0xFC | 0x21 | Won't Remote Flow Control |
| Tesira Server | 0xFF | 0xFB | 0x01 | Will Echo |
| Client | 0xFF | 0xFE | 0x01 | Donât Echo |
| Tesira Server | 0xFF | 0xFD | 0x06 | Do Timing Mark |
| Client | 0xFF | 0xFC | 0x06 | Won't Timing Mark |
| Tesira Server | 0xFF | 0xFD | 0x00 | Do Binary Transmission |
| Client | 0xFF | 0xFC | 0x00 | Won't Binary Transmission |
| Tesira Server | 0xFF | 0xFB | 0x03 | Will Suppress Go Ahead |
| Client | 0xFF | 0xFE | 0x03 | Donât Suppress Go Ahead |
| Tesira Server | 0xFF | 0xFB | 0x01 | Will Echo |
| Client | 0xFF | 0xFE | 0x01 | Donât Echo |
| Tesira Server | 0xFF | 0xFD | 0x0A | Â |
| Tesira Server | 0x0D 0x0AÂ Welcome to the TesiraÂ Text Protocol Server 0x0D 0x0A | | | |

Â Â

Â Â

Â Â
