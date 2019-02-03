#!/bin/bash

if [ -z $@ ]
then
    available()
    {
        find /etc/netctl/ -maxdepth 1 -type f -printf "%f\n"
    }

    echo new; available;
else
    notify="dunstify --appname=WIFI --replace=7726 --timeout 5000 WIFI"

    if [ x"new" = x"$@" ]
    then
        exec terminator -T wifi -e "sudo wifi-menu && $notify \"successfully connected via wifi-menu\" || $notify \"connection via wifi-menu failed\""
    fi

    output=$(sudo switch_wifi_to "$@" 2>&1)
    res=$?
    if [ $res -ne 0 ]
    then
        error_file=/tmp/wifi_last_error
        $notify "failed to connect to $@. see $error_file"
        echo $output  > $error_file
    else
        $notify "connected to $@"
    fi
fi
