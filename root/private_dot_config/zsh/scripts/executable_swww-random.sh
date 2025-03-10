#!/bin/env sh

# modified (simplified) version of
# https://github.com/LGFae/swww/blob/main/example_scripts/swww_randomize.sh

# Changes the wallpaper to a randomly chosen image in a given directory
# at a set interval.

DEFAULT_INTERVAL=300 # seconds

if [ $# -lt 1 ] || [ ! -d "$1" ]; then
    echo "usage: <directory> [<interval>|300]"
    exit 1
fi

while true; do
    fd . "$1" --type f | shuf |
        while read -r img; do
            swww img "$img"
            sleep "${2:-$DEFAULT_INTERVAL}"
        done
done
