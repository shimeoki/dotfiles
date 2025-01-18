local cfg = require("config.lint")

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = cfg.init,
}
