local M = {}

M.syntax_enabled = true
M.highlighting_enabled = true

-- enable or disable specific parsers
-- naming from nvim-treesitter
M.parsers = {
	lua = true,
	go = true,
	gomod = true,
	java = true,
}

M.parser_filetypes = {
	lua = { "lua" },
	go = { "go" },
	gomod = { "gomod" },
	java = { "java" },
}

local tables = require("tables")

M.enabled_parsers = tables.parse_enabled(M.parsers)
M.filetype_parsers = tables.parse_filetypes(M.parser_filetypes, M.parsers)

return M
