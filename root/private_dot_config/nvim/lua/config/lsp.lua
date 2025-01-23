local M = {}

M.enabled = true
M.hints = true
M.lens = true
M.completions = true

M.servers = {
	luals = true,
	jdtls = true,
}

M.server_filetypes = {
	luals = { "lua" },
	jdtls = { "java" },
}

M.server_lspconfig_name = {
	luals = "lua_ls",
}

M.server_mason_name = {
	luals = "lua-language-server",
}

local tables = require("tables")

M.enabled_servers = tables.parse_enabled(M.servers)
M.filetype_servers = tables.parse_filetypes(M.server_filetypes, M.servers)
M.mason_ensure_installed = tables.parse_names(M.server_mason_name, M.servers)

return M
