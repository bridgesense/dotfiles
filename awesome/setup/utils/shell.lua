local awful = require("awful")

local shell = {}

function shell.screenInit()
    awful.spawn.with_shell("setxkbmap -option caps:swapescape")
    -- connects blutooth device
    awful.spawn.with_shell("echo -e \"connect A4:E9:75:F0:EF:87 \nquit\" | bluetoothctl") 
    -- handle monitor changes
    awful.spawn.with_shell("autorandr --change")
    -- repaint backgrounds
    awful.spawn.with_shell("feh --randomize --bg-scale " .. os.getenv("HOME") .. "/Nextcloud/backgrounds/*")

end

function shell.startupAwesome()
     -- blank out screen during startup 
     awful.spawn("xset dpms force off")
     -- xbanish makes the mouse invisible after keyboard interaction
     awful.spawn.with_shell("xbanish")
      -- blue-light adaptation
     awful.spawn.with_shell("redshift-gtk")
     -- sound setup
     awful.spawn("pacmd \"load-module module-switch-on-connect\"")
     -- unmute microphone
     awful.spawn("amixer set Capture cap")
     -- turn on flameshot
     awful.spawn.with_shell("flameshot")
     -- device discoverability
     awful.spawn("rfkill unblock 0 && pactl load-module module-bluetooth-discover")
     -- screen locker
     awful.spawn.with_shell("xautolock -time 10 -locker \"i3lock -c 1d2021\" -resetsaver")
     -- composite manager 
     awful.spawn.with_shell("compton --backend glx --vsync none")
end

return shell
