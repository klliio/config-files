#!/bin/bash
#
# usage player-controls.sh [option]
# 			--[prev/next]
# 			--[play/pause/toggle]

case "$1" in
	--next) mpc next > /dev/null ; playerctl next;;
	--prev) mpc prev > /dev/null ; playerctl previous;;
	--play) mpc play > /dev/null ; playerctl play;;
	--pause) mpc pause > /dev/null ; playerctl stop;;
	--toggle) mpc toggle > /dev/null ; playerctl play-pause;;
	*) exit 1 ;;
esac
