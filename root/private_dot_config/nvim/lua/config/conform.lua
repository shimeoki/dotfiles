local M = {}

M.opts = {
	formatters_by_ft = {
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
}

function M.set_formatexpr()
	vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
end

return M
