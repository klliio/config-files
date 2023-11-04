#!/bin/sh

if [ "$(wpctl get-volume @DEFAULT_SINK@ | sed 's/^.*\[//;s/\]$//')" != "MUTED" ]; then
	case "$1" in
		--increase) if [ "$(wpctl get-volume @DEFAULT_SINK@ | sed 's/^.* //;s/\.//')" -lt  96 ]; then
						wpctl set-volume @DEFAULT_SINK@ 5%+
					else
						wpctl set-volume @DEFAULT_SINK@ 100%
					fi;;
		--decrease) wpctl set-volume @DEFAULT_SINK@ 5%-;;
		*) exit 1;;
	esac
fi

