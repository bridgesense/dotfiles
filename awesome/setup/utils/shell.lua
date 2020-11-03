local awful = require("awful")

local shell = {}

function shell.screenInit()
    awful.spawn("setxkbmap -option caps:swapescape")
    -- connects blutooth device
    awful.spawn.with_shell("echo -e \"connect A4:E9:75:F0:EF:87 \nquit\" | bluetoothctl") 
    -- handle monitor changes
    awful.spawn("autorandr --change")
    -- repaint backgrounds
    awful.spawn.with_shell("feh --randomize --bg-scale " .. os.getenv("HOME") .. "/Nextcloud/backgrounds/*")
end

function shell.startupAwesome()
     -- blank out screen during startup 
     awful.spawn("xset dpms force off")
     -- fix multimonitor lockup bug on wakeup
     awful.spawn("xset s off -dpms") 
     -- xbanish makes the mouse invisible after keyboard interaction
     awful.spawn.raise_or_spawn("xbanish")
      -- blue-light adaptation
     awful.spawn.raise_or_spawn("redshift-gtk")
     -- sound setup
     awful.spawn("pacmd \"load-module module-switch-on-connect\"")
     -- unmute microphone
     awful.spawn("amixer set Capture cap")
     -- turn on flameshot
     awful.spawn.raise_or_spawn("flameshot")
     -- device discoverability
     awful.spawn.with_shell("rfkill unblock 0 && pactl load-module module-bluetooth-discover")
     -- screen locker
     awful.spawn.raise_or_spawn("xautolock -time 10 -locker \"xset dpms force off && i3lock -c 1d2021\" -resetsaver")
     -- composite manager 
     awful.spawn.raise_or_spawn("compton --backend glx --vsync none")
end

return shell
