#!/bin/bash

if xset q | grep -q "timeout:  0" ; then
    xautolock -enable
    xset s on
    notify-send -i network-wireless-full "Movie Mode OFF" "The Screen Lock and Saver have been enabled."
else
    xautolock -disable
    xset s off
    notify-send -i network-wireless-disconnected "Movie Mode ON" "The Screen Lock and Saver have been disabled."
fi
