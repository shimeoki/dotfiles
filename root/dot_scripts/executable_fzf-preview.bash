#!/usr/bin/env bash

# source: https://github.com/junegunn/fzf/blob/master/bin/fzf-preview.sh
#
# changes:
#
# - use only kitty image protocol
# - use bat for files
# - use eza for directories
# - remove center (line number) and ignored
# - remove sed hack
# - remove comments
# - don't use stty call
# - don't use unicode placeholders
# - don't specify bat style
# - formatting, refactoring and styling
# - more explicit extension

if [[ $# -ne 1 ]]; then
    >&2 echo "usage: $0 <file>"
    exit 1
fi

file=${1/#\~\//$HOME/}
type=$(file --brief --dereference --mime -- "$file")

if [[ $type =~ inode/ ]]; then
    eza --color=always --tree --all --git-ignore -- "$file"
    exit
fi

if [[ ! $type =~ image/ ]]; then
    if [[ $type =~ =binary ]]; then
        file "$1"
        exit
    fi

    bat --color=always --pager=never -- "$file"
    exit
fi

rect=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0
kitten icat --clear --transfer-mode=memory --stdin=no --place="$rect" -- "$file"
