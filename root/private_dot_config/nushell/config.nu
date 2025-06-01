use themes/catppuccin-mocha.nu

# the config uses mostly modules, because unneeded variables
# can be hidden from the global scope this way

# not modules (files to be sourced)
source envs.nu
source aliases.nu

# modules with no exports (envs)
use prompt.nu
use history.nu

# modules with exports (aliases, functions)
use fzf.nu *
use yazi.nu *
use zoxide.nu *

# custom modules (with exports and prefix for them)
use modules/repo.nu

# changes current directory 'dirs' times up
def --env up [dirs?: int = 1]: nothing -> nothing {
    let n: int = ([$dirs 1] | math max) + 1
    cd ('' | fill --character '.' --width $n)
}

