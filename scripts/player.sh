#!/bin/sh

# USAGE ./player.sh [args] [length]
#  ./player.sh --combined 30
#
#  arguements:
#  --status      : just the status
#  --status-icon : an icon of the status
#  --icon        : just the icon
#  --title       : just the title
#  --combined    : icon and title
#
#  Doesn't correctly show spacing with cjk characters
#  depending on the output location and font. e.g. waybar,
#  terminal.

export LANG=C; LC_ALL=C

if ! command -v playerctl 1> /dev/null 2> /dev/null; then
    echo "playerctl is not installed."
    exit 1
fi

mpd_client="ncmpcpp"
mpd_icon="󰎆"
mpris_icon=""
status_play="󰐊"
status_pause="󰏤"
title() {
	if pgrep -x "$mpd_client" 1> /dev/null 2> /dev/null; then
		mpc -f %albumartist%\ -\ %title% | sed -n '1p' 2> /dev/null | sed 's/VEVO//g'
	else
		playerctl metadata --format "{{ artist }} - {{ title }}" 2> /dev/null | sed 's/VEVO//g'
	fi
}

icon() {
	if pgrep -x "$mpd_client" 1> /dev/null 2> /dev/null; then
		echo "$mpd_icon"
	else
		echo "$mpris_icon"
	fi
}

mpris="$(playerctl status)"
mpd="$(mpc status %state%)"
if [ "$mpris" = "Playing" ] || [ "$mpd" = "playing" ] ; then
	case "$1" in
		--icon) song="$(icon)" ;;
		--title) song="$(title)" ;;
		--combined) song="$(icon) $(title)" ;;
		--status) song="Playing" ;;
		--status-icon) song="$status_play" ;;
		*) exit 1 ;;
	esac
else
	case "$1" in
		--status) song="Paused" ;;
		--status-icon) song="$status_pause" ;;
		*) song="Nothing is playing" ;;
	esac
fi

if [ -n "$song" ]; then
	if [ -n "$2" ]; then
		if [ ${#song} -gt "$2" ]; then
			song="$(printf "$song" | cut -c 1-"$2")..."
		else
			str_diff=$(($2/2-${#song}/2))
			song=$(printf "$song" | awk -v x="$str_diff" '{printf "%" x "s%s" , "", $0}')
		fi
	fi

	echo "$song"
fi
