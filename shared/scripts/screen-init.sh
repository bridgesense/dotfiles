#!/bin/bash
# handle screen changes
DEFAULT_LAYOUT="~/.screenlayout/default.sh"
if [[ -f "$DEFAULT_LAYOUT" ]]; then
    bash -c "$DEFAULT_LAYOUT"
else
    xrandr --auto
    sleep 0.5
    mapfile -t monitor < <(xrandr -q | grep " connected ")
    if [ ${#monitor[@]} -eq 1 ]; then
        primary=(`echo ${monitor[0]} | cut -f 1 -d " "`)
        xrandr --output ${primary} --primary
    else
        # flips primary to external monitor
        if [[ "primary" == *"${monitor[0]}"* ]]; then
            primary=(`echo ${monitor[1]} | cut -f 1 -d " "`)
            secondary=(`echo ${monitor[0]} | cut -f 1 -d " "`)
        else
            primary=(`echo ${monitor[0]} | cut -f 1 -d " "`)
            secondary=(`echo ${monitor[1]} | cut -f 1 -d " "`)
        fi
        xrandr --output ${primary} --primary --right-of ${secondary} 
    fi
fi

# repaints backgrounds 
feh --randomize --bg-scale ~/Nextcloud/backgrounds/*
# This swaps Esc and Caps Lock Keys
setxkbmap -option caps:swapescape
# this example connects a bluetooth device
echo -e "connect A4:E9:75:F0:EF:87 \nquit" | bluetoothctl
