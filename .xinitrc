#!/bin/sh
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xresources ]] && xrdb -merge -I"$HOME" ~/.Xresources
exec i3
