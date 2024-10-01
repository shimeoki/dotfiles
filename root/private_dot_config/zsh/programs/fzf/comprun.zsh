#!/bin/env zsh

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.

FZF_COMMAND_PREVIEW="fzf --preview"

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           "$FZF_COMMAND_PREVIEW '$FZF_DIR_PREVIEW'" "$@" ;;
        export|unset) "$FZF_COMMAND_PREVIEW "eval 'echo \${}'"" "$@" ;;
        ssh)          "$FZF_COMMAND_PREVIEW 'dig {}'"           "$@" ;;
        *)            "$FZF_COMMAND_PREVIEW '$FZF_PREVIEW'"     "$@" ;;
    esac
}

