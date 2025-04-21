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
	enabled = false, -- doesn't work with vue well
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
	-- config = require("config.langservers.volar"),
})

M:add({
	name = "tsls",
	enabled = true,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
	aliases = {
		mason = "typescript-language-server",
		lspconfig = "ts_ls",
	},
	config = require("config.langservers.tsls"),
})

M:add({
	name = "cssls",
	enabled = true,
	filetypes = { "css" },
	aliases = {
		mason = "css-lsp",
	},
})

M:add({
	name = "texlab",
	enabled = true,
	filetypes = { "tex", "plaintex" },
})

M:add({
	name = "hyprls",
	enabled = true,
	filetypes = { "hyprlang" },
})

M:add({
	name = "gopls",
	enabled = true,
	filetypes = { "go" },
})

M:add({
	name = "dockerls",
	enabled = true,
	filetypes = { "dockerfile" },
	aliases = {
		mason = "dockerfile-language-server",
	},
})

M:parse_groups({ "lspconfig", "mason" })

return M
