#!/usr/bin/env bash

scrot lockscreen.png  -e "mv lockscreen.png $HOME/.config/i3/."
$HOME/.config/i3/pixelate
i3lock -e -i $HOME/.config/i3/lockscreen.png
