#!/bin/bash
bash -c "~/.screenlayout/default.sh"
xrandr --auto
xrandr --output DP2-2 --primary --left-of eDP1
feh --randomize --bg-scale ~/Nextcloud/backgrounds/*
