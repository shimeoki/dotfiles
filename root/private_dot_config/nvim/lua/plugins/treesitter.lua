local enabled = true

local highlighters = require("config.highlighters")

local opts = {
	ensure_installed = highlighters.by_group.treesitter,
	highlight = {
		enable = highlighters.opts.enabled,
		additional_vim_regex_highlighting = false,
	},
}

local function init(plugin)
	require("lazy.core.loader").add_to_rtp(plugin)
	require("nvim-treesitter.query_predicates")
end

local function config()
	require("nvim-treesitter.configs").setup(opts)

	-- fix: currently custom filetypes in config.highlighters don't work
	vim.treesitter.language.register("css", "gtkcss")
end

-- source: https://www.lazyvim.org/plugins/treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	cond = enabled,
	name = "treesitter",
	main = "nvim-treesitter.configs",
	version = false, -- last release doesn't work on windows
	event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	build = ":TSUpdate",
	init = init,
	config = config,
}
