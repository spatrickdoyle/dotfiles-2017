#!/usr/bin/env bash

DESKTOPS=("")
declare -i d
d=0
DESKTOP_IND=("\uf068" "\uf068" "\uf068" "\uf068" "\uf068" "\uf068" "\uf068" "\uf068" "\uf068" "\uf068")

DESKTOP=$(i3-msg -t get_workspaces|sed 's/.."num":[0-9],"name":"//g; s/","visible":/,/g; s/"focused"://g; s/"rect":{"x"://g; s/"y"://g; s/"width"://g; s/"height"://g; s/},"output":"/,/g; s/","urgent":false}/$/g; s/$]//')

for (( i=0; i<${#DESKTOP}; i++ )); do
	if [ "${DESKTOP:$i:1}" = "$" ]; then
		d+=1
		DESKTOPS[d]=""
	else
		DESKTOPS[d]+="${DESKTOP:$i:1}"
	fi
done

for i in ${DESKTOPS[*]}; do
	MONITOR=$(echo $i|sed 's/.,.\{4,5\},.\{4,5\},\([0-9]*,\)\{4\}//')
	FOCUSED=$(echo $i|sed 's/.,.\{4,5\},//; s/,\([0-9]*,\)\{4\}.*//')

	((INDEX=${i:0:1}-1))

	if [ $MONITOR = "HDMI-1" ]; then
		DESKTOP_IND[$INDEX]="%{T2}\uf146%{T1}"
	elif [ $MONITOR = "eDP-1" ]; then
		DESKTOP_IND[$INDEX]="%{T2}\uf067%{T1}"
	fi
	if [ $FOCUSED == "true" ]; then
		DESKTOP_IND[$INDEX]="\uf0c8"
	fi
done

BATTERY=$(acpi|sed 's/Battery [0-9]: //; s/%.*//; s/ //;')
BATTERY_IND=$(echo $BATTERY|sed 's/,.*//')
if [ $BATTERY_IND = "Discharging" ]; then
	color="ffffff"
fi
if [ $BATTERY_IND = "Unknown" ]; then
	color="ffffff"
fi
if [ $BATTERY_IND = "Charging" ]; then
	color="d9af4a"
fi
if [ $BATTERY_IND = "Full" ]; then
	color="ffffff"
	POWER=10
else
	POWER=$(echo $BATTERY|sed 's/.*,//')
	((POWER=$POWER/10))
fi

DESKTOP_IND[0]="%{F#"$color"}"${DESKTOP_IND[0]}
DESKTOP_IND[POWER]="%{F#777777}"${DESKTOP_IND[POWER]}
echo -e ${DESKTOP_IND[0]}${DESKTOP_IND[1]}${DESKTOP_IND[2]}${DESKTOP_IND[3]}${DESKTOP_IND[4]}${DESKTOP_IND[5]}${DESKTOP_IND[6]}${DESKTOP_IND[7]}${DESKTOP_IND[8]}${DESKTOP_IND[9]}
