#!/bin/bash

session_type="`echo $XDG_SESSION_TYPE`"
if [ "$session_type" = "wayland" ] ; then
	ids=($(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].id'))
	names=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].name')
	id_index="$(<<< "$names" rofi -dmenu -p "Hidden" -format i)"
	swaymsg "[con_id=${ids[${id_index}]}]" focus
elif [ "$session_type" = "tty" ] ; then
	ids=($(bspc query -N -n .hidden.window)) || exit
	names="$(xtitle "${ids[@]}")"
	id_index="$(<<< "$names" rofi -dmenu -p "Hidden" -format i)"
	bspc node "${ids[${id_index}]}" -g hidden=off -f
fi
