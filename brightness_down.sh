#!/usr/bin/env bash

echo $(($(cat /sys/class/backlight/intel_backlight/brightness)-90)) | sudo -A tee /sys/class/backlight/intel_backlight/brightness &> $HOME/Programs/git-repos/dotfiles-2017/somefile.txt
