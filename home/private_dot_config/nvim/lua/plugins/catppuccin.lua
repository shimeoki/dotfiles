local function highlights(colors)
	return {
		-- luasnip
		LuaSnipChoice = { fg = colors.peach, bg = colors.none },
		LuaSnipInsert = { fg = colors.blue, bg = colors.none },
		-- nvim-notify
		NotifyBackground = { link = "NormalFloat" },
		NotifyERRORBody = { link = "NormalFloat" },
		NotifyWARNBody = { link = "NormalFloat" },
		NotifyINFOBody = { link = "NormalFloat" },
		NotifyDEBUGBody = { link = "NormalFloat" },
		NotifyTRACEBody = { link = "NormalFloat" },
		NotifyERRORBorder = { fg = colors.mantle, bg = colors.mantle },
		NotifyWARNBorder = { fg = colors.mantle, bg = colors.mantle },
		NotifyINFOBorder = { fg = colors.mantle, bg = colors.mantle },
		NotifyDEBUGBorder = { fg = colors.mantle, bg = colors.mantle },
		NotifyTRACEBorder = { fg = colors.mantle, bg = colors.mantle },
		-- molten-nvim
		MoltenCell = { bg = colors.base },
		-- default split separator
		WinSeparator = { fg = colors.base },
	}
end

local opts = {
	flavour = "mocha",
	background = { light = "latte", dark = "mocha" },
	float = { solid = true },
	show_end_of_buffer = false,
	custom_highlights = highlights,
	auto_integrations = true,
	integrations = {
		indent_blankline = { scope_color = "lavender" },
	},
}

return {
	opts = opts,
}
