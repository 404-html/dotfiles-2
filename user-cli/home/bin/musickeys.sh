#!/bin/bash -
#===============================================================================
#
#          FILE: musickeys.sh
#
#         USAGE: ./musickeys.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 06/02/15 11:25
#      REVISION:  ---
#===============================================================================


case $1 in
   "play")
       key="XF86AudioPlay"
       ;;
   "next")
       key="XF86AudioNext"
       ;;
   "prev")
       key="XF86AudioPrev"
       ;;
   *)
       echo "Usage: $0 play|next|prev"
       exit 1
        ;;
esac
xdotool key --window $(xdotool search --name "Spotify (Premium |Unlimited |Free )?- Linux Preview"|head -n1) $key
exit 0

