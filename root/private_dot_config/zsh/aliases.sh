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

alias l='eza'
alias la='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias lt='eza -T'
alias lta='eza -Ta'

alias ff='fastfetch'
alias cf='clear && fastfetch'

alias g='git'
alias ga='git add'
alias gac='git add .'
alias gg='git status'
alias ggs='git status --short'
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
alias glp='git log --graph --all --oneline'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gc='git commit'
alias gca='git commit --all'
alias gp='git push'
alias gpa='git push --all'
alias gpd='git push --delete'
alias gu='git pull'
alias gt='git tag'
alias gtn='git tag -n'
alias gta='git tag --annotate'
alias gtd='git tag --delete'
alias gm='git merge'
alias gmf='git merge --ff'
alias gf='git fetch'

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

alias t='btop'

alias leaks='gitleaks git'
