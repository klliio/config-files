#!/bin/sh

directory="/home/klliio/"
directories() {
	file=$(ls -ap "$directory" | rofi -dmenu -p "Pick a directory")
	directory="$directory""$file"
	printf "$directory"

	if [ "$file" = "" ]; then
		exit 1
	elif [ "$(printf "$file" | sed 's/^.*\(.\)$/\1/')" = "/" ]; then
		directories
	else
		chosen
	fi
}

chosen() {
        choice=$(printf "edit\nrename\nmove\n" | rofi -dmenu -p "Choose an action")
   	 
    	case "$choice" in
           	"edit")
				eval "cd $(printf $directory | sed 's/ /\\ /g;s/^\(\/.*\/\).*$/\1/') ; alacritty -e nvim $(printf $directory | sed 's/ /\\ /g;s/^.*\///g')"
               	;;
          	"rename")
				file_name=$(ls -ap "$directory" | sed 's/^.*\/\(.*$\)/\1/' | rofi -dmenu -p "Enter a file name")
				eval "mv $directory $(printf $directory | sed 's/^\(.*\/\).*/\1/g')$file_name"
            	;;
        	"move")
				mv_location=$(printf "$directory" | sed 's/^\(.*\/\).*/\1/g')
				while true; do
					location=$(ls -ap "$mv_location"  | rofi -dmenu -p "Pick a location")
					mv_location="$mv_location""$location"

					if [ "$(printf "$mv_location" | sed 's/^.*\(.\)$/\1/')" != "/"  ]; then
						eval "mv $(printf $directory | sed 's/ /\\ /g') $(printf $mv_location | sed 's/ /\\ /g')"
						break
					elif [ "$location" = "" ]; then
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
