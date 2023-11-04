#!/bin/sh

logout="󰍃"
lock=""
poweroff="⏻"
reboot=""
sleep="󰒲"
hibernate="󰤄"
yes=""
no=""

i3lock="i3lock -c 11111b -e --force-clock  --indicator --radius 90 --ring-width 5 --date-color=cdd6f4 --time-color=cdd6f4 --time-str="%H:%M:%S" --date-str="%Y:%m:%d" --verif-color=a6e3a1 --wrong-color=f38ba8 --modif-color=f9e2af --ring-color=cdd6f4 --ringver-color=89b4fa --insidever-color=89b4fa --ringwrong-color=f38ba8 --insidewrong-color=f38ba8 --verif-text="" --wrong-text="" --lock-text="" --greeter-text="" --pass-media-keys --pass-power-keys --pass-screen-keys --pass-volume-keys --no-modkey-text"
theme="$HOME/.config/scripts/themes/powermenu.rasi"

option=$(printf "$lock\n$logout\n$poweroff\n$reboot\n$sleep\n$hibernate" | rofi -dmenu -theme $theme -i)

if [ "$option" = "" ]; then
	exit 1
fi

session_type="$XDG_SESSION_TYPE"
confirm=$(printf "$no\n$yes" | rofi -dmenu -theme-str "window {width: 140;}" -theme $theme -i)

if [ "$confirm" = "$yes" ] ; then
	case "$option" in
		"$lock") if [ "$session_type" = "wayland" ] ; then
					swaylock
				elif [ "$session_type" = "tty" ] ; then # X returns as ty
					$i3lock
				fi;;
		"$logout") loginctl terminate-session ${XDG_SESSION_ID} ;;
		"$poweroff") loginctl poweroff ;;
		"$reboot") loginctl reboot ;;
		"$sleep") loginctl suspend-then-hibernate ;;
		"$hibernate") loginctl hibernate ;;
		*) exit 1 ;;
	esac
else
	exit 1
fi
