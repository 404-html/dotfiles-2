#!/bin/bash -

# Remove network access
if hash firejail &>/dev/null;then
    if [ "$1" != "<jailed>" ];then
        exec firejail --net=none --caps.drop=all "$0" "<jailed>" "$@"
    else
        shift
    fi
else
    echo 'Every time you run msoffice without firejail, Bill Gates kills a pinguin =(.' >&2
fi

prefix="$(dirname -- $(readlink -f -- "$0"))"

arch=win32
offdir="$prefix/drive_c/Program Files/Microsoft Office/Office14/"

case "$1" in
    word)
        progid="Word.Document.8" 
        offexe="WINWORD.EXE"
        ;;
    excel)
        progid="Excel.Sheet.8"
        offexe="EXCEL.EXE"
        ;;
    powerpoint)
        progid="PowerPoint.Show.8"
        offexe="POWERPNT.EXE"
        ;;
    visio)
        progid="Visio.Drawing.11"
        offexe="VISIO.EXE"
        ;;
    *)
        echo 'Say what?'
        exit -1
       ;;
esac

if [ "$#" -eq 2 ];then
    WINEARCH="$arch" WINEPREFIX="$prefix" wine-development start /ProgIDOpen "$progid" "$2"
else
    WINEARCH="$arch" WINEPREFIX="$prefix" wine-development "$offdir/$offexe"
fi
