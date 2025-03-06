#!/bin/env sh

export ZSH_PROGRAMS_FZF="$ZSH_PROGRAMS/fzf"

# some options borrowed from
# https://github.com/josean-dev/dev-environment-files

# init
eval "$(fzf --zsh)"

# theme
# shellcheck source=fzf/themes/catppuccin-mocha.sh
. "$ZSH_PROGRAMS_FZF/themes/catppuccin-mocha.sh"

# use fd
FD_OPTS="--hidden --exclude .git"
export FZF_DEFAULT_COMMAND="fd $FD_OPTS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d $FD_OPTS"

# git
# shellcheck source=fzf/git.zsh
. "$ZSH_PROGRAMS_FZF/git.zsh"

# preview
FZF_DIR_PREVIEW="eza --tree --color=always {} | head -200"
FZF_FILE_PREVIEW="bat -n --color=always --line-range :500 {}"
FZF_PREVIEW="if [ -d {} ]; then $FZF_DIR_PREVIEW; else $FZF_FILE_PREVIEW; fi"

# opts
export FZF_CTRL_T_OPTS="--preview '$FZF_PREVIEW'"
export FZF_ALT_C_OPTS="--preview '$FZF_DIR_PREVIEW'"

# compgen

_fzf_compgen_path() {
    eval "$FZF_CTRL_T_COMMAND" . "$1"
}

_fzf_compgen_dir() {
    eval "$FZF_ALT_C_COMMAND" . "$1"
}

# comprun

_fzf_comprun() {
    command=$1
    shift

    case "$command" in
    cd | j) fzf --preview "$FZF_DIR_PREVIEW" "$@" ;;
    export | unset) fzf --preview "eval 'echo \${}'" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview "$FZF_PREVIEW" "$@" ;;
    esac
}
