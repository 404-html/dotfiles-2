#!/bin/bash

exec 2>/dev/null

dir=/tmp/${USER}_conky
mkdir -p "${dir}"

curl -4 wttr.in | sed -n '3,7p' | perl -pe 's/\e\[?.*?[\@-~]//g' > "${dir}/weather"
apt list --upgradable | tail -n +2 | wc -l > "${dir}/apt_ulist"
dig +short myip.opendns.com @resolver1.opendns.com > "${dir}/wanip"

