use themes/catppuccin-mocha.nu

# the config uses mostly modules, because unneeded variables
# can be hidden from the global scope this way

source envs.nu
source up.nu
source aliases.nu

use prompt.nu []

use fzf.nu *
use yazi.nu *
use zoxide.nu *

use modules/repo.nu
use modules/task.nu
use modules/bg.nu
