local M = {}

local highlighters = require("config.highlighters")

M.opts = {
	ensure_installed = highlighters.by_group.treesitter,
	highlight = {
		enable = highlighters.opts.enabled,
		additional_vim_regex_highlighting = false,
	},
}

function M.setup()
	require("nvim-treesitter.configs").setup(M.opts)

	-- fix: currently custom filetypes in config.highlighters don't work
	vim.treesitter.language.register("css", "gtkcss")
end

return M
