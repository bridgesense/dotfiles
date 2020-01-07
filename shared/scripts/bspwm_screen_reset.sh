#!/bin/bash
# handle screen changes
# removes polybar for reconfiguration
pkill -f polybar
# reset monitor evaluations
xrandr --auto
# resets instances of bspc monitor screens
# this is mainly for swtiching from laptop to docking station
bspcm=(`bspc query --monitors --names | xargs -l`)
bspmd=(`bspc query --desktops --names | xargs -l`)

# primary monitor preference
primary="DP2-2"
monitor=(`xrandr --listactivemonitors | xargs -l | grep -oE '[^ ]+$'`)
if [ ${monitor[0]} -eq 1 ]; then
    xrandr --output ${monitor[1]} --primary
    if [ ${#bspmd[@]} -gt 0 ]; then
        bspc desktop 1 -m ${monitor[1]}
        bspc desktop 2 -m ${monitor[1]}
        bspc desktop 3 -m ${monitor[1]}
        bspc desktop 4 -m ${monitor[1]}
        bspc desktop 5 -m ${monitor[1]}
        bspc desktop 6 -m ${monitor[1]}
        bspc desktop 7 -m ${monitor[1]}
        bspc desktop 8 -m ${monitor[1]}
        bspc desktop 9 -m ${monitor[1]}
        bspc desktop 10 -m ${monitor[1]}
    else
        bspc monitor ${monitor[1]} -d 1 2 3 4 5 6 7 8 9 10
    fi
    
    sleep 1.5s
    export MONITOR=${monitor[1]} && polybar primary &
else
    if [ ${monitor[2]} == $primary ]; then
        secondary=${monitor[1]}
    else 
        primary=${monitor[1]}
        secondary=${monitor[2]}
    fi
    xrandr --output $primary --primary --left-of $secondary
    if [ ${#bspmd[@]} -gt 0 ]; then
        bspc desktop 1 -m $primary 
        bspc desktop 2 -m $primary 
        bspc desktop 3 -m $primary
        bspc desktop 4 -m $primary
        bspc desktop 5 -m $primary 
        bspc desktop 6 -m $primary
        bspc desktop 7 -m $primary
        bspc desktop 8 -m $primary
        bspc desktop 9 -m $secondary
        bspc desktop 10 -m $secondary
    else
        bspc monitor $primary -d 1 2 3 4 5 6 7 8    
        bspc monitor $secondary -d 9 10
    fi

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
