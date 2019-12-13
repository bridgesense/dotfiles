#!/bin/bash

if nmcli radio wifi | grep -q "disabled" ; then
    nmcli radio wifi on
    notify-send -i network-wireless-full "Wireless enabled" "Your wireless adaptor has been enabled."
else
    nmcli radio wifi off
    notify-send -i network-wireless-disconnected "Wireless disabled" "Your wireless adaptor has been disabled."
fi
