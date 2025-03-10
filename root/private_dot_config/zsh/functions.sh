#!/bin/env sh

export ZSH_FUNCTIONS="$ZDOTDIR/functions"

# shellcheck source=functions/eza-tree.sh
. "$ZSH_FUNCTIONS/eza-tree.sh"

# shellcheck source=functions/up.sh
. "$ZSH_FUNCTIONS/up.sh"

# shellcheck source=functions/y.zsh
. "$ZSH_FUNCTIONS/y.zsh"

# shellcheck source=functions/venv.sh
. "$ZSH_FUNCTIONS/venv.sh"

# shellcheck source=functions/deattach.sh
. "$ZSH_FUNCTIONS/deattach.sh"
