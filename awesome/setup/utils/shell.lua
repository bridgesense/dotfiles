local awful = require("awful")
local gears = require("gears")

local shell = {}

function shell.screenInit()
    awful.spawn("setxkbmap -option caps:swapescape")
    -- connects blutooth device
    awful.spawn.with_shell("echo -e \"connect A4:E9:75:F0:EF:87 \nquit\" | bluetoothctl") 
    -- handle monitor changes
    awful.spawn.with_shell("autorandr --change")
    -- repaint backgrounds
    awful.spawn.with_shell("sleep 2 && feh --randomize --bg-scale " .. os.getenv("HOME") .. "/Nextcloud/ultrawide/*")
end

function shell.startupAwesome()
     -- xbanish makes the mouse invisible after keyboard interaction
     awful.spawn.with_shell("bash " .. gears.filesystem.get_dir("config") .. "/scripts/startup xbanish")
      -- blue-light adaptation
     awful.spawn.with_shell("bash " .. gears.filesystem.get_dir("config") .. "/scripts/startup redshift-gtk")
     -- sound setup
     awful.spawn("pacmd \"load-module module-switch-on-connect\"")
     -- unmute microphone
     awful.spawn("amixer set Capture cap")
     -- turn on flameshot
     awful.spawn.with_shell("bash " .. gears.filesystem.get_dir("config") .. "/scripts/startup flameshot")
     -- device discoverability
     awful.spawn.with_shell("rfkill unblock 0 && pactl load-module module-bluetooth-discover")
     -- screen locker
     awful.spawn.with_shell("bash " .. gears.filesystem.get_dir("config") .. "/scripts/startup xautolock")
     -- composite manager 
     awful.spawn.with_shell("bash " .. gears.filesystem.get_dir("config") .. "/scripts/startup compton --backend glx --vsync none")
end

return shell
