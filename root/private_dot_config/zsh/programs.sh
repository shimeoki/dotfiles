#!/bin/env sh

export ZSH_PROGRAMS="$ZDOTDIR/programs"

# shellcheck source=programs/eza.sh
. "$ZSH_PROGRAMS/eza.sh"

# shellcheck source=programs/fzf.sh
. "$ZSH_PROGRAMS/fzf.sh"

# shellcheck source=programs/gpg.sh
. "$ZSH_PROGRAMS/gpg.sh"

# shellcheck source=programs/oh-my-posh.sh
. "$ZSH_PROGRAMS/oh-my-posh.sh"

# shellcheck source=programs/zoxide.sh
. "$ZSH_PROGRAMS/zoxide.sh"
