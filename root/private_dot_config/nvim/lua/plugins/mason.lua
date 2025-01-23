local import = require("import")
local log = require("log")

local ensure_installed = {}

local lsp = import.safe("config.lsp")
if not lsp then
	log.error("plugins.mason: no config.lsp module")
	return
end

for _, key in ipairs(lsp.mason_ensure_installed) do
	table.insert(ensure_installed, key)
end

local lint = import.safe("config.lint")
if not lint then
	log.error("plugins.mason: no config.lint module")
	return
end

for _, key in ipairs(lint.mason_ensure_installed) do
	table.insert(ensure_installed, key)
end

local installer = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	name = "mason-tool-installer",
	main = "mason-tool-installer",
	opts = {
		ensure_installed = ensure_installed,
	},
}

return {
	"williamboman/mason.nvim",
	name = "mason",
	main = "mason",
	opts = {
		ui = {
			border = "rounded",
		},
	},
	dependencies = {
		installer,
	},
}
