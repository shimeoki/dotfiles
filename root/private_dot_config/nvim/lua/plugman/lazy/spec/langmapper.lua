local enabled = true
local name = "langmapper"

local langmapper = require("config.plugins.langmapper")

return {
	"Wansmer/langmapper.nvim",
	cond = enabled,
	name = name,
	main = name,
	lazy = false,
	priority = 1,
	opts = {},
	config = langmapper.config,
}
