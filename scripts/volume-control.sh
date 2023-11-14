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

	id="$(makoctl list | grep -A 26 "Volume Control" | sed 's/.*Volume Control.*id.*data":\([0-9]*\).*urgency.*/\1/g')"
	if [ -z "$id" ]; then
		notify-send -a "Volume Control" -i "$HOME/.config/scripts/assets/volume-32x32.png" "$(bar-rs -p $(wpctl get-volume @DEFAULT_SINK@ | sed 's/^.* //;s/\.//') -m 100 -l 27)"
	else
		notify-send -r "$id" -a "Volume Control" -i "$HOME/.config/scripts/assets/volume-32x32.png" "$(bar-rs -p $(wpctl get-volume @DEFAULT_SINK@ | sed 's/^.* //;s/\.//') -m 100 -l 27)"
	fi
fi
