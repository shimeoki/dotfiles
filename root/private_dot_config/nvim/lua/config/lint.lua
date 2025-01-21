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

M.linter_mason_name = {
	golangcilint = "golangci-lint",
}

local tables = require("tables")

M.enabled_linters = tables.parse_enabled(M.linters)
M.filetype_linters = tables.parse_filetypes(M.linter_filetypes, M.enabled_linters)
M.mason_ensure_installed = tables.parse_names(M.linter_mason_name, M.linters)

return M
