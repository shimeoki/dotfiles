local integrations = {
	notify = true,
	noice = true,
	mason = true,
	which_key = true,
	blink_cmp = true,
	indent_blankline = { scope_color = "lavender" },
}

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
		-- telescope
		TelescopeNormal = { link = "NormalFloat" },
		TelescopeBorder = { fg = colors.mantle, bg = colors.mantle },
		TelescopePreviewTitle = { fg = colors.mantle, bg = colors.lavender },
		-- default split separator
		WinSeparator = { fg = colors.base },
	}
end

local opts = {
	flavour = "mocha",
	background = { light = "latte", dark = "mocha" },
	show_end_of_buffer = false,
	integrations = integrations,
	custom_highlights = highlights,
}

return {
	opts = opts,
}
