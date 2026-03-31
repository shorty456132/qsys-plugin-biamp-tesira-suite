# VoIP / VoIP X Transfer

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Comms/VoIP_VoIP_X_Transfer.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# VoIP VoIP X Transfer

Â Â

Â Â

## Call Transfer Process

There are a number of supported workflows as part of transferring a call using third party control. The method used is dependent on external factors such as the phone system used. Below, the three different processes are defined. The method chosen would depend on the unique project requirements and functions of the phone system being used and its supported functions.Â

The 'transfer' function can be used for the default type of transfer when it has been defined in the Tesira software. The other two methods, the 'featureKey Blind' or 'featureKey Consultative' methods can be used as an 'on-the-fly' method of initiating a transfer.Â

Â Â

### Transfer

This function is a dedicated function for initiating the default type of call transfer. The transfer behavior is defined in theÂ [VoIP Line Properties](../../../Tabs/Audio_Objects/Comms/VoIP_Phone/VoIP_Line_Properties.htm)Â block properties configured as part of the Tesira design file configuration. For some proxies, the default behavior is a 'blind transfer' for others it is a 'consultative transfer'. The control developers will need to know what kind of call transfer method is used then this should be configured in the Line properties > General Tab > Consultative Transfer setting.Â 

#### Example - To Transfer to Extension 9175

VoIPControlStatus1 transfer 1 1  
+OK

VoIPControlStatus1 dial 1 2 9175  
+OK

Â Â

### Blind Transfer

The function:Â **featureKey 1 1 FEATURE\_KEY\_BLIND\_TRANSFER**, opens a new call appearance and allows the number to be transferred to be entered. The process operates the same as off-hook dialing.Â

Once the transfer target answers the call, a manual confirmation of the transfer can be specified, alternatively, the transfer will complete itself after a timeout period (default 10 seconds)Â

To confirm the transfer, the feature key function with the new line instance is specified:Â **featureKey 1 2 FEATURE\_KEY\_BLIND\_TRANSFER**.Â

If the transfer does not complete, the original call instance will remain on hold. This will need to be restored manually.Â

#### Example - To Transfer to Extension 9175

VoIPControlStatus1 featureKey 1 1 FEATURE\_KEY\_BLIND\_TRANSFER

+OK

VoIPControlStatus1 dial 1 2 9175  
+OK

VoIPControlStatus1 featureKey 1 2 FEATURE\_KEY\_BLIND\_TRANSFER  
+OK

Â Â

### Consultative Transfer

The function:Â **featureKey 1 1 FEATURE\_KEY\_CONSULTATIVE\_TRANSFERÂ opens**Â a new call appearance and allows the number to be transferred to be entered. The process operates the same as off-hook dialing.

Once the transfer target answers the call, a manual confirmation of the transfer must be specified. To confirm the transfer, the feature key function with the new line instance is specified byÂ **featureKey 1 2 FEATURE\_KEY\_CONSULTATIVE\_TRANSFER**.Â

#### Example - To Transfer to Extension 9175

VoIPControlStatus1 featureKey 1 1 FEATURE\_KEY\_CONSULTATIVE\_TRANSFER  
+OK

VoIPControlStatus1 dial 1 2 9175  
+OK

VoIPControlStatus1 featureKey 1 2 FEATURE\_KEY\_CONSULTATIVE\_TRANSFER  
+OK

For a consultative transfer, the function featureKey (1, 1, FEATURE\_KEY\_CONSULTATIVE\_TRANSFER) can be used to initiate a new call appearance. The number will be required to be inputted. This process looks like off-hook dialing. The original call is on hold and a new call is placed. Once the transfer target answers the call and would like to accept the transferred call, this function must be called again to complete the call transfer. In case of the failure, the original call is on hold and the call will be required to be restored manually.

Â Â

Â Â

Â Â
