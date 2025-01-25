local enabled = true

local binds = require("binds")
local keys = binds.convert(binds.map.yazi, "lazy")

return {
	"mikavilpas/yazi.nvim",
	cond = enabled,
	name = "yazi",
	main = "yazi",
	event = "VeryLazy",
	keys = keys,
	opts = {
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
