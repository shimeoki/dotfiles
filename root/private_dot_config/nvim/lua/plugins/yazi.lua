local enabled = true

local binds = require("binds")
local keys = binds.convert(binds.map.yazi, "lazy")

return {
	"mikavilpas/yazi.nvim",
	cond = enabled,
	main = "yazi",
	lazy = true,
	event = "VeryLazy",
	keys = keys,
	opts = {
		floating_window_scaling_factor = 1.00,
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
