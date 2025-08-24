# file with common aliases or custom functions that are used like aliases.
# this file should be sourced, because there are no export keywords.

alias b   = bat
alias bp  = bat --plain

alias h = batman

use modules/yazi.nu
alias y = yazi cwd-on-exit

use modules/zoxide.nu
alias j  = zoxide jump
alias ji = zoxide jumper

use modules/fzf.nu

alias cz   = chezmoi
alias cza  = chezmoi apply
alias czj  = chezmoi cd
alias czz  = chezmoi status

alias c = clear

alias e = run-external $env.EDITOR
alias v = run-external $env.VISUAL

alias l   = eza --oneline
alias la  = eza --oneline --all
alias ll  = eza --long
alias lla = eza --long --all
alias lt  = eza --tree
alias lta = eza --tree --all

alias ff = fastfetch
def cf [] { clear; fastfetch }

alias g = git

alias icat = kitten icat
alias s    = kitten ssh

alias lg = lazygit
alias lc = lazydocker

alias nv = nvim

alias wific = nmcli device wifi connect
alias wifir = nmcli device wifi rescan
alias wifil = nmcli device wifi list

alias hlr = hyprctl reload
alias hle = hyprctl dispatch exec
alias hlm = hyprctl monitors
alias hlc = hyprctl clients

alias ctl  = systemctl
alias sctl = sudo systemctl --system
alias uctl = systemctl --user

alias t = btop

alias leaks = gitleaks git
