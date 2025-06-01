$env.PATH ++= ['~/.cargo/bin' '~/go/bin']

$env.VENV_HOME = '~/.venv'
$env.GPG_TTY = (tty)
$env.EZA_ICONS_AUTO = 1

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'modules')
]

$env.config.show_banner = false

$env.config.edit_mode = 'vi'
$env.config.buffer_editor = 'editor'
$env.config.cursor_shape = {
    emacs:     'inherit'
    vi_insert: 'line'
    vi_normal: 'block'
}

$env.config.completions.algorithm = 'fuzzy'

$env.config.use_kitty_protocol = true
$env.config.use_ansi_coloring = true

$env.config.footer_mode = 'auto'
$env.config.table.mode = 'rounded'
