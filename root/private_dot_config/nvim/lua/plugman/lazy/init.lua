local path = "plugman.lazy."

require(path .. "install")
local opts = require(path .. "opts")

require("lazy").setup({
	spec = { { import = path .. "spec" } },
	install = {
		missing = opts.install.missing,
		colorscheme = { opts.ui.theme },
	},
	checker = { enabled = opts.check },
	ui = { border = opts.ui.border },
	rocks = { hererocks = true },
})
