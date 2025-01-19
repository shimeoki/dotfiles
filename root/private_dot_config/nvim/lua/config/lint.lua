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

M.mason_ensure_installed = {}
local mason_name

for linter, enabled in pairs(M.linters) do
	if enabled then
		mason_name = M.linter_mason_name[linter]
		if not mason_name then
			mason_name = linter
		end

		table.insert(M.mason_ensure_installed, mason_name)
	end
end

local tables = require("tables")

M.enabled_linters = tables.parse_enabled(M.linters)
M.filetype_linters = tables.parse_filetypes(M.linter_filetypes, M.enabled_linters)

return M
