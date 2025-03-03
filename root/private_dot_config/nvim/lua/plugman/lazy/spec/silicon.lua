-- todo: move config to separate file

local api = vim.api

local directory = vim.env.HOME .. "/Pictures/screenshots/code/"
local theme = vim.env.XDG_CONFIG_HOME .. "/bat/themes/Catppuccin Mocha.tmTheme"

local window_title = function()
	return vim.fn.fnamemodify(api.nvim_buf_get_name(api.nvim_get_current_buf()), ":t")
end

local output = function()
	return directory .. os.date("!%Y-%m-%d-%H-%M-%S") .. ".png"
end

return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	main = "nvim-silicon",
	cmd = "Silicon",
	opts = {
		font = "FiraCode Nerd Font=16",
		theme = theme,
		pad_horiz = 0,
		pad_vert = 0,
		no_round_corner = true,
		no_window_controls = true,
		line_offset = function(args)
			return args.line1
		end,
		tab_width = 4,
		shadow_blur_radius = 0,
		shadow_offset_x = 0,
		shadow_offset_y = 0,
		gobble = true,
		to_clipboard = true,
		window_title = window_title,
		output = output,
	},
}
