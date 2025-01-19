local M = {}

-- enable or disable all formatting
M.formatting_enabled = true
-- enable or disable format on save
M.format_on_save = true

-- enable or disable specific formatters
-- naming from conform.nvim
M.formatters = {
	stylua = true,
	goimports = true,
	gofmt = false,
}

M.formatter_filetypes = {
	stylua = { "lua" },
	goimports = { "go" },
	gofmt = { "go" },
}

local tables = require("tables")

M.enabled_formatters = tables.parse_enabled(M.formatters)
M.filetype_formatters = tables.parse_filetypes(M.formatter_filetypes, M.formatters)

return M
