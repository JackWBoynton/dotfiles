-- include our modules
require "app_watcher"
require "app_jump_menu"
local wifi = require "wifi_watcher"
require "auto_reloader"
local winmod = require "window_controls"

-- settings
hs.window.animationDuration = 0

-- recognize our home networks so we can take action on connection to "foreign" networks
wifi.homeSSIDs = {"reddragon-5G", "reddragon-2G"}

-- auto-connect to Tunnelblick VPNs when connected to these networks
wifi.autoConnectVPNs = {
    ["BREW BROS"] = "home-joeym-net (all traffic)",
    ["#SFWiFi"] = "home-joeym-net (all traffic)",
    ["the brew"] = "home-joeym-net (all traffic)",
    ["LIQUIDGOLD_PUBLIC"] = "home-joeym-net (all traffic)",
    ["Pantheon"] = "home-joeym-net",
    ["Pantheon-5G"] = "home-joeym-net",
    ["Pantheon-5G"] = "home-joeym-net",
    ["Pantheon-5G-802.11r"] = "home-joeym-net",
}

-- global key binds
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "F",     winmod.toggleMaximized)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Left",  winmod.currentWindowToLeftHalf)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Right", winmod.currentWindowToRightHalf)

-- @TODO: move the top level modal keybind from app_jump_menu into here somehow

-- ready!
hs.notify.new( {title='Hammerspoon', subTitle='Configuration loaded successfully'} ):send()