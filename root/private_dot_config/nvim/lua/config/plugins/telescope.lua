local M = {}

local fuzzy = true

local sorting_strategy = "ascending"
local layout_strategy = "horizontal"
local layout_config = {
	anchor = "CENTER",
	height = { padding = 2 },
	mirror = false,
	prompt_position = "top",
	scroll_speed = 4,
	width = { padding = 4 },
	preview_cutoff = 100,
	preview_width = 80,
}

local mappings = {
	i = {
		["<c-j>"] = "move_selection_next",
		["<c-k>"] = "move_selection_previous",
		["J"] = "preview_scrolling_down",
		["K"] = "preview_scrolling_up",
	},
	n = {
		["<c-j>"] = "move_selection_next",
		["<c-k>"] = "move_selection_previous",
		["J"] = "preview_scrolling_down",
		["K"] = "preview_scrolling_up",
	},
}

local fzf = {
	fuzzy = true,
	override_generic_sorter = true,
	override_file_sorter = true,
	case_mode = "smart_case",
}

M.opts = {
	defaults = {
		layout_strategy = layout_strategy,
		layout_config = layout_config,
		sorting_strategy = sorting_strategy,
		mappings = mappings,
	},
}

if fuzzy then
	M.opts.extensions = { fzf = fzf }
end

local binds = require("config.binds")
M.keys = binds.convert(binds.map.telescope, "lazy")

-- enable line wrapping in preview
vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	callback = function()
		vim.wo.wrap = true
	end,
})

function M.config()
	local telescope = require("telescope")

	telescope.setup(M.opts)

	if fuzzy then
		telescope.load_extension("fzf")
	end
end

return M
