local lint = require("config.plugins").lint

return {
	"mfussenegger/nvim-lint",
	name = lint.name,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	cond = lint.enabled,
	config = lint.config.setup,
}
