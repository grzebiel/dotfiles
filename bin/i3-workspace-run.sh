#!/bin/bash

#usage i3-workspace-run.sh [workspace] [application] [class of application]
#focus window class $3 if process works. Otherwise go to specyfic workspace and launch it
echo "$1,$2,$3"
if pidof $2 2>&1 > /dev/null;
then
    i3-msg -q [class=$3] focus
else
    i3-msg -q workspace $1
    $2
fi
