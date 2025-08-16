#!/usr/bin/env sh

eza_tree() {
    make_eza_tree() {
        printf "eza %s --tree --level=%d" "$1" "$2"
    }

    if [ -d "$1" ]; then
        if [ -z "$2" ]; then
            eval "$(make_eza_tree "$1" 1)"
        else
            eval "$(make_eza_tree "$1" "$2")"
        fi
    else
        eza_tree . "$1"
    fi
}
