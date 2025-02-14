local M = require("toolbox").new({
	enabled = true,
	hints = true,
	lens = true,
	completions = true,
})

M:add({
	name = "luals",
	enabled = true,
	filetypes = { "lua" },
	aliases = {
		lspconfig = "lua_ls",
		mason = "lua-language-server",
	},
	config = require("config.langservers.luals"),
})

M:add({
	name = "jdtls",
	enabled = true,
	filetypes = { "java" },
	config = require("config.langservers.jdtls"),
})

M:add({
	name = "jedi_language_server",
	enabled = true,
	filetypes = { "python" },
	aliases = {
		lspconfig = "jedi_language_server",
		mason = "jedi-language-server",
	},
})

M:add({
	name = "ruff",
	enabled = true,
	filetypes = { "python" },
	config = require("config.langservers.ruff"),
})

M:add({
	name = "bashls",
	enabled = true,
	filetypes = { "sh", "zsh", "bash" },
	aliases = {
		mason = "bash-language-server",
	},
	config = require("config.langservers.bashls"),
})

M:parse_groups({ "lspconfig", "mason" })

return M
