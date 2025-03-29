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
})

M:add({
	name = "clangd",
	enabled = true,
	filetypes = { "c", "cpp" },
})

M:add({
	name = "nushell",
	enabled = true,
	filetypes = { "nu" },
	aliases = {
		mason = "",
	},
})

M:add({
	name = "deno",
	enabled = true,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	aliases = {
		lspconfig = "denols",
	},
})

M:parse_groups({ "lspconfig", "mason" })

return M
