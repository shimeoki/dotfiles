# module for fzf commands

export def --wrapped preview [...rest: string]: any -> any {
    fzf --preview 'fzf-preview.bash {}' ...$rest
}

export def --wrapped edit [...rest: string]: nothing -> any {
    fd --follow --hidden --type=file
    | preview --bind 'enter:become(nvim {})' ...$rest
}

export def --wrapped --env jump [...rest: string]: nothing -> nothing {
    fd --follow --hidden --type=dir
    | preview --no-multi ...$rest
    | cd $in
}

export def --wrapped copypath [...rest: string]: nothing -> any {
    wl-copy (preview ...$rest)
}

export def --wrapped copyfile [...rest: string]: nothing -> any {
    fd --follow --hidden --type=file
    | preview --no-multi ...$rest
    | if ($in | is-not-empty) { bat $in | wl-copy }
}

export def --wrapped copyhist [...rest: string]: nothing -> any {
    cliphist list
    | fzf --no-sort --no-multi --preview 'fzf-cliphist.bash {}' ...$rest
    | if ($in | is-not-empty) { $in | cliphist decode | wl-copy }
}

export def --wrapped copycmd [...rest: string]: nothing -> any {
    history
    | sort-by start_timestamp --reverse
    | get command
    | uniq
    | to text
    | fzf --no-sort --no-multi
    | str trim
    | wl-copy
}

export def --wrapped img [...rest: string]: nothing -> any {
    fd --follow --hidden -e=jpg -e=png
    | preview ...$rest
    | lines
    | if ($in | is-not-empty) { imv ...$in }
}

export def --wrapped setimg [...rest: string]: any -> any {
    fd --follow --hidden -e=jpg -e=png -e=gif
    | preview --no-multi ...$rest
    | if ($in | is-not-empty) { swww img $in }
}

export def --wrapped focus [...rest: string]: nothing -> any {
    niri msg --json windows
    | from json
    | each {|w| $"($w.id) ($w.title) / ($w.app_id)" }
    | to text
    | fzf --no-multi --accept-nth=1 ...$rest
    | if ($in | is-not-empty) { niri msg action focus-window --id $in }
}
