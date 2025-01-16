local cfg = require("config.mason")

local main = {
	"williamboman/mason.nvim",
	main = "mason",
	opts = {},
	priority = 50, -- default
}

local lspconfig = {
	"williamboman/mason-lspconfig.nvim",
	main = "mason-lspconfig",
	opts = cfg.lsp.opts,
	priority = 40, -- load after main
}

return {
	main,
	lspconfig,
}
