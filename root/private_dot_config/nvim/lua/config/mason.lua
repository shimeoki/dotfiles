local M = {}

M.home = vim.env.HOME .. "/.local/share/nvim/mason"

M.lsp = {}
M.lint = {}

M.lsp.opts = {
	ensure_installed = require("config.lsp").list,
}

M.lint.opts = {
	ensure_installed = require("config.lint").mason_ensure_installed,
}

return M
