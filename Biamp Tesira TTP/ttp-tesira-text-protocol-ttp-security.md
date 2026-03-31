# TTP Security

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/TTP_Security.htm

Tesira Software Help

[Click here to see this page in full context](#)

# TTP Security

Establishing an SSH connection to the TTP server requiresÂ login credentials by definition.Â

In a protected TesiraÂ system, the same password access levels apply to all connections to the TesiraÂ Text Protocol (TTP) Server. Please review theÂ System Security settingsÂ that can be configured on the Tesira Servers.Â

Â Â

Opening aÂ [Telnet](Telnet.htm)Â orÂ [SSH](SSH.htm)Â session to a Tesira Server results in a login prompt.Â Valid credentials must be provided to access the system in any way.Â One must be logged in as controller or higher level to make any changes to the system, while an observer can only query the system for levels and other current parameters.Â

In an unprotected system, the username and password are âdefaultâ and âdefaultâ respectively. In a protected system, the credentials configured in the system must be provided, excepting that the "default" user is downgraded to a system access level of "observer".Â

Â Â

[RS-232](RS-232.htm)Â Serial connections to the TTP servers also require authentication in protected systems.Â Making the serial connection and sending a line feed will reveal the login prompt.Â

If a system has security enabled the RS-232 will not require authentication until the connection is fully terminated using a 'exit' command. There will then be a requirement to authenticate at the next log on.Â

Â Â

Once logged in to the TTP server via RS-232, this user has access until a 'exit' command is sent, even if the serial connection is removed and restored.Â 

Â Â

Â Â

Â Â
