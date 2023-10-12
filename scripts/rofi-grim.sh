#!/bin/bash

# Take a screenshot using grim command and save it with a temporary file name
tmp_file=$(mktemp /tmp/screenshot_XXXXXX.png)
grim -t jpeg -q 100 $tmp_file

scrshotDir="$HOME/Images/Screenshots/"

while true; do
    # Use Rofi prompt to ask for a file name
	
	# uncomment below for sh instead of bash
    # file_name=$(echo  "`ls $scrshotDir | sed -E 's/\.[a-zA-Z]+$//'`" | rofi -dmenu -p "Enter file name")

	# hard to read
	file_name=$(ls $scrshotDir | while read A ; do 	echo -en "$A\x00icon\x1f$scrshotDir$A\n" ; done | sed -E 's/\.[a-zA-Z]+\x00/\x00/' | rofi -dmenu -p "Enter file name")
    # Check if a file name was entered
    if [ -z "$file_name" ]; then
        notify-send -a rofi-grim Screenshot "No file name entered. Aborting."
        exit 1
    fi
    
    if [ -f $scrshotDir$file_name.jpg ]; then
        choice=$(printf "rename\nreplace\nkeep & ignore" | rofi -dmenu -p "File with the same name exists!")
    
        case "$choice" in
            "rename")
                continue
                ;;
            "replace")
                mv "$tmp_file" "$scrshotDir$file_name.jpg"
                notify-send -a rofi-grim -i $scrshotDir$file_name.jpg Screenshot "Replaced the existing picture."
                break
                ;;
            "keep & ignore")
                rm $tmp_file
                notify-send -a rofi-grim -i $scrshotDir$file_name.jpg Screenshot "Discarded. Existing picture kept."
                break
                ;;
            *)
                notify-send -a rofi-grim Screenshot "Invalid choice or no action taken. Aborting."
                rm $tmp_file
                exit 1
                ;;
        esac
    else
        mv "$tmp_file" "$scrshotDir$file_name.jpg"
        notify-send -a rofi-grim -i $scrshotDir$file_name.jpg Screenshot "Saved as $file_name.jpg"
        break
    fi
done
