#!/bin/bash
# handle screen changes
bash -c "~/.screenlayout/default.sh"
xrandr --auto
xrandr --output DP2-2 --primary --left-of eDP1
# repaints backgrounds 
feh --randomize --bg-scale ~/Nextcloud/backgrounds/*
# resets top message bar
i3-msg restart
# This swaps Esc and Caps Lock Keys
setxkbmap -option caps:swapescape
# this example connects a bluetooth device
echo -e "connect A4:E9:75:F0:EF:87 \nquit" | bluetoothctl
