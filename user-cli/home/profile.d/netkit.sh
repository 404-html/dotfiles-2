#!/bin/bash 

# Netkit
if [ -d $HOME/.opt/netkit ]; then
    export NETKIT_HOME=$HOME/.opt/netkit
    export MANPATH=:$NETKIT_HOME/man
    export PATH=$NETKIT_HOME/bin:$PATH
    export CDPATH="$CDPATH:$HOME/workspace"
    #source $NETKIT_HOME/bin/netkit_bash_completion
fi


