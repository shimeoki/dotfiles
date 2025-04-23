local options = {
	component_separators = "",
}

local sub = string.sub
local lower = string.lower

local function mode_fmt(s)
	return sub(lower(s), 1, 3)
end

local position = {
	{
		"mode",
		fmt = mode_fmt,
	},
	{
		"location",
	},
	{
		"progress",
		fmt = lower,
	},
}

local fileinfo = {
	{
		"fileformat",
		symbols = {
			unix = "lf",
			dos = "crlf",
			mac = "lf",
		},
	},
	{
		"encoding",
		show_bomb = false,
	},
}

local file = {
	{
		"filename",
		file_status = true,
		newfile_status = true,
		path = 4,
		shorting_target = 40,
		symbols = {
			modified = "~",
			readonly = "=",
			unnamed = "?",
			newfile = "+",
		},
	},
	{
		"filetype",
		colored = true,
		icon_only = false,
		icon = { align = "left" },
	},
}

local git = {
	{
		"diff",
		colored = true,
		symbols = {
			added = "+",
			modified = "~",
			removed = "-",
		},
	},
	{
		"branch",
		icon = "@",
	},
}

local status = {
	{
		"diagnostics",
		sources = {
			"nvim_lsp",
			"nvim_diagnostic",
		},
		sections = {
			"error",
			"warn",
			"info",
			"hint",
		},
		colored = true,
		update_in_insert = false,
		always_visible = false,
	},
}

local active_sections = {
	lualine_a = position,
	lualine_b = fileinfo,
	lualine_c = file,
	lualine_x = status,
	lualine_y = git,
	lualine_z = {},
}

local inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = file,
	lualine_x = status,
	lualine_y = {},
	lualine_z = {},
}

local opts = {
	options = options,
	sections = active_sections,
	inactive_sections = inactive_sections,
}

return {
	opts = opts,
}
