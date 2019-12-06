#/bin/bash
pkill -f pulseaudio
sleep 1
pulseaudio -D
