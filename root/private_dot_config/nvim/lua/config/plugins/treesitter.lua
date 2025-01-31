local M = {}

local highlighters = require("config.highlighters")

M.opts = {
	ensure_installed = highlighters.by_group.treesitter,
	highlight = {
		enable = highlighters.opts.enabled,
		additional_vim_regex_highlighting = false,
	},
}

return M
