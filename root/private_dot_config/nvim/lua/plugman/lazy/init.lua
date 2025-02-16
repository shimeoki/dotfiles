require("plugman.lazy.install")

local opts = require("plugman.lazy.opts")

require("lazy").setup({
	spec = { { import = opts.install.path } },
	install = {
		missing = opts.install.missing,
		colorscheme = { opts.ui.theme },
	},
	checker = { enabled = opts.check },
	ui = { border = opts.ui.border },
	rocks = { hererocks = true },
})
