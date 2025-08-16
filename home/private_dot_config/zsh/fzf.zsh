#!/usr/bin/env zsh

# some options borrowed from
# https://github.com/josean-dev/dev-environment-files

eval "$(fzf --zsh)"

_fzf_compgen_path() {
    eval "$FZF_CTRL_T_COMMAND" . "$1"
}

_fzf_compgen_dir() {
    eval "$FZF_ALT_C_COMMAND" . "$1"
}

_fzf_comprun() {
    command=$1
    shift

    case "$command" in
    export | unset) fzf --preview "eval 'echo \${}'" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview 'fzf-preview.bash {}' "$@" ;;
    esac
}
