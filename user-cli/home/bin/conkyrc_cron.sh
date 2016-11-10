#!/bin/bash

mkdir -p /tmp/$USER_conky

curl -4 wttr.in | sed -n '3,7p' | perl -pe 's/\e\[?.*?[\@-~]//g' > /tmp/$USER_conky/weather 2>/dev/null
apt list --upgradable 2>/dev/null | tail -n +2 | wc -l > /tmp/$USER_conky/apt_ulist 2>/dev/null
dig +short myip.opendns.com @resolver1.opendns.com > /tmp/$USER_conky/wanip 2>/dev/null

