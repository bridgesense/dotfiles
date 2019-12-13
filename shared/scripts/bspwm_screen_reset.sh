#!/bin/bash
# handle screen changes
bash -c "~/.screenlayout/default.sh"
xrandr --auto
xrandr --output DP2-2 --primary --left-of eDP1
# bsp setup
pkill -f polybar
monitor="$(bspc query --monitors --names | grep DP2-2)"
laptop="$(bspc query --monitors --names | grep eDP1)"
if [ $monitor == "DP2-2" ]; then
    bspc monitor $monitor -d 1 2 3 4 5 6 7 8    
    bspc monitor $laptop -d 9 10   
    polybar laptop &
    polybar monitor &
else
    bspc monitor $laptop -d 1 2 3 4 5 6 7 8 9 10
    polybar laptop &
fi
# repaints backgrounds 
feh --randomize --bg-scale ~/Nextcloud/backgrounds/*
# This swaps Esc and Caps Lock Keys
setxkbmap -option caps:swapescape
# this example connects a bluetooth device
echo -e "connect A4:E9:75:F0:EF:87 \nquit" | bluetoothctl
