#!/usr/bin/env sh

# source: https://superuser.com/a/819073
# slightly modified for posix compatibility

up() {
    if [ -z "$1" ]; then
        set -- 1
    fi

    builtin cd "$(printf "%0.s../" $(seq 1 "$1"))" || return 1
}
