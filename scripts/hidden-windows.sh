#!/bin/bash

session_type="`echo $XDG_SESSION_TYPE`"
if [ "$session_type" = "wayland" ] ; then
	windows=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].name')
	if [ "$windows" ] ; then
		ids=($(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].id'))
		names=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].name')
		id_index="$(<<< "$names" rofi -dmenu -p "Hidden" -format i)"
	
		if [ ! $id_index ]; then
			exit 1
		fi
	
		swaymsg "[con_id=${ids[${id_index}]}]" focus
	else
        notify-send -a "Hidden Windows" "No windows are in the scratchpad"
		exit 1
	fi
elif [ "$session_type" = "tty" ] ; then
	ids=($(bspc query -N -n .hidden.window)) || exit
	names="$(xtitle "${ids[@]}")"
	id_index="$(<<< "$names" rofi -dmenu -p "Hidden" -format i)"

	if [ ! $id_index ]; then
		exit 1
	fi

	bspc node "${ids[${id_index}]}" -g hidden=off -f
fi
