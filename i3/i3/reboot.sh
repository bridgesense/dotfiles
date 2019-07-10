#!/bin/bash
$SHELL -c `if zenity --question --text="Are you sure you want to restart?"; then systemctl reboot; fi`
