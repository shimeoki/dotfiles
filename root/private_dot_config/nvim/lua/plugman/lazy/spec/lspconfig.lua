local lspconfig = require("config.plugins").lspconfig

return {
	"neovim/nvim-lspconfig",
	cond = lspconfig.enabled,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = lspconfig.config.opts,
	config = lspconfig.config.setup,
}
