
# English language, iso-8601 date format, euro money, metric system
if locale -a | grep en_DK.utf8 &>/dev/null; then
    export LANG="en_DK.UTF-8"
    export LC_ALL="en_DK.utf8"
    #export LC_CTYPE="en_US.utf8"
    #export LC_NUMERIC="en_US.utf8"
    #export LC_TIME="en_DK.utf8"
    #export LC_COLLATE="en_US.utf8"
    #export LC_MONETARY="en_DK.utf8"
    #export LC_MESSAGES="en_US.utf8"
    #export LC_PAPER="en_US.utf8"
    #export LC_NAME="en_US.utf8"
    #export LC_ADDRESS="en_US.utf8"
    #export LC_TELEPHONE="en_US.utf8"
    #export LC_MEASUREMENT="en_DK.utf8"
    #export LC_IDENTIFICATION="en_US.utf8"
fi

