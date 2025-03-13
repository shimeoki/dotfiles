local enabled = true
local name = "conform"

local conform = require("config.plugins.conform")

return {
	"stevearc/conform.nvim",
	name = name,
	main = name,
	cond = enabled,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = conform.setup,
	init = conform.init,
}
