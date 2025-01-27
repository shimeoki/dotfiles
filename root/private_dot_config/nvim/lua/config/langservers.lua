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

M:parse_groups({ "lspconfig", "mason" })

return M
