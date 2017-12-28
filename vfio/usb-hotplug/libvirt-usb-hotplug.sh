#!/bin/bash

CMD=$1
DOMAIN=$2
VID=${3%:*}
PID=${3#*:}

if [ $# -ne 3 ] || \
   [ "${CMD}" != "attach-device" ] && \
   [ "${CMD}" != "detach-device" ]; then

    >&2 echo -e "usage: $0 attach-device|detach-device DOMAIN USB_ID"
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
