# file with common environment variables.
# this file is not 'env.nu', because otherwise this file will be loaded early
# by nushell.
# this file should be sourced, because envs are not in 'export-env' block.

$env.PATH ++= ['~/.cargo/bin' '~/go/bin' '~/.scripts']

$env.VENV_HOME = '~/.venv'
$env.GPG_TTY = (tty)
$env.EZA_ICONS_AUTO = 1
$env.LS_COLORS = (vivid generate catppuccin-mocha)

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
