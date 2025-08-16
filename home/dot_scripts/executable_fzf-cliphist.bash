#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    >&2 echo "usage: $0 <entry>"
    exit 1
fi

kitten icat --clear --transfer-mode=memory --stdin=no

entry=$1

if ! [[ $entry =~ \[\[\ binary\ data\ .*\ \]\] ]]; then
    echo "$entry" | cliphist decode | bat --color=always --pager=never
    exit
fi

rect=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0
echo "$entry" | cliphist decode |
    kitten icat --transfer-mode=memory --place="$rect"
