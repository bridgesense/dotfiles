#!/bin/bash
$SHELL -c `if zenity --question --text="Are you sure you want to power down?"; then systemctl poweroff; fi`
