#!/bin/bash - 

if [ "$(id -u)" -ne 0 ];then
    sudo "$0" "$@"
    exit
fi

TMPDIR=$(mktemp -d /tmp/thunderbird.XXXX) 
cd "$TMPDIR"

#wget -l 1 -r --no-parent -nd -A 'firefox-*.en-US.linux-x86_64.tar.bz2' 'https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central/'
wget 'https://download.mozilla.org/?product=thunderbird-latest&os=linux64&lang=en-US'

cd /opt
mv thunderbird thunderbird.old 2>/dev/null
tar jxf "$(ls "$TMPDIR"/* | tail -n1)"  \
    && rm -rf thunderbird.old       \
    || mv thunderbird.old thunderbird

if ! [ -f /usr/bin/thunderbird ];then
    ln -s /opt/thunderbird/thunderbird /usr/bin/thunderbird
fi
