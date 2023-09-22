#!/bin/bash

ids=($(bspc query -N -n .hidden.window)) || exit
options="$(xtitle "${ids[@]}")"
id_index="$(<<< "$options" rofi -dmenu -format i)"
bspc node "${ids[${id_index}]}" -g hidden=off -f
