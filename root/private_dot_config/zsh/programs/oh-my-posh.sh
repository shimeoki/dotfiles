#!/bin/env sh

# enable oh-my-posh
# source: https://ohmyposh.dev/docs/installation/prompt
OMP_CONFIG="$OMP_CONFIG_HOME/zen.toml"
eval "$(oh-my-posh init zsh --config $OMP_CONFIG)"

