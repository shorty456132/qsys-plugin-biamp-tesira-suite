# Device

> Source: https://tesira-software-help.biamp.com/assets/TOC/System_Control/Attribute_Tables/Service_Addresses/Device.htm

Tesira Software Help

[Click here to see this page in full context](#)

#### TTP Attribute Table |Â Generate command strings with:Â [Tesira Command String Calculator](https://support.biamp.com/Tesira/Control/Tesira_command_string_calculator)

# Device

The DEVICE Instance Tag is case sensitive and must be in capital letters. It is used to sendÂ Device ServicesÂ instructions or DeviceÂ Attributes and Commands.

Â Â

Â Â

## Device Services

The Following table summarizes DEVICE Service Codes. Due to the nature of the service being requested they do not require specific commands (get, set,Â etc)

Some service commands are specific to the connected device, such as 'reboot'. Other Service commands are design file specific, such as saving or recalling a Preset.

Each element of the command instruction is delimited by one or more spaces. The commands are case sensitive and upper and lower case characters are used.Â

**Instance\_Tag Service [Index] [Value] LFÂ**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.Â

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

The TTP string is structured in the following order:

**Instance\_Tag Service [Index] [Value] LF**

* Instance Tag:Â Is always required.Â
* Service: Is always required.Â
* [Index]: Is shown in [Brackets] as may be required depending on theÂ AttributeÂ being referenced. If not required it should not be defined. Depending on theÂ Attribute, it can be made up of one or more indexes.Â
* [Value]: Is shown in [Brackets] as may be required depending on theÂ CommandÂ orÂ AttributeÂ being referenced. If not be required it should not be defined. The Value would not normally have spaces, if it does it can be defined in "double quotes". It can also be a numerical value.Â
* **LF:**Â A Line feed or Carriage Return is used to define the end of the command.

For additional information on individual elements of a TTP string please review the [TTP Syntax](../../Tesira_Text_Protocol/TTP_Syntax.htm) page.Â

Â Â

| Service Code | Parameters |
| --- | --- |
| clearEventLogs | Â |
| clearLogs | Â |
| clearWorkplace | Â |
| defaultLogConfig | Â |
| deleteConfigData | Â |
| getLocalCopyOfFile | blockID, fileID, filePath |
| injectDanteLicenseKey | licenseCertificate, oemCertificate |
| manualFailover | uint32\_t unitId |
| reboot | Â |
| rebootERD | HostnameList hostnames, HostnameList failedDevices |
| recallPreset | PresetId id |
| recallPresetByName | presetName |
| recallPresetShowFailures | PresetId id, HostnameList failedDevices |
| resetWebServerCredentials | applicationName |
| restoreERDToFactoryDefaults | HostnameList hostnames, HostnameList failedDevices |
| savePreset | PresetId id |
| savePresetByName | presetName |
| sleep | Â |
| startAudio | Â |
| startMedia | Â |
| startPartitionAudio | PartitionID partID |
| startPartitionMedia | PartitionID partID |
| stopAudio | Â |
| stopMedia | Â |
| stopPartitionAudio | PartitionID partID |
| stopPartitionMedia | PartitionID partID |
| syncERDFirmware | HostnameList hostnames, HostnameList failedDevices |
| verifyDanteLicenseKey | bool valid |
| wake | Â |

Â Â

### Examples

Reboot the connected device. Result: DEVICE reboot

| Instance Tag | Service |
| --- | --- |
| Â DEVICE | Â reboot |

Â Â

Start audio on a device. Result: DEVICE startAudio

| Instance Tag | Service |
| --- | --- |
| Â DEVICE | Â startAudio |

Â Â

Reboot multiple expander devices. Result:Â

* If all expander are discoverable and accept the reboot command:Â +OK "failedDevices":[ ]
* If all but the EX-IN expander are discoverable and accept the reboot command:Â +OK "failedDevices":["EX-IN-0001"]Â

| Instance Tag | Service |
| --- | --- |
| Â DEVICE | Â rebootERD ["EX-OUT-0000", "EX-IN-0001", EX-AEC-0001] |

Â Â

Â Â

## Device Attributes and Commands

Additionally there are a number of DEVICE Instance Tag command Attributes. These would reference the device that has the current active Serial, SSH or TELNET session.

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

| Attribute | Attribute Code | Command | Indexes | Value Range |
| --- | --- | --- | --- | --- |
| Active Faults | activeFaultList | get | Â | Â |
| AVB Peer Delay Threshold | avbPDelayThreshold | get / set / increment /Â decrement | Â | 0 - 2147483647 |
| Block Introspection | blockInfo | get | Â | The returned information is variable and dependent on the specific block being queried. For example, channelInfo may be absent for special blocks or contain numChannels (0 if unconfigured), numAVChannels (TesiraLUX I/O only), or numInputs / numOutputs. |
| Change client log level | clientLogLevel | get / set | log client name | none, emergency, critical, error, warning, notice, info, debug |
| Retrieve Dante information | danteInfo | get | Â | Â |
| Retrieve device information | deviceInfo | get | Â | Â |
| Discovered Servers | discoveredServers | get | Â | Â |
| DNS Config | dnsConfig | get / set | Â | Â |
| DNS Status | dnsStatus | get | Â | Â |
| Disable/Enable duplicate suppression on engineering log | enableDuplicateSuppression | get / set / toggle | Â | false, true |
| Remote Device AVB Peer Delay Threshold | ERDavbPDelayThreshold | get / set / increment /Â decrement | hostname | 0 - 2147483647 |
| Change facility log level | facilityLogLevel | get / set | log facility name | none, emergency, critical, error, warning, notice, info, debug |
| Host Name | hostname | get / set | Â | Â |
| Resolver Hosts Table | hostTable | get / set | Â | Â |
| HTTPS should be enabled | httpsEnabled | get / set / toggle | Â | false, true |
| IGMP should be enabled | igmpEnabled | get / set / toggle | Â | false, true |
| Network Interface Config | ipConfig | get / set | interface name | control |
| Network Interface Status | ipStatus | get | interface name | control |
| Known Redundant Device States | knownRedundantDeviceStates | get / subscribe / unsubscribe | Â | Â |
| mDNS Enabled | mDNSEnabled | get / set / toggle | Â | false, true |
| Retrieve MSRP Information | msrpInfo | get | Â | Â |
| Retrieve Network Port Information | networkPortInfo | get | Â | Â |
| Network Port Mode | networkPortMode | get / set | Â | PORT\_MODE\_SEPARATE, PORT\_MODE\_REDUNDANT, PORT\_MODE\_DAISY\_CHAIN |
| Network Status | networkStatus | get | Â | Â |
| Disable/Enable POE on a port | poeEnabled | get / set / toggle | port name | false, true |
| Retrieve POE Information | poeInfo | get | Â | Â |
| Product Revision | productRevision | get | Â | Â |
| Retrieve gPTP Information | ptpInfo | get | Â | Â |
| RSTP should be enabled | rstpEnabled | get / set / toggle | Â | false, true |
| Serial Number | serialNumber | get | Â | Â |
| ssh should be disabled | sshDisabled | get / set / toggle | Â | false, true |
| telnet should be disabled | telnetDisabled | get / set / toggle | Â | false, true |
| Firmware Version | version | get | Â | Â |
| VoIP2 Network Status | VoIP2NetworkStatus | get | card slot, (unused) | Â |

\*Note:Â Attempting to modify the Host Name via this command will result in an error message if the system is currently configured. A reset of the device is required to make changes to the Host Name first (DEVICE deleteConfigDataÂ command or aÂ Reset DeviceÂ viaÂ Device Maintenance). In the scenario where a system is configured and is Reset to change the Host Name, theÂ Equipment TableÂ will need to be re-opened and updated to reflect the new details, and the configuration re-sent to the system.

Â Â

| Instance Tag | Command | Attribute Code |
| --- | --- | --- |
| Â DEVICE | Â get | Â serialNumber |

#### Example

DEVICE get serialNumber Â  +OK "value":"01842224"Â 

Â Â

#### Example

DEVICE get networkStatus Â  +OK "value":{"schemaVersion":2 "hostname":"TesiraServer91" "defaultGatewayStatus":"0.0.0.0" "networkInterfaceStatusWithName":[{"interfaceId":"control" "networkInterfaceStatus":{"macAddress":"00:90:5e:13:3b:27" "linkStatus":LINK\_1\_GB "addressSource":STATIC "ip":"10.30.150.62" "netmask":"255.255.0.0" "dhcpLeaseObtainedDate":"" "dhcpLeaseExpiresDate":"" "gateway":"0.0.0.0"}}] "dnsStatus":{"primaryDNSServer":"0.0.0.0" "secondaryDNSServer":"0.0.0.0" "domainName":""} "mDNSEnabled":true" telnetDisabled":false}Â 

Â Â

Â Â

## ipConfig Commands

The ipConfig command can set the DHCP state, IP address, Subnet mask and Gateway on a Tesira Server, Server IO and TesiraFORTÃ device. Only values that need to be changed are required to be specified.

To get the IP configuration of a device:

| Instance Tag | Command | Attribute Code | Index |
| --- | --- | --- | --- |
| Â DEVICE | Â get | Â ipConfig | Â control |

Â Â

#### Example

DEVICE get ipConfig control +OK "value":{"autoIPEnabled":true "ip":"" "netmask":"" "gateway":""}

Â Â

#### Example - Set a device to not use DHCP and with an IP address of 192.168.1.210, a subnet of 255.255.255.0 and no gateway

DEVICE set ipConfig control {"autoIPEnabled":false "ip":"192.168.1.210" "netmask":"255.255.255.0" "gateway":"0.0.0.0"}

Â Â

#### Example - Set a device that is using a fixed IP address to use DHCP

DEVICE set ipConfig control {"autoIPEnabled":true }

Â Â

#### Example - Change a device IP address to a new address in the same subnet (this example moves a device from 192.168.1.210 to 192.168.1.110)Â

DEVICE set ipConfig control { "ip":"192.168.1.110" }

Â Â

#### Example - Retrieve port status information for all ports

DEVICE get networkPortInfo

Â +OK "networkPortInfo":[{"name":"P5" "linkUp":true "speed":1000 "statistics":[{"t":RX\_PACKETS "v":2129} {"t":TX\_PACKETS "v":1922} {"t":RX\_MULTICAST\_PACKETS "v":18101} {"t":TX\_MULTICAST\_PACKETS "v":9549} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":1} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[{"t":LLDP\_HOSTNAME "v":"ICX6450-48P Switch"} {"t":LLDP\_PORTNAME "v":"P5"}] "portRole":PORT\_ROLE\_DANTE\_ONLY} {"name":"P4" "linkUp":true "speed":100 "statistics":[{"t":RX\_PACKETS "v":524} {"t":TX\_PACKETS "v":528} {"t":RX\_MULTICAST\_PACKETS "v":1029} {"t":TX\_MULTICAST\_PACKETS "v":25477} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":1} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[] "portRole":PORT\_ROLE\_DANTE\_ONLY} {"name":"P3" "linkUp":true "speed":100 "statistics":[{"t":RX\_PACKETS "v":473} {"t":TX\_PACKETS "v":502} {"t":RX\_MULTICAST\_PACKETS "v":1020} {"t":TX\_MULTICAST\_PACKETS "v":25486} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":1} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[] "portRole":PORT\_ROLE\_DANTE\_ONLY} {"name":"P2" "linkUp":false "speed":0 "statistics":[{"t":RX\_PACKETS "v":0} {"t":TX\_PACKETS "v":0} {"t":RX\_MULTICAST\_PACKETS "v":0} {"t":TX\_MULTICAST\_PACKETS "v":0} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":0} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[] "portRole":PORT\_ROLE\_DANTE\_ONLY} {"name":"P1" "linkUp":true "speed":1000 "statistics":[{"t":RX\_PACKETS "v":490} {"t":TX\_PACKETS "v":612} {"t":RX\_MULTICAST\_PACKETS "v":20761} {"t":TX\_MULTICAST\_PACKETS "v":15708} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":1} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[{"t":LLDP\_DESCRIPTION "v":"ExtremeXOS (X440-24p) version 16.2.2.4 16.2.2.4-patch1-3 by release-manager on Fri Feb 17 08:00:10 EST 2017"} {"t":LLDP\_PORTNAME "v":"P1"}] "portRole":PORT\_ROLE\_AVB\_ONLY} {"name":"control" "linkUp":true "speed":1000 "statistics":[{"t":RX\_PACKETS "v":0} {"t":TX\_PACKETS "v":13} {"t":RX\_MULTICAST\_PACKETS "v":3173} {"t":TX\_MULTICAST\_PACKETS "v":44336} {"t":RX\_BAD\_PACKETS "v":0} {"t":PORT\_UP\_COUNTER "v":0} {"t":PORT\_DOWN\_COUNTER "v":0}] "info":[] "portRole":INVALID PortRoleType}]

Â Â

#### Example - Get ptp information for all ports

DEVICE get ptpInfo

+OK "gptpInfo":[{"GMID":{"id":[120 69 1 255 254 5 86 102]} "thisSystemIsGM":false "stepsRemoved":4 "priority":{"priority1":246 "priority2":248} "neighborPropDelayThreshholdNs":1200 "portInfo":[{"name":"P5" "asCapable":false "locked":false "role":PTP\_PORT\_DISABLED "neighborPropDelayNs":0} {"name":"P4" "asCapable":false "locked":false "role":PTP\_PORT\_DISABLED "neighborPropDelayNs":0} {"name":"P3" "asCapable":false "locked":false "role":PTP\_PORT\_DISABLED "neighborPropDelayNs":0} {"name":"P2" "asCapable":false "locked":false "role":PTP\_PORT\_DISABLED "neighborPropDelayNs":0} {"name":"P1" "asCapable":true "locked":true "role":PTP\_PORT\_SLAVE "neighborPropDelayNs":555} {"name":"control" "asCapable":true "locked":true "role":PTP\_PORT\_MASTER "neighborPropDelayNs":12}]}]

Â Â

#### Example - Enable or disable POE on the specified port

DEVICE set poeEnabled "P2" true

+OK

DEVICE set poeEnabled "P2" false

+OK

DEVICE get poeEnabled "P2"

+OK "enabled":true

DEVICE get msrpInfo

+OK "msrpInfo":[{"portNames":["P5" "P4" "P3" "P2" "P1" "control"] "streamInfo":[]}]

Â Â

#### Example - Get Dante information for all ports

DEVICE get danteInfo

Â +OK "danteInfo":{"revs":{"danteAPIVersion\_major":4 "danteAPIVersion\_minor":2 "danteAPIVersion\_bugfix":2 "ubootVersion\_major":0 "ubootVersion\_minor":0 "ubootVersion\_bugfix":0 "biampVersion\_major":1 "biampVersion\_minor":3 "biampVersion\_dot":0 "biampVersion\_build":1} "netCfg":{"hostname":"TesiraConnect04067397-DAN" "primaryInterface":{"autoConfigure":true "ipAddress":"192.168.1.226" "netMask":"255.255.255.0" "DNSServer":"0.0.0.0" "defaultGateway":"192.168.1.200"} "secondaryInterface":{"autoConfigure":true "ipAddress":"192.168.1.226" "netMask":"255.255.255.0" "DNSServer":"0.0.0.0" "defaultGateway":"192.168.1.200"}} "allNetStatus":{"primaryStatus":{"macAddress":"78:45:01:07:df:7e" "linkSpeedInMbS":1000} "secondaryStatus":{"macAddress":"" "linkSpeedInMbS":0}} "preferredDanteNetworkClockSource":true "networkClockSlaveOnly":false "networkLatencyInMicroseconds":0 "chInfos":[{"name":"" "number":0 "txrx":TX "faultOnInactive":false} {"name":"" "number":1 "txrx":TX "faultOnInactive":false} {"name":"" "number":2 "txrx":TX "faultOnInactive":false} {"name":"" "number":3 "txrx":TX "faultOnInactive":false} {"name":"" "number":4 "txrx":TX "faultOnInactive":false} {"name":"" "number":5 "txrx":TX "faultOnInactive":false} {"name":"" "number":6 "txrx":TX "faultOnInactive":false} {"name":"" "number":7 "txrx":TX "faultOnInactive":false} {"name":"" "number":8 "txrx":TX "faultOnInactive":false} {"name":"" "number":9 "txrx":TX "faultOnInactive":false} {"name":"" "number":10 "txrx":TX "faultOnInactive":false} {"name":"" "number":11 "txrx":TX "faultOnInactive":false} {"name":"" "number":12 "txrx":TX "faultOnInactive":false} {"name":"" "number":13 "txrx":TX "faultOnInactive":false} {"name":"" "number":14 "txrx":TX "faultOnInactive":false} {"name":"" "number":15 "txrx":TX "faultOnInactive":false} {"name":"" "number":16 "txrx":TX "faultOnInactive":false} {"name":"" "number":17 "txrx":TX "faultOnInactive":false} {"name":"" "number":18 "txrx":TX "faultOnInactive":false} {"name":"" "number":19 "txrx":TX "faultOnInactive":false} {"name":"" "number":20 "txrx":TX "faultOnInactive":false} {"name":"" "number":21 "txrx":TX "faultOnInactive":false} {"name":"" "number":22 "txrx":TX "faultOnInactive":false} {"name":"" "number":23 "txrx":TX "faultOnInactive":false} {"name":"" "number":24 "txrx":TX "faultOnInactive":false} {"name":"" "number":25 "txrx":TX "faultOnInactive":false} {"name":"" "number":26 "txrx":TX "faultOnInactive":false} {"name":"" "number":27 "txrx":TX "faultOnInactive":false} {"name":"" "number":28 "txrx":TX "faultOnInactive":false} {"name":"" "number":29 "txrx":TX "faultOnInactive":false} {"name":"" "number":30 "txrx":TX "faultOnInactive":false} {"name":"" "number":31 "txrx":TX "faultOnInactive":false} {"name":"01" "number":0 "txrx":RX "faultOnInactive":false} {"name":"02" "number":1 "txrx":RX "faultOnInactive":false} {"name":"03" "number":2 "txrx":RX "faultOnInactive":false} {"name":"04" "number":3 "txrx":RX "faultOnInactive":false} {"name":"05" "number":4 "txrx":RX "faultOnInactive":false} {"name":"06" "number":5 "txrx":RX "faultOnInactive":false} {"name":"07" "number":6 "txrx":RX "faultOnInactive":false} {"name":"08" "number":7 "txrx":RX "faultOnInactive":false} {"name":"09" "number":8 "txrx":RX "faultOnInactive":false} {"name":"10" "number":9 "txrx":RX "faultOnInactive":false} {"name":"11" "number":10 "txrx":RX "faultOnInactive":false} {"name":"12" "number":11 "txrx":RX "faultOnInactive":false} {"name":"13" "number":12 "txrx":RX "faultOnInactive":false} {"name":"14" "number":13 "txrx":RX "faultOnInactive":false} {"name":"15" "number":14 "txrx":RX "faultOnInactive":false} {"name":"16" "number":15 "txrx":RX "faultOnInactive":false} {"name":"17" "number":16 "txrx":RX "faultOnInactive":false} {"name":"18" "number":17 "txrx":RX "faultOnInactive":false} {"name":"19" "number":18 "txrx":RX "faultOnInactive":false} {"name":"20" "number":19 "txrx":RX "faultOnInactive":false} {"name":"21" "number":20 "txrx":RX "faultOnInactive":false} {"name":"22" "number":21 "txrx":RX "faultOnInactive":false} {"name":"23" "number":22 "txrx":RX "faultOnInactive":false} {"name":"24" "number":23 "txrx":RX "faultOnInactive":false} {"name":"25" "number":24 "txrx":RX "faultOnInactive":false} {"name":"26" "number":25 "txrx":RX "faultOnInactive":false} {"name":"27" "number":26 "txrx":RX "faultOnInactive":false} {"name":"28" "number":27 "txrx":RX "faultOnInactive":false} {"name":"29" "number":28 "txrx":RX "faultOnInactive":false} {"name":"30" "number":29 "txrx":RX "faultOnInactive":false} {"name":"31" "number":30 "txrx":RX "faultOnInactive":false} {"name":"32" "number":31 "txrx":RX "faultOnInactive":false}]}

Â Â

Â Â
