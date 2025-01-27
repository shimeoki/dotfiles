local formatters = require("config.formatters")

local opts = {
	formatters_by_ft = formatters.by_filetype,
}

if formatters.opts.on_save then
	opts.format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	}
end

local function init()
	vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
end

return {
	"stevearc/conform.nvim",
	cond = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = opts,
	init = init,
}
