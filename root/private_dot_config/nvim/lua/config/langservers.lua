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

M:add({
	name = "volar",
	enabled = true,
	filetypes = { "vue" },
	aliases = {
		mason = "vue-language-server",
	},
	config = require("config.langservers.volar"),
})

M:add({
	name = "tsls",
	enabled = false, -- denols is used for js/ts and non-hybrid mode is used for vue
	filetypes = { "vue" },
	aliases = {
		mason = "typescript-language-server",
		lspconfig = "ts_ls",
	},
})

M:add({
	name = "cssls",
	enabled = true,
	filetypes = { "css" },
	aliases = {
		mason = "css-lsp",
	},
})

M:parse_groups({ "lspconfig", "mason" })

return M
