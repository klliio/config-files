#!/bin/sh
#
# Dependencies:
# 	- slurp
# 	- wf-recorder
# 	- rofi
# 	- wayland
# 	- a notification daemon
#

if [ -n "$(pgrep wf-recorder)" ]; then
	pkill --signal SIGINT wf-recorder
    notify-send -a rofi-wf-recorder "Screen Capture" "Finished capture."
	exit 1
fi

screencapture_dir="$HOME/Videos/ScreenCaptures/"

while true; do
    # Use Rofi prompt to ask for a file name
	file_name=$(ls "$screencapture_dir" | sed -E 's/\.[a-zA-Z]*[0-9]*//' | rofi -dmenu -p "Enter file name")
    # Check if a file name was entered
    if [ -z "$file_name" ]; then
        notify-send -a rofi-wf-recorder "Screen Capture" "No file name entered. Aborting."
        exit 1
    fi
    
    if [ -f "$screencapture_dir$file_name".mp4 ]; then
        choice=$(printf "Rename\nReplace\nKeep & ignore" | rofi -dmenu -p "File with the same name exists!")
    
        case "$choice" in
            "Rename")
                continue
                ;;
            "Replace")
				rm "$screencapture_dir$file_name.mp4"
                notify-send -a rofi-wf-recorder "Screen Capture" "Replacing the existing capture."
                break
                ;;
            *)
                notify-send -a rofi-wf-recorder "Screen Capture" "Invalid choice or no action taken. Aborting."
                exit 1
                ;;
        esac
    else
        break
    fi
done

# start a screencapture using wf-recorder command
selection=$(printf "Region\nFullscreen" | rofi -dmenu -p "Selection type")
case "$selection" in
	"Region") 
		# use slurp to get the selection area
		wf-recorder --geometry "$(slurp)" -f "$screencapture_dir$file_name.mp4" --no-damage --framerate 60 ;;
	"Fullscreen") wf-recorder -f "$screencapture_dir$file_name.mp4" --no-damage --framerate 60 ;;
		*) exit 1 ;;
esac
notify-send -a rofi-wf-recorder "Screen Capture" "Started capture as $file_name.mp4"

