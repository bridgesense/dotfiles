#!/bin/bash
# #---Starting External Scripts---# #
# Status bar
bash ~/.config/scripts/dwm-statusbar.sh &
# Starts dunst for notifications:
dunst &
# Xbanish makes the mouse invisible after a brief period
xbanish &
# simple lockout screen that leaves the machine running
xautolock -time 10 -locker "bash ~/.config/scripts/screen-saver.sh" &
# blue-light adaptation
redshift-gtk &
# unmute microphone
amixer set Capture cap
# turn on flameshot
flameshot &
# Composite manager (always load last)
xcompmgr -c -f -n &
# #---Screen/Monitor Setup---# #
# repaints backgrounds
bash ~/.config/scripts/screen-init.sh
