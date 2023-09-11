#!/bin/bash

lock="  Lock"
poweroff=" ⏻ Power Off"
reboot="  Reboot"

uptime="`uptime -p | sed -e 's/up //g'`"
option=$(printf "$lock\n$poweroff\n$reboot" | rofi -dmenu -mesg "$uptime" -i)

case "$option" in
	"$lock") i3lock -c 11111b -e --force-clock  --indicator --radius 30 --ring-width 5 --date-color=cdd6f4 --time-color=cdd6f4 --time-str="%H:%M:%S" --date-str="%Y:%m:%d" --verif-color=a6e3a1 --wrong-color=f38ba8 --modif-color=f9e2af --ring-color=cdd6f4 --ringver-color=89b4fa --insidever-color=89b4fa --ringwrong-color=f38ba8 --insidewrong-color=f38ba8 --ind-pos="h/100*4:h/100*4" --time-pos="ix+110:iy-7" --date-pos="tx:ty+16" ;;
	"$poweroff") loginctl Poweroff ;;
	"$reboot") loginctl Reboot ;;
	*) exit 1 ;;
esac
