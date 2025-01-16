local cfg = require("config.conform")

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = cfg.opts,
	init = cfg.set_formatexpr,
}
