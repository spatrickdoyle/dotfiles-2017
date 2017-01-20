#!/usr/bin/env bash


#DATE TIME BRIGHTNESS NETWORK BATTERY DESKTOPS VOLUME SETTINGS TERMINAL FIREFOX


echo "%{+u +o U#d9af4a}"

while :; do

	DATE_STR=$(date +"%A, %B %e, %Y")
	time_str=$(date +"%I:%M %p")
	if [ ${time_str:0:1} = 0 ]; then
		time_str=${time_str:1}
	fi

	echo -e "%{-u -o l B#00000000} %{T3}%{B#ffd9af4a +u +o}.%{B#272822 T1}" \
		 "%{O7}"${DATE_STR} \
		 "%{O30}%{A5:amixer sset 'Master' 10%+;:}%{A4:amixer sset 'Master' 10%-;:}\uf028 "$($HOME/.config/i3/blocks/volume)"%{A}%{A}" \
		 "%{O25}%{A5:$HOME/.config/i3/brightness_up.sh:}%{A4:$HOME/.config/i3/brightness_down.sh:}\uf185 "$($HOME/.config/i3/blocks/brightnessslider)"%{A}%{A}%{O400}" \
		 "%{c O300}"$($HOME/.config/i3/blocks/network)"%{O300}" \
		 "%{r O300}\uf017 "${time_str} \
		 "%{O25}"$($HOME/.config/i3/desktops.sh)"%{F#ffffff O20}" \
		 "%{O5}%{A:firefox&:}\uf269%{A}" \
		 "%{O5}%{A:terminator&:}\uf120%{A}" \
		 "%{O5}%{A:nautilus --no-desktop&:}\uf07b%{A}" \
		 "%{O5}%{A:cinnamon-settings&:}\uf013%{A}" \
		 "%{O10}%{B#ffd9af4a -u -o T3}.%{B#00000000 T1} %{F#ffffff}"

	LID_STATE=$(cat /proc/acpi/button/lid/LID0/state | sed 's/state: *//')
	if [ $LID_STATE = "closed" ]; then
		systemctl suspend
	fi

	sleep 0.2

done
