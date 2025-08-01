# module for fzf commands and options.
# it also exports some environment variables.

export def --wrapped preview [...rest: string]: any -> any {
    fzf --preview 'fzf-preview.bash {}' ...$rest
}

export def --wrapped edit [...rest: string]: any -> any {
    preview --bind 'enter:become(nvim {})' ...$rest
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

export-env {
    $env.FZF_DEFAULT_COMMAND = 'fd --follow --hidden'
    $env.FZF_DEFAULT_OPTS_FILE = ('~/.config/fzf/opts' | path expand)
}
