#!/bin/env sh

# use fd

FD_OPTS="--hidden --exclude .git"

export FZF_DEFAULT_COMMAND="fd $FD_OPTS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d $FD_OPTS"

