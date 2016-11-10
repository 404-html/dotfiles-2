#!/bin/bash

# To send via e-mail from Tux Commander (or Midnight Commander, or the command line) 
# using this format:
# admin@box:$ thunderbird –compose “to=’foo@bar.com,bar@foo.com’,subject=’nice tip’,attachment=’file:///home/admin/tip.txt’,body=’Check out this neat command line tip’”
# - so you could probably use zenity to input e-mail addresses and the like as well.
# Tux Commander passes a full filename as $1; from the commandline it will cope with relative and absolute paths as well.
# (Format ganked from http://www.kbrandt.com/2008/05/quick-tip-tunderbird-email-from-command.html)


# if $1 is a file then it's an attachment
# This is what the script is actually used for, but you could test for e-mail addresses and 
# the like this way.
if [ -f "$1" ]; then

    # Testing for absolute vs. relative path
    # assuming that relative path starts from PWD.
    case $1 in
        /*) 
        file=$1
        absolute=1 
        ;;

        *) 
        absolute=0
        file=$(pwd)/${1#.}
        ;;
    esac
    filename=$(echo "file://$file")
    # currently goes right into mail loop - I want to populate subject, etc, in thunderbird.
    # if you want to do more, then populate each of the variables elsewhere.
    # mailing commandline
    thunderbird -compose "attachment=$filename"
fi
