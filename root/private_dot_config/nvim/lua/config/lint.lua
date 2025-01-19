local M = {}

-- enable or disable all linters
M.lint_enabled = true

-- enable or disable specific linters
-- naming from nvim-lint
M.linters = {
	luacheck = true,
	golangcilint = true,
}

-- events to trigger lint
M.lint_events = {
	"BufEnter",
	"BufWritePost",
	"InsertLeave",
}

M.linter_filetypes = {
	luacheck = { "lua" },
	golangcilint = { "go" },
}

local tables = require("tables")

M.enabled_linters = tables.parse_enabled(M.linters)
M.filetype_linters = tables.parse_filetypes(M.linter_filetypes, M.enabled_linters)

return M
