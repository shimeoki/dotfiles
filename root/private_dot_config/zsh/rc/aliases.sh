#!/bin/env sh

# bat
alias b='bat'

# chezmoi
alias cz='chezmoi'
alias czj='chezmoi cd'
alias cza='chezmoi apply'

# clear
alias c='clear'

# env
alias e='$EDITOR'
alias v='$VISUAL'

# eza
alias l='eza'
alias la='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias lt='eza -T'
alias lta='eza -Ta'
alias ltl='eza_tree'

# fastfetch
alias ff='fastfetch'

# fzf
alias f='fzf'

# git
alias g='git'
alias ga='git add'
alias gg='git status'
alias gs='git switch'
alias gsc='git switch -c'
alias gr='git restore'
alias gb='git branch'
alias gba='git branch --all'
alias gbm='git branch --move'
alias gbd='git branch --delete'
alias gl='git log'
alias gls='git shortlog'
alias glg='git log --graph'
alias gla='git log --all'
alias glga='git log --graph --all'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gc='git commit'
alias gca='git commit --all'
alias gp='git push'
alias gpa='git push --all'
alias gpt='git push --tags'
alias gt='git tag'
alias gtn='git tag -n'
alias gta='git tag --annotate'
alias gtd='git tag --delete'
alias gm='git merge'
alias gmf='git merge --ff'
alias gf='git fetch'

# helix
alias hx='helix'

# kitty
alias icat='kitten icat'
alias s='kitten ssh'

# lazygit
alias lg='lazygit'

# neovim
alias nv='nvim'

# pacman
alias pm='pacman'

# sudo
alias sudo='sudo ' # blank space is a hack

# waybar
alias waybar-toggle='killall -SIGUSR1 waybar'
alias waybar-reload='killall -SIGUSR2 waybar'

# swww
alias sbg='swww img'

# nmcli
alias wific='nmcli device wifi connect'
alias wifir='nmcli device wifi rescan'

# zoxide
alias jj='j -'

# gradle
alias gw='./gradlew'
