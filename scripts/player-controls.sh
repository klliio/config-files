#!/bin/bash
#
# usage player-controls.sh [option]
# 			--[prev/next]
# 			--[play/pause/toggle]

if pgrep -x "ncmpcpp" > /dev/null; then
	case "$1" in
		--next) mpc next > /dev/null ; playerctl next;;
		--prev) mpc prev > /dev/null ; playerctl previous;;
		--play) mpc play > /dev/null ; playerctl play;;
		--pause) mpc pause > /dev/null ; playerctl stop;;
		--toggle) mpc toggle > /dev/null ; playerctl play-pause;;
		*) exit 1 ;;
	esac
else
	case "$1" in
		--next) playerctl next;;
		--prev) playerctl previous;;
		--play) playerctl play;;
		--pause) playerctl stop;;
		--toggle) playerctl play-pause;;
		*) exit 1 ;;
	esac
fi
