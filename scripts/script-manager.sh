#!/bin/bash

script_dir="/home/klliio/.config/scripts/"
cmd=$(ls -p /home/klliio/.config/scripts/ | grep -v / | rofi -dmenu -p "Enter a script")

if [ "$cmd" != "" ] ; then
	eval "cd $script_dir ; alacritty -e nvim $script_dir$cmd"
else
	exit 1
fi
