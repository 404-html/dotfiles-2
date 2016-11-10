#!/bin/sh
# firefox-tmpfs-sync.sh

## Sync periodicaly

# crontab -e
# */30 * * * * ~/bin/firefox-sync

## Sync at login/logout
# Deeming bash is being used, add the script to the login/logout files:
# Note: You may wish to use ~/.bash_profile instead of ~/.bash_login as bash will only read the first of these if both exist and are readable.

# echo '~/bin/firefox-sync' | tee -a ~/.bash_logout ~/.bash_login >/dev/null




static=.mozilla-static
link=.mozilla
volatile=/dev/shm/firefox-$USER

IFS=
set -efu

cd ~

if [ ! -r $volatile ]; then
	mkdir -m0700 $volatile
fi

if [ "$(readlink $link)" != "$volatile" ]; then
	mv $link $static
	ln -s $volatile $link
fi

if [ -e $link/.unpacked ]; then
	rsync -av --delete --exclude .unpacked ./$link/ ./$static/
else
	rsync -av ./$static/ ./$link/
	touch $link/.unpacked
fi

