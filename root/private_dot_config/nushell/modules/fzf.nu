# module for fzf commands and options.
# it also exports some environment variables.

export def --wrapped preview [...rest: string]: any -> any {
    fzf --preview 'fzf-preview.bash {}' ...$rest
}

export def --wrapped editor [...rest: string]: any -> any {
    preview --bind 'enter:become(nvim {})' ...$rest
}

export def --wrapped --env jump [...rest: string]: nothing -> nothing {
    cd (fd --follow --hidden --type=dir | preview ...$rest)
}

export def --wrapped copy [...rest: string]: nothing -> any {
    wl-copy (preview ...$rest)
}

export-env {
    $env.FZF_DEFAULT_COMMAND = 'fd --follow --hidden'
    $env.FZF_DEFAULT_OPTS_FILE = ('~/.config/fzf/opts' | path expand)
}
