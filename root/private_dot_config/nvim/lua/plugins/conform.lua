local cfg = require("config.fmt")

local opts = {
	formatters_by_ft = cfg.filetype_formatters,
}

if cfg.format_on_save then
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
	cond = cfg.formatting_enabled,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = opts,
	init = init,
}
