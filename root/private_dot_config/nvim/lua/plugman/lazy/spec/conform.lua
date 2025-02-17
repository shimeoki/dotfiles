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
	opts = conform.opts,
	init = conform.init,
}
