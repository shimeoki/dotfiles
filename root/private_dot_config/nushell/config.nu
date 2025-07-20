$env.GPG_TTY = (tty)
$env.NU_LIB_DIRS = [($nu.default-config-dir | path join 'modules')]

$env.config.show_banner = false

$env.config.edit_mode = 'vi'
$env.config.buffer_editor = 'editor'

$env.config.cursor_shape = {
    emacs:     'inherit'
    vi_insert: 'line'
    vi_normal: 'block'
}

$env.config.history = {
    file_format:   'sqlite'
    max_size:      1_000_000
    sync_on_enter: true
    isolation:     false
}

$env.config.completions.algorithm = 'fuzzy'

$env.config.use_kitty_protocol = true
$env.config.use_ansi_coloring = true

$env.config.footer_mode = 'auto'
$env.config.table.mode = 'single'

$env.config.display_errors = {
    exit_code:          false
    termination_signal: false
}

use themes/catppuccin-mocha.nu

source up.nu
source aliases.nu

use binds.nu []
use prompt.nu []

use fzf.nu *

use modules/repo.nu
use modules/task.nu
use modules/completions.nu []
