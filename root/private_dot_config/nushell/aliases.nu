# file with common aliases or custom functions that are used like aliases.
# this file should be sourced, because there are no export keywords.

alias b   = bat
alias bn  = bat --number
alias bnl = bat --number --line-range
alias bp  = bat --plain
alias bpl = bat --plain --line-range
alias bl  = bat --line-range

alias h = batman

use modules/yazi.nu
alias y = yazi cwd-on-exit

use modules/zoxide.nu
alias j  = zoxide jump
alias ji = zoxide jumper
alias jj = cd -

use modules/fzf.nu
alias f   = fzf
alias fp  = fzf preview
alias fe  = fzf edit
alias fj  = fzf jump
alias fi  = fzf img
alias fcf = fzf copyfile
alias fcp = fzf copypath

alias cz   = chezmoi
alias czz  = chezmoi apply
alias czj  = chezmoi cd
alias cza  = chezmoi add
alias czac = chezmoi add .
alias czd  = chezmoi diff
alias czs  = chezmoi status

alias c = clear

alias e = run-external $env.EDITOR
alias v = run-external $env.VISUAL

alias l   = eza
alias lo  = eza --oneline
alias la  = eza --all
alias ll  = eza --long
alias lla = eza --long --all
alias lt  = eza --tree
alias lta = eza --tree --all

alias ff = fastfetch
def cf [] { clear; fastfetch }

alias g    = git
alias ga   = git add
alias gac  = git add .
alias gg   = git status
alias ggs  = git status --short
alias gs   = git switch
alias gsc  = git switch --create
alias gr   = git restore
alias gb   = git branch
alias gba  = git branch --all
alias gbm  = git branch --move
alias gbd  = git branch --delete
alias gl   = git log
alias gls  = git shortlog
alias glg  = git log --graph
alias gla  = git log --all
alias glga = git log --graph --all
alias gd   = git diff
alias gdc  = git diff --cached
alias gdh  = git diff HEAD
alias gc   = git commit
alias gca  = git commit --all
alias gp   = git push
alias gpa  = git push --all
alias gpd  = git push --delete
alias gu   = git pull
alias gt   = git tag
alias gtn  = git tag -n
alias gta  = git tag --annotate
alias gtd  = git tag --delete
alias gm   = git merge
alias gmf  = git merge --ff
alias gf   = git fetch

alias icat = kitten icat
alias s    = kitten ssh

alias lg = lazygit
alias lc = lazydocker

alias nv = nvim

alias pm  = yay
alias pms = yay --sync
alias pml = yay --query
alias pmi = yay --query --info
alias pmr = yay --remove --recursive

alias wific = nmcli device wifi connect
alias wifir = nmcli device wifi rescan
alias wifil = nmcli device wifi list

alias hlr = hyprctl reload
alias hle = hyprctl dispatch exec
alias hlm = hyprctl monitors
alias hlc = hyprctl clients

alias t = btop

# todo: could be a function with git-rev-parse
alias gw = ./gradlew

# todo: could be a function with dynamic venv path
alias venv = overlay use .venv/bin/activate.nu

alias leaks = gitleaks detect
