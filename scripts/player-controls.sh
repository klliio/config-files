#!/bin/sh
#
# usage player-controls.sh [option]
# 			--[prev/next]
# 			--[play/pause/toggle]

if [ ! "$(mpc status %totaltime%)" = "0:00" ]; then
	case "$1" in
		--next) mpc next > /dev/null;;
		--prev) mpc prev > /dev/null;;
		--play) mpc play > /dev/null;;
		--pause) mpc pause > /dev/null;;
		--toggle) mpc toggle > /dev/null;;
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
