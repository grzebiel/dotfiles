#!/bin/bash

layout_dir="$HOME/.screenlayout"

if [ -z $@ ]
then
    ls $layout_dir | grep -v current
    echo new
else
    if [ $1 == new ]
    then
        coproc arandr
    fi
    ln -sf "$layout_dir/$1" "$layout_dir/current"
    exec "$layout_dir/$1"
fi
