# order is important
source ($nu.default-config-dir | path join 'themes' 'catppuccin-mocha.nu')
source ($nu.default-config-dir | path join 'yazi.nu')
source ($nu.default-config-dir | path join 'fzf.nu')
source ($nu.default-config-dir | path join 'aliases.nu')

# modules

# fix: lsp is angry
use task.nu

# zoxide

source ~/.zoxide.nu
