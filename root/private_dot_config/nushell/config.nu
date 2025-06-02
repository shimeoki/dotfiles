use themes/catppuccin-mocha.nu

# the config uses mostly modules, because unneeded variables
# can be hidden from the global scope this way

source envs.nu
source aliases.nu

use prompt.nu []
use history.nu []

use fzf.nu *
use yazi.nu *
use zoxide.nu *

use modules/repo.nu
use modules/task.nu

# changes current directory 'dirs' times up
def --env up [dirs?: int = 1]: nothing -> nothing {
    let n: int = ([$dirs 1] | math max) + 1
    cd ('' | fill --character '.' --width $n)
}
