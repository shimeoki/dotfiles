local enabled = true

local import = require("import")
local log = require("log")

local sorter = {
	"nvim-telescope/telescope-fzf-native.nvim",
	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
}

local binds = import.safe("binds")
if not binds then
	log.error("plugins.telescope: no binds module")
	return
end

local telebinds = import.safe("binds.telescope")
if not telebinds then
	log.error("plugins.telescope: no binds.telescope module")
	return
end

local keys = {}

for _, bind in ipairs(telebinds.binds) do
	table.insert(keys, bind:to_lazy())
end

return {
	"nvim-telescope/telescope.nvim",
	cond = enabled,
	name = "telescope",
	branch = "0.1.x",
	keys = keys,
	config = function()
		local plug = require("telescope")

		local fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}

		plug.setup({
			extensions = {
				fzf = fzf,
			},
		})

		plug.load_extension("fzf")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		sorter,
	},
}
