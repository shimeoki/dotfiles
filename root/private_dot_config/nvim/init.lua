require("binds")
require("options")
require("plugman")

-- todo move somewhere else
vim.diagnostic.config({
	float = { border = "rounded" },
})

-- theme
vim.cmd.colorscheme("catppuccin-mocha")
