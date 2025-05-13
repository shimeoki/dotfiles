#!/bin/env sh

# venv v1.0.0
#
# my posix-compatible fork of venv wrapper script from these two sources:
#
# - https://gist.github.com/dbtek/fb2ddccb18f0cf63a654ea2cc94c8f19
# - https://gist.github.com/benlubas/5b5e38ae27d9bb8b5c756d8371e238e6
#
# this gist is a mirror of functions/venv.sh from shimeoki/dotfiles repository.
# because of this, the gist can be outdated. in this case, please notify me
# and/or look the upstream in the repository mentioned above.

export VENV_HOME="$HOME/.venv"
[ -d "$VENV_HOME" ] || mkdir "$VENV_HOME"

lsvenv() {
    ls -1 "$VENV_HOME" || return 1
    return 0
}

venv() {
    if [ $# -eq 0 ]; then
        echo "error: no name provided"
        return 1
    fi

    venv_path="$VENV_HOME/$1"

    if ! [ -d "$venv_path" ]; then
        echo "warn: '$1' does not exist"
        printf "create? (Y/y): "

        read -r reply

        case "$reply" in
        Y | y) mkvenv "$1" ;;
        *) echo "error: creation cancelled" && return 1 ;;
        esac
    fi

    # shellcheck source=/dev/null
    . "$venv_path/bin/activate" || return 1
    return 0
}

mkvenv() {
    if [ $# -eq 0 ]; then
        echo "error: no name provided"
        return 1
    fi

    venv_path="$VENV_HOME/$1"

    if [ -d "$venv_path" ]; then
        echo "error: '$1' exists"
        return 1
    fi

    python3 -m venv "$venv_path" || return 1
    return 0
}

cdvenv() {
    if [ $# -eq 0 ]; then
        echo "error: no name provided"
    fi

    venv_path="$VENV_HOME/$1"

    if ! [ -d "$venv_path" ]; then
        echo "error: '$1' does not exist"
        return 1
    fi

    cd "$venv_path" || return 1
    return 0
}

rmvenv() {
    if [ $# -eq 0 ]; then
        echo "error: no name provided"
        return 1
    fi

    venv_path="$VENV_HOME/$1"

    if ! [ -d "$venv_path" ]; then
        echo "error: '$1' does not exist"
        return 1
    fi

    current_venv=$(basename "${VIRTUAL_ENV:-}")

    if [ "$1" = "$current_venv" ]; then
        echo "info: deactivating current venv"
        deactivate
    fi

    rm -rf "$venv_path" || return 1
    return 0
}
