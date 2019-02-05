#!/bin/bash

layout_dir="$HOME/.screenlayout"

if [ -z $@ ]
then
    ls $layout_dir
else
    exec "$layout_dir/$1"
fi
