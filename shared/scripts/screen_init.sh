#!/bin/bash
# handle screen changes
DEFAULT_LAYOUT="~/.screenlayout/default.sh"
if [[ -f "$DEFAULT_LAYOUT" ]]; then
    bash -c "$DEFAULT_LAYOUT"
else
    monitor=(`xrandr --listmonitors | xargs -l | grep -oE '[^ ]+$'`)
    if [ ${monitor[0]} == "1" ]; then
        xrandr --output ${monitor[1]} --primary
    else
        xrandr --output ${monitor[1]} --primary --left-of ${monitor[2]} 
    fi
fi

# repaints backgrounds 
feh --randomize --bg-scale ~/Nextcloud/backgrounds/*
# This swaps Esc and Caps Lock Keys
setxkbmap -option caps:swapescape
# this example connects a bluetooth device
echo -e "connect A4:E9:75:F0:EF:87 \nquit" | bluetoothctl
