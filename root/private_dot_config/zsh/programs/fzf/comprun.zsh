#!/bin/env zsh

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd|j)         fzf --preview "$FZF_DIR_PREVIEW" "$@" ;;
        export|unset) fzf --preview "eval 'echo \${}'" "$@" ;;
        ssh)          fzf --preview 'dig {}'           "$@" ;;
        *)            fzf --preview "$FZF_PREVIEW"     "$@" ;;
    esac
}

