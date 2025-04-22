local enabled = true

local integrations = {
	notify = true,
	noice = true,
	mason = true,
	which_key = true,
	blink_cmp = true,
	telescope = { enabled = true },
}

local function custom_highlights(colors)
	return {
		LuaSnipChoice = { fg = colors.peach, bg = colors.none },
		LuaSnipInsert = { fg = colors.blue, bg = colors.none },
		WinSeparator = { fg = colors.base },
	}
end

local opts = {
	flavour = "mocha",
	background = { light = "latte", dark = "mocha" },
	show_end_of_buffer = false,
	integrations = integrations,
	custom_highlights = custom_highlights,
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
