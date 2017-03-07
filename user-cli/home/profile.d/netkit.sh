
dir=${HOME}/.opt/netkit

if [ -d "${dir}" ]; then
    export NETKIT_HOME=${dir}
    export MANPATH=${NETKIT_HOME}/man:${MANPATH}
    export PATH=${NETKIT_HOME}/bin:${PATH}
    [ "$BASH_VERSION" ] && source "${NETKIT_HOME}/bin/netkit_bash_completion"
fi

unset dir

