local enabled = true

local sorter = {
	"nvim-telescope/telescope-fzf-native.nvim",
	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
}

local binds = require("binds")
local keys = binds.convert(binds.map.telescope, "lazy")

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
