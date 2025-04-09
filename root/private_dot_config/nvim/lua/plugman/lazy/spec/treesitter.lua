local enabled = true
local name = "treesitter"

local treesitter = require("config.plugins").treesitter

-- source: https://www.lazyvim.org/plugins/treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	cond = enabled,
	name = name,
	main = "nvim-treesitter.configs",
	version = false, -- last release doesn't work on windows
	event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	build = ":TSUpdate",
	config = treesitter.config.setup,
}
