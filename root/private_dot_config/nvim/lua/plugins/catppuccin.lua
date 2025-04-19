local enabled = true

local integrations = {
	notify = true,
	noice = true,
	mason = true,
	which_key = true,
	blink_cmp = true,
}

local opts = {
	integrations = integrations,
}

return {
	"catppuccin/nvim",
	cond = enabled,
	name = "catppuccin",
	main = "catppuccin",
	lazy = true,
	opts = opts,
	priority = 1000,
}
