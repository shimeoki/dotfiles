# module for fzf keybindings and options.
# this file should be imported as 'use fzf.nu *' to import aliases.
# it also exports some environment variables.

const source_cmd = 'fd --follow --hidden --exclude .git'

const dir_preview = 'eza --color always --tree {} | head -200'
const dir_cmd = $"cd \(
    ($source_cmd) --type dir | fzf --preview '($dir_preview)' \)"

const file_preview = 'bat --color always --number --line-range :200 {}'
const file_cmd = $"($source_cmd) --type file
    | fzf --preview '($file_preview)' --bind 'enter:become\(nvim {}\)'"

const modes = [vi_normal vi_insert]

const file = {
    name: fzf_file
    modifier: control
    keycode: char_f
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: $file_cmd
    }
}

const dir = {
    name: fzf_dir
    modifier: control_shift
    keycode: char_f
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: $dir_cmd
    }
}

const opts = '
--color bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
--color fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
--color selected-bg:#45475a
--multi
--bind J:preview-half-page-down,K:preview-half-page-up,T:toggle-preview
--style full --reverse
--preview-window "right,60%,wrap,<80(down,50%,wrap)"
' | str replace "\n" ' '

export-env {
    $env.config.keybindings ++= [$file $dir]

    $env.FZF_DEFAULT_OPTS = $opts
}

export alias f = fzf
