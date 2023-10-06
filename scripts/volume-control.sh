#!/bin/bash

if ( ! wpctl status | grep "MUTED"); then
	case "$1" in
		--increase) if (($(echo "$(wpctl get-volume @DEFAULT_SINK@ | sed 's/Volume: //') <  0.96" | bc -l))); then
						wpctl set-volume @DEFAULT_SINK@ 5%+
					else
						wpctl set-volume @DEFAULT_SINK@ 100%
					fi;;
		--decrease) wpctl set-volume @DEFAULT_SINK@ 5%-;;
		*) exit 1;;
	esac
fi

