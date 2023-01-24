#!/bin/bash
killall polybar

echo "---" | tee -a /tmp/polybar.log

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar > /tmp/polybar.log 2>&1 & disown
  done
else
  polybar --reload example &
fi
