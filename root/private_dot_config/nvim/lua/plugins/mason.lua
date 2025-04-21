local enabled = true

local border = "rounded"

local ensure_installed = {}

local function add_installed(tools)
	for _, key in ipairs(tools) do
		table.insert(ensure_installed, key)
	end
end

add_installed(require("config.langservers").by_group.mason)
add_installed(require("linters").by_group.mason)
add_installed(require("formatters").by_group.mason)

local opts = {
	ui = { border = border },
}

local installer_opts = {
	ensure_installed = ensure_installed,
}

local installer = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	lazy = true,
	cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
	main = "mason-tool-installer",
	opts = installer_opts,
}

return {
	"williamboman/mason.nvim",
	cond = enabled,
	main = "mason",
	lazy = true,
	cmd = { "Mason" },
	build = ":MasonUpdate",
	opts = opts,
	dependencies = { installer },
}
