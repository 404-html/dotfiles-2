#!/bin/bash 
ffmpeg -i "$1" -c:v libx264 -preset ultrafast -crf 17 -c:a copy "$2"
