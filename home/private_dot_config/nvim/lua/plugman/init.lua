local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(path) then
	require("plugman.install")(path)
end

vim.opt.rtp:prepend(path)

local disabled_builtin_plugins = {
	-- keep-sorted start
	"editorconfig",
	"gzip",
	"man",
	"matchit",
	"matchparen",
	"netrwPlugin",
	"osc52",
	"shada",
	"spellfile",
	"tarPlugin",
	"tohtml",
	"tutor",
	"zipPlugin",
	-- keep-sorted end
}

local opts = {
	defaults = { lazy = true },
	spec = require("plugman.spec"),
	install = { colorscheme = { "catppuccin" } },
	ui = {
		size = { width = 0.9, height = 0.9 },
		wrap = true,
		backdrop = 0,
	},
	checker = { enabled = false },
	rocks = { hererocks = true },
	change_detection = { enabled = false },
	performance = {
		cache = { enabled = true },
		reset_packpath = true,
		rtp = {
			reset = true,
			disabled_plugins = disabled_builtin_plugins,
		},
	},
}

require("lazy").setup(opts)
