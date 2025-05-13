#!/usr/bin/env sh

deattach() {
    if [ -z "$1" ]; then
        echo "usage: deattach <command> <arg1> ... <argN>"
        return 1
    fi

    cmd="$1"
    shift

    nohup "$cmd" "$@" >/dev/null 2>&1 &
    echo "running deattached '$cmd'"

    return 0
}
