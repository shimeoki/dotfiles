local enabled = true
local name = "catppuccin"

local integrations = {
	notify = true,
	noice = true,
	mason = true,
	which_key = true,
}

local opts = {
	integrations = integrations,
}

return {
	"catppuccin/nvim",
	cond = enabled,
	name = name,
	main = name,
	lazy = true,
	opts = opts,
	priority = 1000,
}
