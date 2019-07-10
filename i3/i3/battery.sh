#!/bin/bash
# crontab -e
# include the following line
# */15 * * * * /bin/bash /home/francis/.config/i3/battery.sh >/dev/null 2>&1

BATTINFO=`acpi -b | head -n 1`

if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:30:00 ]] ;
then
    DISPLAY=:0.0 /usr/bin/notify-send "low battery" "$BATTINFO"
fi
