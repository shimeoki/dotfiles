#!/usr/bin/env zsh

# some options borrowed from
# https://github.com/josean-dev/dev-environment-files

eval "$(fzf --zsh)"

# todo: borrow opts from nushell config

# catppuccin mocha theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

FD_OPTS="--hidden --exclude .git"
export FZF_DEFAULT_COMMAND="fd $FD_OPTS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d $FD_OPTS"

FZF_DIR_PREVIEW="eza --tree --color=always {} | head -200"
FZF_FILE_PREVIEW="bat -n --color=always --line-range :500 {}"
FZF_PREVIEW="if [ -d {} ]; then $FZF_DIR_PREVIEW; else $FZF_FILE_PREVIEW; fi"

export FZF_CTRL_T_OPTS="--preview '$FZF_PREVIEW'"
export FZF_ALT_C_OPTS="--preview '$FZF_DIR_PREVIEW'"

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
    cd | j) fzf --preview "$FZF_DIR_PREVIEW" "$@" ;;
    export | unset) fzf --preview "eval 'echo \${}'" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview "$FZF_PREVIEW" "$@" ;;
    esac
}

. "$ZDOTDIR/fzf-git.zsh"
