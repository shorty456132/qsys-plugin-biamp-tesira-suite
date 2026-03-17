PluginInfo = {
  Name = "Biamp Tesira~Controller",
  Version = "1.0.0",
  BuildVersion = "1.0.0.0",
  Id = "3f7c9a12-b4e8-4d21-a953-6e1f2c8b7d04",
  Author = "Andrew Laiacano",
  Description = "Manages the SSH connection (port 22) to a Biamp Tesira server. " ..
    "Routes TTP commands and subscription push messages to/from child plugins " ..
    "using Q-SYS Notifications. All child plugins (Level, Mute, Mixer, etc.) " ..
    "communicate through this Controller. Set the System ID to a unique name " ..
    "if you have multiple Tesira systems on the same Q-SYS Core."
}
