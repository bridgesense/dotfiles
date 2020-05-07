#!/bin/bash
# Dependency checks
if [ ! $(command -v bspc) ]; then
    echo "\"command not found: \"bspc\"" >&2
    exit 1
fi
if [ ! $(command -v urxvt) ]; then
    echo "\"command not found: \"urxvt\"" >&2
    exit 1
fi
if [ ! $(command -v pyxtrlock) ]; then
    echo "\"command not found: \"pyxtrlock\"" >&2
    exit 1
fi
if [ ! $(command -v asciiquarium) ]; then
    echo "\"command not found: \"asciiquarium\"" >&2
    exit 1
fi

# kill any current instances of screensaver
pkill -f asciiquarium

# starts screensaver on all monitors
OFFSETS=(`bspc query --monitors --names | xargs -l`)
for o in ${OFFSETS[@]}; do
    urxvt -name $o -e asciiquarium &
done

# Store the current layout and set the default one
if [ $(command -v xkblayout-state) ]; then
    CURRENT=$(xkblayout-state print %c)
    xkblayout-state set 0
fi

# Lock screen, reset monitors and kill screen saver on unlock
pyxtrlock 
bash ~/.config/scripts/bspwm-screen-reset.sh 
pkill -f asciiquarium 

# Restore kb layout
if [ $(command -v xkblayout-state) ]; then
    xkblayout-state set $CURRENT
fi

