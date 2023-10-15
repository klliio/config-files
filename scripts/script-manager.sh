#!/bin/bash

cmd=$(ls -p ~/.config/scripts/ | grep -v / | rofi -dmenu -p "Enter a script")

if [ "$cmd" != "" ] ; then
	eval "alacritty -e nvim ~/.config/scripts/$cmd"
else
	exit 1
fi
