#!/bin/bash

host=router.lan
usr=$(secret-tool lookup router-usr default)
pw=$(secret-tool lookup router-pw default)

credencials(){
    echo "$usr"
    echo "$pw"
}

connect(){
    telnet "$host" 2>/dev/null
}

sendcmd(){
    ( credencials; $1; sleep 1 ) | connect 
}

iwconfig(){
    echo ':wireless mssid iflist ssid_id=0'
}

getwifipw(){
    sendcmd iwconfig | grep passphrase | sed 's/^.*\: \(.*\)$/\1/'
}

getwifipw
