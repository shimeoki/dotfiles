#!/usr/bin/env bash

# source: https://github.com/junegunn/fzf/blob/master/bin/fzf-preview.sh
#
# changes:
#
# - use kitty image protocol
# - use bat
# - formatting

if [[ $# -ne 1 ]]; then
    >&2 echo "usage: $0 FILENAME[:LINENO][:IGNORED]"
    exit 1
fi

file=${1/#\~\//$HOME/}

center=0
if [[ ! -r $file ]]; then
    if [[ $file =~ ^(.+):([0-9]+)\ *$ ]] &&
        [[ -r ${BASH_REMATCH[1]} ]]; then

        file=${BASH_REMATCH[1]}
        center=${BASH_REMATCH[2]}
    elif [[ $file =~ ^(.+):([0-9]+):[0-9]+\ *$ ]] &&
        [[ -r ${BASH_REMATCH[1]} ]]; then

        file=${BASH_REMATCH[1]}
        center=${BASH_REMATCH[2]}
    fi
fi

type=$(file --brief --dereference --mime -- "$file")

if [[ ! $type =~ image/ ]]; then
    if [[ $type =~ =binary ]]; then
        file "$1"
        exit
    fi

    bat --style="${BAT_STYLE:-numbers}" \
        --color=always --pager=never \
        --highlight-line="${center:-0}" -- "$file"
    exit
fi

dim=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}
if [[ $dim = x ]]; then
    dim=$(stty size </dev/tty | awk '{print $2 "x" $1}')
fi

if [[ $KITTY_WINDOW_ID ]]; then
    # 1. 'memory' is the fastest option but if you want the image to be
    #    scrollable, you have to use 'stream'.
    #
    # 2. The last line of the output is the ANSI reset code without newline.
    #    This confuses fzf and makes it render scroll offset indicator.
    #    So we remove the last line and append the reset code to its previous
    #    line.
    kitten icat --clear --transfer-mode=memory \
        --unicode-placeholder --stdin=no \
        --place="$dim@0x0" "$file" | sed '$d' | sed $'$s/$/\e[m/'
else
    file "$file"
fi
