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

# history

$env.config.history = {
    file_format:   'sqlite'
    max_size:      1_000_000
    sync_on_enter: true
    isolation:     false
}

# miscellaneous

$env.config.show_banner = false

# commandline editor

$env.config.edit_mode = 'vi'
$env.config.buffer_editor = 'editor'
$env.config.cursor_shape = {
    emacs:     'inherit'
    vi_insert: 'line'
    vi_normal: 'underscore'
}

# completions

$env.config.completions.algorithm = 'fuzzy'

# terminal integration

$env.config.use_kitty_protocol = true
$env.config.use_ansi_coloring = true

# table

$env.config.footer_mode = 'auto'
$env.config.table.mode = 'rounded'

# prompt

# source: https://github.com/nushell/nushell/blob/main/crates/nu-utils/src/default_files/default_env.nu
# source: https://github.com/nushell/nu_scripts/blob/main/sourced/cool-oneliners/pwd-short.nu

$env.PROMPT_COMMAND = { $env.PWD | str replace $nu.home-path '~' }
$env.PROMPT_COMMAND_RIGHT = ''
$env.PROMPT_INDICATOR = " \n$ "
$env.PROMPT_INDICATOR_VI_NORMAL = " \n: "
$env.PROMPT_INDICATOR_VI_INSERT = " \n> "
$env.PROMPT_MULTILINE_INDICATOR = '~ '
# hack: https://github.com/nushell/reedline/issues/707

$env.TRANSIENT_PROMPT_COMMAND = ''
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = ''
$env.TRANSIENT_PROMPT_INDICATOR = '$ '
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = ': '
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = '> '
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = ''

# binds

source ./binds.nu

# zoxide
# source: https://github.com/ajeetdsouza/zoxide#installation

zoxide init nushell --cmd j | save -f ~/.zoxide.nu
