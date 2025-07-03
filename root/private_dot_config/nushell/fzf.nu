# module for fzf options.
# this file should be imported as 'use fzf.nu *' to import aliases.
# it also exports some environment variables.

export-env {
    $env.FZF_DEFAULT_COMMAND = 'fd --follow --hidden'
    $env.FZF_DEFAULT_OPTS_FILE = ('~/.config/fzf/opts' | path expand)
}

export alias f  = fzf
export alias fp = f --preview="fzf-preview.bash {}"
export alias fv = fp --bind="enter:become(nvim {})"
export alias fj = cd (fd --follow --hidden --type=dir | fp)
export alias fc = wl-copy (fp)
