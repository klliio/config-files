#!/bin/bash

wireguard_dir="/etc/wireguard/"
cmd=$(ls $wireguard_dir | grep "conf" | sed 's/.conf//' | rofi -dmenu -p "Choose a server")

if [ "$cmd" != "" ] ; then
	option=$(printf "up\ndown" | rofi -dmenu -i)

	case "$option" in
		"up") wg-quick up "$cmd" ;;
		"down") wg-quick down "$cmd" ;;
		*) exit 1 ;;
	esac
else
	exit 1
fi
