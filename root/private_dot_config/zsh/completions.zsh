#!/usr/bin/env zsh

# source: https://wiki.archlinux.org/title/Zsh#Command_completion

# enable completions
autoload -Uz compinit && compinit

# add arrow keys
zstyle ':completion:*' menu select

# completions in privileged commands
zstyle ':completion::complete:*' gain-privileges 1
