#!/bin/bash

#This is the ffmpeg command that the screencast shortcut in i3 will run.


while [[ -f $HOME/screencast$n.mkv ]]
do
	n=$((n+1))
done
filename="$HOME/screencast$n.mkv"

#The actual ffmpeg command:

ffmpeg -y \
-thread_queue_size 512 \
-f x11grab \
-s 1920x1200 \
-i :0.0+0,360 \
-f x11grab \
-s 1200x1920 \
-i :0.0+1920,0 \
-f alsa \
-i default \
-filter_complex '[1:v:0]scale=iw/3:ih/3[pip],[0:v:0][pip]overlay=main_w-overlay_w-10:main_h-overlay_h-10' \
-c:v libx264 -r 60 -c:a flac $filename

