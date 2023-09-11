#!/bin/bash

lock="  Lock"
poweroff=" ⏻ Power Off"
reboot="  Reboot"

uptime="`uptime -p | sed -e 's/up //g'`"
option=$(printf "$lock\n$poweroff\n$reboot" | rofi -dmenu -mesg "$uptime" -i)

case "$option" in
	"$lock") slock ;;
	"$poweroff") loginctl Poweroff ;;
	"$reboot") loginctl Reboot ;;
	*) exit 1 ;;
esac
