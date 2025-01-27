local ensure_installed = {}

local langservers = require("config.langservers")
for _, key in ipairs(langservers.by_group.mason) do
	table.insert(ensure_installed, key)
end

local linters = require("config.linters")
for _, key in ipairs(linters.by_group.mason) do
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
