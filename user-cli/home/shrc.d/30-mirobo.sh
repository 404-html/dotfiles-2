#!/bin/bash 

[ -e ~/.mitokens.sh ] && source ~/.mitokens.sh

export MIROBO_G_TRASHCAN="492 358"

export MIROBO_C_CBANHO="553 524 608 476"
export MIROBO_C_CBANHOP="606 531 670 479"
export MIROBO_C_COZINHA="443 397 554 349"
export MIROBO_C_HALL="555 476 647 343"
export MIROBO_C_QUARTOM="447 459 554 397"
export MIROBO_C_QUARTOP="472 521 555 459"
export MIROBO_C_SALA="648 457 738 340"
export MIROBO_C_STUDY="655 522 731 456"

export MIROBO_C_CASA="\
$MIROBO_C_QUARTOP 1 \
$MIROBO_C_CBANHO 1 \
$MIROBO_C_QUARTOM 1 \
$MIROBO_C_COZINHA 1 \
$MIROBO_C_HALL 1 \
$MIROBO_C_SALA 1 \
$MIROBO_C_STUDY 1 \
$MIROBO_C_CBANHOP 1"

# pixels coordinates according to gimp. X,Y
function mirobo_px2coor() {
    [ -z $3 ] && sp=' ' || sp=$3
    echo $((25500+($1-512)*50))${sp}$((25500+(1024-$2-512)*50)) 
}

function mirobo_px_goto() {
    \miiocli vacuum --ip=$MIROBO_IP --token=$MIROBO_TOKEN goto $(mirobo_px2coor $1 $2)
}

function mirobo_px_zclean() {
    let has_int=$#%2

    zones='['
    while [ $# -gt 0 ]; do
        x1y1=$(mirobo_px2coor $1 $2 ,)
        x2y2=$(mirobo_px2coor $3 $4 ,)
        shift 4

        if [ $has_int -eq 0 ]; then
            int=1
        else
            int=$1
            shift
        fi

        zones=$zones\[$x1y1,$x2y2,$int\],
    done
    zones="${zones%?}]" # Remove last char

    \miiocli vacuum --ip="$MIROBO_IP" --token="$MIROBO_TOKEN" zoned_clean $zones
}

alias miiocliv='miiocli vacuum --ip=$MIROBO_IP --token=$MIROBO_TOKEN'
alias miioclia='miiocli airpurifier --ip=$MIAIR_IP --token=$MIAIR_TOKEN'

