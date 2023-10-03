#!/bin/bash

if echo $XDG_SESSION_TYPE == "wayland"; then
	ids=($(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].id'))
	names=($(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].name'))
	id_index="$(<<< "$names" rofi -dmenu -format i)"
	swaymsg "[con_id=$id_index]" focus
elif echo $XDG_SESSION_TYPE == "tty"; then
	ids=($(bspc query -N -n .hidden.window)) || exit
	names="$(xtitle "${ids[@]}")"
	id_index="$(<<< "$names" rofi -dmenu -format i)"
	bspc node "${ids[${id_index}]}" -g hidden=off -f
fi
