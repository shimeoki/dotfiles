local api = vim.api
local date = os.date

local theme = vim.env.XDG_CONFIG_HOME .. "/bat/themes/Catppuccin Mocha.tmTheme"
local font = "FiraCode Nerd Font=16"
local indent_width = 4
local directory = vim.env.HOME .. "/Pictures/screenshots/nvim/"

local function current_buf_name()
	return api.nvim_buf_get_name(api.nvim_get_current_buf())
end

local function window_title()
	return vim.fn.fnamemodify(current_buf_name(), ":t")
end

local function line_offset(args)
	return args.line1
end

local function output()
	return directory .. date("!%Y-%m-%d-%H-%M-%S") .. ".png"
end

local opts = {
	font = font,
	theme = theme,

	shadow_blur_radius = 0,
	shadow_offset_x = 0,
	shadow_offset_y = 0,

	pad_horiz = 0,
	pad_vert = 0,

	no_round_corner = true,
	no_window_controls = true,
	window_title = window_title,

	line_offset = line_offset,
	tab_width = indent_width,
	gobble = true,

	to_clipboard = true,
	output = output,
}

return {
	opts = opts,
}
