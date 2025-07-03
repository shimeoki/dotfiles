#!/usr/bin/env zsh

# some options borrowed from
# https://github.com/josean-dev/dev-environment-files

eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/opts"

export FZF_DEFAULT_COMMAND="fd --hidden --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=dir"

export FZF_CTRL_T_OPTS="--height=100% --preview='fzf-preview.bash {}'"
export FZF_ALT_C_OPTS="$FZF_CTRL_T_OPTS"

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
