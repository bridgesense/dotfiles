#!/bin/bash

if xinput list-props "SynPS/2 Synaptics TouchPad" | grep -n "Device Enabled \(.*\):.*1" ; then
    xinput disable "SynPS/2 Synaptics TouchPad"
    notify-send -i "Movie Mode ON" "Your laptop's touchpad has been disabled."
else
    xinput enable "SynPS/2 Synaptics TouchPad"
    notify-send -i "TouchPad Disabled" "Your laptop's touchpad has been enabled."
fi
