#!/bin/env sh

export ZSH_PROGRAMS_FZF="$ZSH_PROGRAMS/fzf"

# fzf
eval "$(fzf --zsh)"

# git
source "$ZSH_PROGRAMS_FZF/git.zsh"

# theme
source "$ZSH_PROGRAMS_FZF/theme.sh"

