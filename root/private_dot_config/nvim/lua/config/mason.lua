local M = {}

M.lsp = {}
M.lint = {}

M.lsp.opts = {
	ensure_installed = require("config.lsp").list,
}

M.lint.opts = {
	ensure_installed = require("config.lint").list,
}

return M
