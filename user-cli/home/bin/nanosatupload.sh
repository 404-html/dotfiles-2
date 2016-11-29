#!/bin/bash -
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# Pedro Gameiro wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Poul-Henning Kamp
# ----------------------------------------------------------------------------

if [ "$#" -lt 1 ];then
    echo
    echo "usage: $0 [file]..." >&2
    echo
    exit 1
fi


### EDIT ME
authid=$(secret-tool lookup nanosat user)     # username
authpw=$(secret-tool lookup nanosat pwd)      # password
section=$(secret-tool lookup nanosat section) # Section to upload (i.e. GET parameter "n" when logged in section.)
url=$(secret-tool lookup nanosat url)         # url to index.php
###

cookie=$(mktemp)

# Login
curl -c "$cookie" \
     -F "authid=$authid" \
     -F "authpw=$authpw" \
     "$url" >/dev/null

for file in "$@"; do
    if ! [ -r "$file" ]; then
        echo "[Error] Unable to read [$file]. Skipping." >&2
        continue
    fi

    uploadfile=$file
    upname=$(basename "$file")
    action=postupload

    # Upload
    curl -F "uploadfile=@$uploadfile" \
         -F "action=$action" \
         -F "n=$section" \
         -F "upname=$upname" \
         -b "$cookie" \
         "$url" > /dev/null
done

shred -u "$cookie"

