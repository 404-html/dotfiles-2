
if hash anacron 2>/dev/null; then
    # anacron in user mode.
    if  ! [ -d "$HOME/.anacron" ] ; then
        mkdir -p $HOME/.anacron/{spool,etc}
        touch $HOME/.anacron/anacrontab
    fi
    /usr/sbin/anacron -s -t ${HOME}/.anacron/etc/anacrontab -S ${HOME}/.anacron/spool
fi
