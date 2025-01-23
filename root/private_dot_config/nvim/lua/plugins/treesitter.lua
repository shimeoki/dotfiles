local cfg = require("config.syntax")

local opts = {
	ensure_installed = cfg.enabled_parsers,
	highlight = {
		enable = cfg.highlighting_enabled,
		additional_vim_regex_highlighting = false,
	},
}

-- source: https://www.lazyvim.org/plugins/treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	main = "nvim-treesitter.configs",
	version = false, -- last release doesn't work on windows
	cond = cfg.syntax_enabled,
	event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	build = ":TSUpdate",
	opts = opts,
}
