#!/bin/bash
#
# ~/Scripts/statusbar
#
# Status bar for dwm. Expanded from:
# https://bitbucket.org/jasonwryan/eeepc/src/73dadb289dead8ef17ef29a9315ba8f1706927cb/Scripts/dwm-status

# Icon glyphs from font xbmicons.pcf
sep_solid=""
sep_line=""
sep_bar="|"

dwm_alsa () {
    active_sink=$(pacmd list-sinks | awk '/* index:/{print $3}')
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    curStatus=$(pacmd list-sinks | grep -A 15 "index: $active_sink$" | awk '/muted/{ print $2}')

    printf "\x02%s " "$sep_line"
    if [ "${curStatus}" = 'yes' ]; then
        printf "\x04🔇 0%% \n"
    elif [ "$VOL" -eq 0 ]; then
        printf "\x04🔇 0%% \n"
    elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
        printf "🔈 %s%% \n" "$VOL"
    elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
        printf "🔉 %s%% \n" "$VOL"
    else
        printf "🔊 %s%% \n" "$VOL"
    fi
}

dwm_backlight () {
    printf "\x01%s ☀ %.0f%% \n" "$sep_line" "$(xbacklight)"
}

dwm_networkmanager () {
    CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
    if [ "$CONNAME" = "" ]; then
        CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
    fi

    TRANSMIT1=0
    TRANSMIT2=0
    IFACES=$(ip -o link show | awk -F': ' '{print $2}')
    for IFACE in $IFACES; do
        if [ $IFACE != "lo" ]; then
            TRANSMIT1=$(($(ip -s -c link show $IFACE | tail -n1 | cut -d " " -f5) + TRANSMIT1))
        fi
    done
    sleep 1
    IFACES=$(ip -o link show | awk -F': ' '{print $2}')
    for IFACE in $IFACES; do
        if [ $IFACE != "lo" ]; then
            TRANSMIT2=$(($(ip -s -c link show $IFACE | tail -n1 | cut -d " " -f5) + TRANSMIT2))
        fi
    done
    upspeed=$(expr $(expr $TRANSMIT2 - $TRANSMIT1) / 1000)


    RECIEVE1=0
    RECIEVE2=0
    IFACES=$(ip -o link show | awk -F': ' '{print $2}')
    for IFACE in $IFACES; do
        if [ $IFACE != "lo" ]; then
            RECIEVE1=$(($(ip -s -c link show $IFACE | tail -n3 | head -n 1 | cut -d " " -f5) + $RECIEVE1))
        fi
    done
    sleep 1
    IFACES=$(ip -o link show | awk -F': ' '{print $2}')
    for IFACE in $IFACES; do
        if [ $IFACE != "lo" ]; then
            RECIEVE2=$(($(ip -s -c link show $IFACE | tail -n3 | head -n 1 | cut -d " " -f5) + $RECIEVE2))
        fi
    done
    downspeed=$(expr $(expr $RECIEVE2 - $RECIEVE1 ) / 1000)



    #     PUBLIC=$(curl -s https://ipinfo.io/ip)

    printf "\x03%s " "$sep_line"
    printf "🌐 %s  %s kb/s %s \n" "$upspeed" "$downspeed" "$CONNAME"
}


dwm_resources () {
    # Used and total memory
    #MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    #MEMTOT=$(free -h |awk '(NR == 2) {print $2}')
    MEMFREE=$(free -h | awk '(NR == 2) {print $4}')

    #TOTAL_SIZE=$(df -ht xfs --total | tail -1 | awk {'printf $2'})
    #USED_SIZE=$(df -ht xfs --total | tail -1 | awk {'printf $3'})
    AVAILABLE=$(df -ht xfs --total | tail -1 | awk {'printf $4'})
    #PERCENTAGE=$(df -ht xfs --total | tail -1 | awk {'printf $5'})

    # CPU load
    # Get the first line with aggregate of all CPUs
    cpu_last=($(head -n1 /proc/stat))
    cpu_last_sum="${cpu_last[@]:1}"
    cpu_last_sum=$((${cpu_last_sum// /+}))

    sleep 0.05

    cpu_now=($(head -n1 /proc/stat))
    cpu_sum="${cpu_now[@]:1}"
    cpu_sum=$((${cpu_sum// /+}))

    cpu_delta=$((cpu_sum - cpu_last_sum))
    cpu_idle=$((cpu_now[4]- cpu_last[4]))
    cpu_used=$((cpu_delta - cpu_idle))
    cpu_usage=$((100 * cpu_used / cpu_delta))

    # Keep this as last for our next read
    cpu_last=("${cpu_now[@]}")
    cpu_last_sum=$cpu_sum

    # CPU temperature
    PREFIX=' '
    FIRE='\x04'
    WARNING_LEVEL=80
    # CPU_T=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon?/temp2_input)
	# CPU_TEMP=$(expr $CPU_T / 1000)
	CPU_TEMP="$(sensors | grep temp1 | awk 'NR==1{gsub("+", " "); gsub("\\..", " "); print $2}')"
	if [ "$CPU_TEMP" -ge $WARNING_LEVEL ]; then
		PREFIX="$FIRE$PREFIX"
	fi

    printf "\x02%s " "$sep_line"
    #printf "🧠 MEM %s/%s CPU %s STO %s/%s: %s \n" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
    printf "💻 %s  🧠 %s  %s%% %s°C \n" "$AVAILABLE" "$MEMFREE" "$cpu_usage" "$PREFIX$CPU_TEMP"
}


dwm_battery()
{
    # battery display
    CHARGING_ICON=' '
    WARNING_ICON=' '
    BATTERY_FULL_ICON=''
    BATTERY_2_ICON=''
    BATTERY_3_ICON=''
    BATTERY_4_ICON=''

    FULL_AT=97

    BAT_ICON=""
    ICON=""
    ICON_COLOR=1
    # The vast majority of people only use one battery.

	if [ -d /sys/class/power_supply/BAT1 ]; then
        # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
		capacity=$(cat /sys/class/power_supply/BAT1/capacity)
		charging=$(cat /sys/class/power_supply/BAT1/status)
        

		if [[ "$charging" == "Charging" ]]; then
			ICON="$CHARGING_ICON"
            ICON_COLOR=3
            bat_status=$(upower -i $(upower -e | grep BAT1) | grep -oP 'time to full:\K[^"]+')
		elif [[ $capacity -le 25 ]]; then
			ICON="$WARNING_ICON"
            ICON_COLOR=4
            bat_status=$(upower -i $(upower -e | grep BAT1) | grep -oP 'time to empty:\K[^"]+')
        else
            bat_status=$(upower -i $(upower -e | grep BAT1) | grep -oP 'time to empty:\K[^"]+')
        fi

        if [[ "$bat_status" == "" ]]; then
            bat_status=$charging;
        fi

		if [[ $capacity -ge $FULL_AT ]]; then
			BAT_ICON=$BATTERY_FULL_ICON
		elif [[ $capacity -le 25 ]]; then
			BAT_ICON=$BATTERY_4_ICON
		elif [[ $capacity -le 60 ]]; then
			BAT_ICON=$BATTERY_3_ICON
		elif [[ $capacity -le $FULL_AT ]]; then
			BAT_ICON=$BATTERY_2_ICON
		fi
    fi

    printf "\x01%s" "$sep_line"
    if [[ $ICON_COLOR == 4 ]]; then
        printf "\x04%s%s" "$BAT_ICON" "$ICON"
    elif [[ $ICON_COLOR == 3 ]]; then 
        printf "\x03%s%s" "$BAT_ICON" "$ICON" 
    else
        printf "\x01%s%s" "$BAT_ICON" "$ICON" 
    fi
    printf "\x01%s \n" "$bat_status"
}

dwm_date () {
    printf "\x02%s " "$sep_line"
    printf "%s \x01%s %s \n" "$(date "+%a %b %d, %Y")" "${sep_line}" "$(date "+%H:%M")"
}


# cpu (from: https://bbs.archlinux.org/viewtopic.php?pid=661641#p661641)

while true; do

  # Pipe to status bar, not indented due to printing extra spaces/tabs
  xsetroot -name "\
$(dwm_alsa)\
$(dwm_backlight)\
$(dwm_networkmanager)\
$(dwm_resources)\
$(dwm_battery)\
$(dwm_date)\
"

  sleep 5 
done
