alias b = bat
alias bn = bat --number
alias bnl = bat --number --line-range
alias bp = bat --plain
alias bpl = bat --plain --line-range
alias bl = bat --line-range
alias h = batman

alias cz = chezmoi
alias czz = chezmoi apply
alias czj = chezmoi cd
alias cza = chezmoi add
alias czac = chezmoi add .

alias c = clear

alias e = exec $env.EDITOR
alias v = exec $env.VISUAL

alias l = eza
alias lo = eza --oneline
alias la = eza --all
alias ll = eza --long
alias lla = eza --long --all
alias lt = eza --tree
alias lta = eza --tree --all

alias ff = fastfetch
def cf [] { clear; fastfetch }

alias f = fzf

alias g = git
alias ga = git add
alias gac = git add .
alias gg = git status
alias gs = git switch
alias gsc = git switch --create
alias gr = git restore
alias gb = git branch
alias gba = git branch --all
alias gbm = git branch --move
alias gbd = git branch --delete
alias gl = git log
alias gls = git shortlog
alias glg = git log --graph
alias gla = git log --all
alias glga = git log --graph --all
alias gd = git diff
alias gdc = git diff --cached
alias gdh = git diff HEAD
alias gc = git commit
alias gca = git commit --all
alias gp = git push
alias gpa = git push --all
alias gpt = git push --tags
alias gt = git tag
alias gtl = git tag --list
alias gta = git tag --annotate
alias gtd = git tag --delete
alias gm = git merge
alias gmf = git merge --ff
alias gf = git fetch

alias hx = helix

# kitty
alias icat = kitten icat
alias s = kitten ssh

alias lg = lazygit

alias nv = nvim

alias pm = yay
alias pms = yay --sync
alias pml = yay --query
alias pmi = yay --query --info
alias pmr = yay --remove --recursive

alias waybar-toggle = killall -SIGUSR1 waybar
alias waybar-reload = killall -SIGUSR2 waybar

alias sbg = swww img

alias wific = nmcli device wifi connect
alias wifir = nmcli device wifi rescan
alias wifil = nmcli device wifi list

# cd / zoxide
alias jj = cd -

# hyprland
alias hlr = hyprctl reload
alias hle = hyprctl dispatch exec
alias hlm = hyprctl monitors
alias hlc = hyprctl clients

alias t = btop

# todo: could be a function with git-rev-parse
alias gw = ./gradlew

alias y = yazi-cwd
