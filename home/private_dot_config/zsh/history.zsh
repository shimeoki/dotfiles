#!/usr/bin/env zsh

# source: https://zsh.sourceforge.io/Doc/Release/Options.html#History

HISTFILEDIR="$XDG_STATE_HOME"/zsh

# check for directory presence. make if doesn't exist
[ -d "$HISTFILEDIR" ] || mkdir "$HISTFILEDIR"

HISTFILE="$HISTFILEDIR"/history

HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt APPEND_HISTORY

# share history between instances
# and update history on the fly
setopt SHARE_HISTORY

# don't show duplicate lines
setopt HIST_FIND_NO_DUPS

# don't save duplicate commands
# old commands are deleted, new are written
setopt HIST_IGNORE_ALL_DUPS

# ignore commands starting with a space
setopt HIST_IGNORE_SPACE
