#!/bin/bash -
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# Pedro Gameiro wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Poul-Henning Kamp
# ----------------------------------------------------------------------------

if [ "$#" -ne 1 ];then
    echo
    echo "usage: $0 file2upload"
    echo
    exit 1
fi


### EDIT ME
authid=$(secret-tool lookup nanosat user)   # username
authpw=$(secret-tool lookup nanosat pwd)    # password
section=Intranet.TransProt                  # wiki section e.g Intranet.TransProt
###

# Login
url=http://istnanosat.ist.utl.pt/index.php
cookie=$(mktemp)
action=login
n=Site.SideBar

curl -c "$cookie" -F "authid=$authid" -F "authpw=$authpw" "$url" >/dev/null

# Upload
uploadfile=$1
upname=$(basename "$1")
action=postupload
res=$(mktemp)

curl -F "uploadfile=@$uploadfile" \
     -F "action=$action" \
     -F "n=$section" \
     -F "upname=$upname" \
     -b "$cookie" \
     "$url" > "$res"

shred -u "$res"
shred -u "$cookie"

