local cfg = require("config.mason")

local main = {
	"williamboman/mason.nvim",
	main = "mason",
	opts = {},
	priority = 50, -- default
}

local lsp = {
	"williamboman/mason-lspconfig.nvim",
	main = "mason-lspconfig",
	opts = cfg.lsp.opts,
	priority = 40, -- load after main
}

local lint = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = cfg.lint.opts,
	priority = 40, -- load after main
}

return {
	main,
	lsp,
	lint,
}
