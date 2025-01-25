local import = require("import")
local log = require("log")

local enabled = true

local binds = import.safe("binds")
if not binds then
	log.error("plugins.yazi: no binds module")
	return
end

local yabinds = import.safe("binds.yazi")
if not yabinds then
	log.error("plugins.yazi: no binds.yazi module")
	return
end

local keys = {}

for _, bind in ipairs(yabinds.binds) do
	table.insert(keys, binds.convert_to_lazy(bind))
end

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
