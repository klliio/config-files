#!/bin/bash

if ! command -v playerctl &> /dev/null; then
    echo "playerctl is not installed."
    exit 1
fi

get_spotify_song_linux() {
  playerctl -p spotify metadata --format "{{ artist }} - {{ title }}"
}

get_firefox_video_linux() {
  playerctl -p firefox metadata --format "{{ artist }} - {{ title }}"
}

if playerctl status == "Playing" > /dev/null; then
	if pgrep -x "spotify" > /dev/null; then
		song="   $(get_spotify_song_linux)"
	elif pgrep -x "firefox" > /dev/null; then
		song="   $(get_firefox_video_linux)"
	fi
elif playerctl status == "Paused" > /dev/null; then
	song=" Paused"
else
	song="No players found"
fi

if [[ -n "$song" ]]; then
	if [ ${#song} -gt 30 ]; then
		song="${song:0:30}..."
	fi
	echo "$song"
fi
