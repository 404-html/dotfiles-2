#!/bin/bash

trap "kill %1" SIGINT SIGTERM

tmpdir=$(mktemp -p /run/user/$UID -d)
cd "$tmpdir"

loop() {
    date
    nav=$(ssh s50 -C 'ls -t1 /var/run/shm/*ppm | head -1' 2>/dev/null)
    [ -z "$nav" ] && return

    sftp -qC s50 << EOF
get $nav $1/nav.ppm
get /var/run/shm/SLAM_fprintf.log $1/SLAM_fprintf.log
EOF

    echo "mirobo_buildmap.py -map $1/nav.ppm -slam $1/SLAM_fprintf.log"
    >/dev/null mirobo_buildmap.py -map $1/nav.ppm -slam $1/SLAM_fprintf.log
}

export -f loop

uudecode "$0"
>/dev/null 2>&1 eom $tmpdir/nav.png &

if [ $1 ]; then
    int=$1
else
    int=2
fi

watch -n$int -x bash -c "loop $tmpdir"
unset -f loop

exit 0
begin-base64-encoded 640 bmF2LnBuZw==
iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAADElEQVQI12Ng
YGAAAAAEAAEnNCcKAAAAAElFTkSuQmCC
====

