#!/bin/bash
#
# USAGE ./player.sh [args] [length]
#  ./player.sh --combined 30
#
export LANG=C; LC_ALL=C

if ! command -v playerctl &> /dev/null; then
    echo "playerctl is not installed."
    exit 1
fi

get_spotify_song_linux() {
  playerctl -p spotify metadata --format "{{ artist }} - {{ title }}"
}

get_mpd_song_linux() {
	mpc -f %albumartist%\ -\ %title% | sed -n '1p'
}

get_firefox_video_linux() {
  playerctl -p firefox metadata --format "{{ artist }} - {{ title }}"
}

if playerctl status == "Playing" &> /dev/null || mpc status %state% == "playing" &> /dev/null; then
	if pgrep -x "spotify" > /dev/null; then
		title="$(get_spotify_song_linux)"
		icon=" "
	elif pgrep -x "ncmpcpp" > /dev/null; then
		title="$(get_mpd_song_linux)"
		icon="󰎆 "
	elif pgrep -x "firefox" > /dev/null; then
		title="$(get_firefox_video_linux)"
		icon=" "
	fi
else
	song="No Players"
fi

case "$1" in
	--icon) song="$icon" ;;
	--title) song="$title" ;;
	--combined) song="$icon$title" ;;
	*) exit 1 ;;
esac

if [[ -n "$song" ]]; then
	if [ ! -z "$2" ]; then
		if [ ${#song} -gt "$2" ]; then
			song="${song:0:"$2"}..."
		fi
	fi

	echo "$song"
fi
