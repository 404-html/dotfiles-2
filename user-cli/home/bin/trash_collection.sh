#!/bin/bash - 

dir=$HOME/Downloads/trash_collection

if [ -d "$dir" ];then
    find "$dir" -maxdepth 1 -mtime +10 -exec trash-put '{}' \;
fi

