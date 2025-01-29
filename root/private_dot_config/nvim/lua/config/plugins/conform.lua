local M = {}

local formatters = require("config.formatters")

M.opts = {
	formatters_by_ft = formatters.by_filetype,
}

if formatters.opts.on_save then
	M.opts.format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	}
end

function M.init()
	vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
end

return M
