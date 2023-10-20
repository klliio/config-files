#!/bin/bash

directory="/home/klliio/"
directories() {
	file=$(ls -ap "$directory" | rofi -dmenu -p "Pick a directory")
	directory+="$file"

	if [ "$file" == "" ]; then
		exit 1
	elif [ $(sed 's/^.*\(.\)$/\1/' <<< "$file") == "/" ]; then
		directories
	else
		chosen
	fi
}

chosen() {
        choice=$(printf "edit\nrename\nmove\n" | rofi -dmenu -p "Choose an action")
   	 
    	case "$choice" in
           	"edit")
				eval "cd $(sed 's/ /\\ /g;s/^\(\/.*\/\).*$/\1/' <<< $directory) ; alacritty -e nvim $(sed 's/ /\\ /g;s/^.*\///g' <<< $directory)"
               	;;
          	"rename")
				file_name=$(ls -ap "$directory" | rofi -dmenu -p "Enter a file name")
				eval "mv $directory $(sed 's/^\(.*\/\).*/\1/g' <<< $directory)$file_name"
            	;;
        	"move")
				mv_location=$(sed 's/^\(.*\/\).*/\1/g' <<< "$directory")
				while true; do
					location=$(ls -ap "$mv_location" | rofi -dmenu -p "Pick a location")
					mv_location+=$location

					if [ $(sed 's/^.*\(.\)$/\1/' <<< "$mv_location") != "/"  ]; then
						eval "mv $(sed 's/ /\\ /g' <<< $directory) $(sed 's/ /\\ /g' <<< $mv_location)"
						break
					elif [ "$location" == "" ]; then
						break
					fi
				done
                ;;
           	*)
                exit 1
                ;;
		esac
}

directories
