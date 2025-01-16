local cfg = require("config.treesitter")

return {
	"nvim-treesitter/nvim-treesitter",
	main = "nvim-treesitter.configs",
	build = ":TSUpdate",
	opts = cfg.opts,
}
