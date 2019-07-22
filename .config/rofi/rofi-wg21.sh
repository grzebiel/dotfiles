#!/bin/bash

history_file="~/.config/rofi/wg21.history"
if [ ! -f $history_file ]
then
    touch $history_file
fi

if [ -z $@ ]
then
    cat $history_file
else
    echo $@ >> $history_file
    wg21link $@
fi
