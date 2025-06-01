use prompt.nu
use history.nu

# custom

$env.VENV_HOME = '~/.venv'
$env.GPG_TTY = (tty)

const cargo_path = '~/.cargo/bin'
const go_path = '~/go/bin'
$env.PATH = ($env.PATH | append [$cargo_path $go_path])

$env.EZA_ICONS_AUTO = 1

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'modules')
]

# miscellaneous

$env.config.show_banner = false

# commandline editor

$env.config.edit_mode = 'vi'
$env.config.buffer_editor = 'editor'
$env.config.cursor_shape = {
    emacs:     'inherit'
    vi_insert: 'line'
    vi_normal: 'block'
}

# completions

$env.config.completions.algorithm = 'fuzzy'

# terminal integration

$env.config.use_kitty_protocol = true
$env.config.use_ansi_coloring = true

# table

$env.config.footer_mode = 'auto'
$env.config.table.mode = 'rounded'
