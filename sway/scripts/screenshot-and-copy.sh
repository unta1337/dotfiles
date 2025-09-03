#!/bin/bash

filepath="$HOME/Pictures/Screenshots/$(date +'%y%m%d_%H%M%S').png"

grim -t png -g "$(slurp)" $filepath
wl-copy --type image/png < $filepath
