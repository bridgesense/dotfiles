#!/bin/bash
bash -c "~/.screenlayout/default.sh"
xrandr --auto
xrandr --output DP2-2 --primary --left-of eDP1
feh --randomize --bg-scale ~/Nextcloud/backgrounds/*
setxkbmap -option caps:swapescape
echo -e "connect A4:E9:75:F0:EF:87 \nquit" | bluetoothctl
