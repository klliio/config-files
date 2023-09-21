#!/bin/bash

if ! command -v playerctl &> /dev/null; then
    echo "playerctl is not installed."
    exit 1
fi

get_spotify_song_linux() {
  playerctl -p spotify metadata --format "{{ artist }} - {{ title }}"
}

get_mpd_song_linux() {
	mpc -f %albumartist%\ -\ %title%
}

get_firefox_video_linux() {
  playerctl -p firefox metadata --format "{{ artist }} - {{ title }}"
}

if playerctl status == "Playing" > /dev/null || mpc status %state% == "playing" > /dev/null; then
	if pgrep -x "spotify" > /dev/null; then
		song="   $(get_spotify_song_linux)"
	elif pgrep -x "ncmpcpp" > /dev/null; then
		song="󰎆   $(get_mpd_song_linux)"
	elif pgrep -x "firefox" > /dev/null; then
		song="   $(get_firefox_video_linux)"
	fi
else
	song="Not Playing"
fi

if [[ -n "$song" ]]; then
	if [ ${#song} -gt 30 ]; then
		song="${song:0:30}..."
	fi
	echo "$song"
fi
