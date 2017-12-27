#!/bin/bash

CMD=$1
DOMAIN=$2
VID=$3
PID=$4

if [ $# -ne 4 ] || \
   [ "${CMD}" != "attach-device" ] && \
   [ "${CMD}" != "detach-device" ]; then

    >&2 echo -e "\tusage: $0 attach-device|detach-device DOMAIN VID PID"
    exit -1
fi

virsh ${CMD} ${DOMAIN} /dev/stdin <<EOF
<hostdev mode='subsystem' type='usb'>
  <source>
   <vendor id="0x${VID}" />
   <product id="0x${PID}" />
  </source>
</hostdev>
EOF
