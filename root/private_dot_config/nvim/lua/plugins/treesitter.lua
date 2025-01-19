local cfg = require("config.syntax")

local opts = {
	ensure_installed = cfg.enabled_parsers,
	highlight = { enable = cfg.highlighting_enabled },
}

return {
	"nvim-treesitter/nvim-treesitter",
	main = "nvim-treesitter.configs",
	cond = cfg.syntax_enabled,
	build = ":TSUpdate",
	opts = opts,
}
