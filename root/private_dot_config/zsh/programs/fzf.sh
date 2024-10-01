#!/bin/env sh

export ZSH_PROGRAMS_FZF="$ZSH_PROGRAMS/fzf"

# some options borrowed from
# https://github.com/josean-dev/dev-environment-files

# fzf
eval "$(fzf --zsh)"

source "$ZSH_PROGRAMS_FZF/commands.sh"
source "$ZSH_PROGRAMS_FZF/preview.sh"
source "$ZSH_PROGRAMS_FZF/opts.sh"
source "$ZSH_PROGRAMS_FZF/compgen.sh"
source "$ZSH_PROGRAMS_FZF/comprun.zsh"
source "$ZSH_PROGRAMS_FZF/git.zsh"
source "$ZSH_PROGRAMS_FZF/theme.sh"

