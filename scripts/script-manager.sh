#!/bin/bash

script_dir="/home/klliio/.config/scripts/"
cmd=$(ls -p /home/klliio/.config/scripts/ | grep -v / | rofi -dmenu -p "Enter a script")

if [ "$cmd" != "" ] ; then
	option=$(printf "edit\nrun" | rofi -dmenu -i)

	case "$option" in
		"edit") eval "cd $script_dir ; alacritty -e nvim $script_dir$cmd" ;;
		"run") eval "$script_dir$cmd" ;;
		*) exit 1 ;;
	esac
else
	exit 1
fi
