const modes = [vi_normal vi_insert]

# fzf

const fzf_source_cmd = 'fd --hidden --exclude .git'

const fzf_dir_preview = 'eza --tree --color=always {} | head -200'
const fzf_file_preview = 'bat -n --color=always --line-range :500 {}'

# not used, just in case
const fzf_preview = $"if \({} | path type\) == dir \{ ($fzf_dir_preview) \} else ($fzf_file_preview)"

const fzf_file = {
    name: fzf_file
    modifier: control
    keycode: char_f
    mode: $modes
    event: {
        send: ExecuteHostCommand
        cmd: $"nvim \(
            ($fzf_source_cmd) --type=file
            | fzf --preview '($fzf_file_preview)'
        \)"
    }
}

const fzf_dir = {
    name: fzf_dir
    modifier: control_shift
    keycode: char_f
    mode: $modes
    event: {
        send: ExecuteHostCommand,
        cmd: $"cd \(
            ($fzf_source_cmd) --type=dir
            | fzf --preview '($fzf_dir_preview)'
        \)"
    }
}

$env.config.keybindings = [
    $fzf_file
    $fzf_dir
]
