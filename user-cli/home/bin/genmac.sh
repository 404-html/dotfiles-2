#!/bin/bash

macaddr=$(echo $RANDOM|md5sum|sed -r 's/^(..)(..)(..)(..)(..).*$/02:\1:\2:\3:\4:\5/')
echo $macaddr
