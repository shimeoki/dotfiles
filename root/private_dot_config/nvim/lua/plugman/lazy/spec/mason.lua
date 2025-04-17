local enabled = true

local border = "rounded"

local ensure_installed = {}

local function add_installed(tools)
	for _, key in ipairs(tools) do
		table.insert(ensure_installed, key)
	end
end

add_installed(require("config.langservers").by_group.mason)
add_installed(require("config.linters").by_group.mason)
add_installed(require("config.formatters").by_group.mason)

local opts = {
	ui = { border = border },
}

local installer_opts = {
	ensure_installed = ensure_installed,
}

local installer = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	name = "mason-tool-installer",
	main = "mason-tool-installer",
	opts = installer_opts,
}

return {
	"williamboman/mason.nvim",
	cond = enabled,
	name = "mason",
	main = "mason",
	lazy = true,
	cmd = { "Mason" },
	event = "VeryLazy",
	build = ":MasonUpdate",
	opts = opts,
	dependencies = { installer },
}
