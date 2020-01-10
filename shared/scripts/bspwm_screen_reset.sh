#!/bin/bash
# handle screen changes
# removes polybar for reconfiguration
killall -q polybar

# reset monitor evaluations
xrandr --auto

# primary monitor preference
primary="DP2-2"
monitor=(`xrandr --listactivemonitors | xargs -l | grep -oE '[^ ]+$'`)
if [ ${monitor[0]} -eq 1 ]; then
    xrandr --output ${monitor[1]} --primary
    bspc desktop I -m ${monitor[1]}
    bspc desktop II -m ${monitor[1]}
    bspc desktop III -m ${monitor[1]}
    bspc desktop IV -m ${monitor[1]}
    bspc desktop V -m ${monitor[1]}
    bspc desktop VI -m ${monitor[1]}
    bspc desktop VII -m ${monitor[1]}
    bspc desktop VIII -m ${monitor[1]}
    bspc desktop IX -m ${monitor[1]}
    bspc desktop X -m ${monitor[1]}
    bspc monitor ${monitor[1]} -o I II III IV V VI VII VIII IX X
    
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
    bspc desktop I -m $primary 
    bspc desktop II -m $primary 
    bspc desktop III -m $primary
    bspc desktop IV -m $primary
    bspc desktop V -m $primary 
    bspc desktop VI -m $primary
    bspc desktop VII -m $primary
    bspc desktop VIII -m $primary
    bspc desktop IX -m $secondary
    bspc desktop X -m $secondary
    bspc monitor $primary -o I II III IV V VI VII VIII IX X
    bspc monitor $secondary -o I II III IV V VI VII VIII IX X

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
