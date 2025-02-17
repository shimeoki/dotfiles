local enabled = true
local name = "mason"
local name_installer = "mason-tool-installer"

local mason = require("config.plugins.mason")

local installer = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	name = name_installer,
	main = name_installer,
	opts = mason.installer_opts,
}

return {
	"williamboman/mason.nvim",
	cond = enabled,
	name = name,
	main = name,
	opts = mason.opts,
	dependencies = { installer },
}
