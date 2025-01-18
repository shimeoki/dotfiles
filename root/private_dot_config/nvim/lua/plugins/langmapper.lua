local cfg = require("config.langmapper")

return {
	"Wansmer/langmapper.nvim",
	lazy = false,
	priority = 1,
	opts = {},
	config = cfg.init,
}
