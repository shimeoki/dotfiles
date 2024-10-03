#!/bin/env sh

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.

_fzf_compgen_path() {
    eval "$FZF_CTRL_T_COMMAND" . "$1"
}

_fzf_compgen_dir() {
    eval "$FZF_ALT_C_COMMAND" . "$1"
}

