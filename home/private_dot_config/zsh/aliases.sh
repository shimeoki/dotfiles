#!/usr/bin/env sh

alias b='bat'
alias bp='bat --plain'

alias h='batman'

alias cz='chezmoi'
alias cza='chezmoi apply'
alias czj='chezmoi cd'
alias czz='chezmoi status'

alias c='clear'

alias e='$EDITOR'
alias v='$VISUAL'

# i really don't like reassigning binaries this way, but eza doesn't have a cfg
alias eza='eza \
    --color=always --icons=always \
    --ignore-glob=.git \
    --group-directories-first --no-quotes'

alias l='eza --oneline'
alias la='eza --oneline --all'
alias ll='eza --long'
alias lla='eza --long --all'
alias lt='eza --tree'
alias lta='eza --tree --all'

alias ff='fastfetch'
alias cf='clear && fastfetch'

alias g='git'

alias icat='kitten icat'
alias s='kitten ssh'

alias lg='lazygit'
alias lc='lazydocker'

alias nv='nvim'

alias sudo='sudo ' # blank space is a hack

alias wific='nmcli device wifi connect'
alias wifir='nmcli device wifi rescan'
alias wifil='nmcli device wifi list'

alias hlr='hyprctl reload'
alias hle='hyprctl dispatch exec'
alias hlm='hyprctl monitors'
alias hlc='hyprctl clients'

alias ctl='systemctl'
alias sctl='sudo systemctl --system'
alias uctl='systemctl --user'

alias t='btop'

alias leaks='gitleaks git'
