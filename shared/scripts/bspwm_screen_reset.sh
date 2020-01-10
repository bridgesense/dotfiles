#!/bin/bash
# handle screen changes
# removes polybar for reconfiguration
killall -q polybar

# reset monitor evaluations
xrandr --auto

# primary monitor preference
primary="DP2-2"
monitor=(`bspc query -M --names | xargs -l`)
if [ ${#monitor[@]} -eq 1 ]; then
    xrandr --output ${monitor[0]} --primary
    bspc monitor ${monitor[0]} -o I II III IV V VI VII VIII IX X
    
    sleep 1.5s
    export MONITOR=${monitor[0]} && polybar primary &
else
    if [ ${monitor[1]} == $primary ]; then
        secondary=${monitor[0]}
    else 
        primary=${monitor[0]}
        secondary=${monitor[1]}
    fi
    xrandr --output $primary --primary --left-of $secondary
    bspc desktop I -m $primary 
    bspc desktop Desktop -r
    bspc monitor $primary -o I II III IV V VI VII VIII IX
    bspc monitor $secondary -o II III IV V VI VII VIII IX X

    sleep 1.5s
    export MONITOR=$primary && polybar primary &
    export MONITOR=$secondary && polybar secondary &
fi

# repaints backgrounds 
feh --randomize --bg-scale ~/Nextcloud/backgrounds/*
# This swaps Esc and Caps Lock Keys
setxkbmap -option caps:swapescape
# this example connects a bluetooth device
echo -e "connect A4:E9:75:F0:EF:87 \nquit" | bluetoothctl
