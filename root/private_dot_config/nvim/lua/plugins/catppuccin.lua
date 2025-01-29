local enabled = true
local name = "catppuccin"

local catppuccin = require("config.plugins.catppuccin")

return {
	"catppuccin/nvim",
	cond = enabled,
	name = name,
	main = name,
	lazy = true,
	opts = catppuccin.opts,
	priority = 1000,
}
