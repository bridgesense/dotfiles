#!/bin/bash

if xset q | grep -q "timeout:  0" ; then
    xautolock -enable
    xset s on
    xset +dpms
    notify-send -i "Movie Mode OFF" "The Screen Lock and Saver have been enabled."
else
    xautolock -disable
    xset s off
    xset -dpms
    notify-send -i "Movie Mode ON" "The Screen Lock and Saver have been disabled."
fi