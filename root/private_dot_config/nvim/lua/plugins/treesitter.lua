local enabled = true

local highlighters = {
	"lua",
	"go",
	"gomod",
	"gosum",
	"gotmpl",
	"java",
	"python",
	"bash",
	"markdown",
	"markdown_inline",
	"hyprlang",
	"html",
	"json",
	"jsonc",
	"toml",
	"cpp",
	"c",
	"nu",
	"javascript",
	"typescript",
	"yaml",
	"css",
	"vue",
	"vim",
	"regex",
}

local opts = {
	ensure_installed = highlighters,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

local function init(plugin)
	require("lazy.core.loader").add_to_rtp(plugin)
	require("nvim-treesitter.query_predicates")
end

local function config()
	require("nvim-treesitter.configs").setup(opts)

	vim.treesitter.language.register("css", "gtkcss")
end

-- source: https://www.lazyvim.org/plugins/treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	cond = enabled,
	main = "nvim-treesitter.configs",
	version = false, -- last release doesn't work on windows
	event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	build = ":TSUpdate",
	init = init,
	config = config,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
