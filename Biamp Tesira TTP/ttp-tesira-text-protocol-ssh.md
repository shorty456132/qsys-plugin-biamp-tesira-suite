# SSH

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Tesira_Text_Protocol/SSH.htm

Tesira Software Help

[Click here to see this page in full context](#)

# SSH

Secure Shell (SSH) is configured by specifying the IP address of the Tesira Server and connecting via port 22. The ability for Tesira Server, Server IO, Tesira Amplifiers or TesiraFORTÃ devices to use SSH can be enabled or disabled via aÂ DEVICE TTP commandÂ or in theÂ [Device MaintenanceÂ Network Settings](../../Tabs/System/Device_Maintenance/Device_Maintenance_Network_Settings.htm)Â dialog.Â

When controlling multiple Tesira units that are not part of the same TMF file, each Tesira server unit will need to be addressed via its own SSH Session.Â

Commands sent via SSH are encrypted.Â

Opening a SSH session to a TesiraÂ Server results in a login prompt.Â Valid credentials must be provided to access the system in any way.Â One must be logged in as controller or higher level to make any changes to the system, while an observer can only query the system for levels and other current parameters.Â

The SSH Login requires case sensitive User and Password authentication. In an unprotected system, the Username isÂ defaultÂ and Password is not required.Â In a protected system, the credentials configured in the system must be provided.Â

The number of SSH sessions is limited to 80 connections per Tesira. Once 64 sessions have been established, new sessions will begin failing to connect based on a planned percentage failure basis. Once all 80 sessions are reached, all further connections will be refused. This is a mechanism of SSH's design to reduce the likelihood and effect of a DDOS attack.Â

Â Â

Â Â

## SSH Login Banner

A customized SSH login banner can be defined by selecting the background of theÂ [System View](../../Tabs/View/Show/System_View.htm). Then, in the [Properties](../../Tabs/View/Show/Properties.htm), 'Partition 0' will be shown with an option to define the SSH Login Banner line item. When selected, a text box appears allowing message customization.Â 

Â

Note: Properties menus are docking menus. See the [Docking Menus](../../Software_Tools/Menus/Menu_Navigation.htm#Docking_Menus) section of the Menu Navigation page for additional details.Â

Â Â

Banner:

Â

Â Â

Â Â
