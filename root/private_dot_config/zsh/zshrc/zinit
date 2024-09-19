#!/bin/env zsh

# enable zinit
# install if not present
# source: https://github.com/zdharma-continuum/zinit?tab=readme-ov-file

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# enable plugins with zinit
# sources in order:
# https://github.com/zdharma-continuum/fast-syntax-highlighting
# https://github.com/zsh-users/zsh-completions
# https://github.com/zsh-users/zsh-autosuggestions
# snippet source: https://github.com/zdharma-continuum/fast-syntax-highlighting

zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    blockf \
        zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions
