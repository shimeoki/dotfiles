local M = {}

local fuzzy = true
local selecter = true

local sorting_strategy = "ascending"
local layout_strategy = "flex"
local preview_width = 80
local preview_cutoff = preview_width + preview_width / 2

local horizontal = {
	anchor = "CENTER",

	height = { padding = 0 },
	width = { padding = 0 },

	preview_width = preview_width,
	preview_cutoff = preview_cutoff,

	prompt_position = "top",
	mirror = false,
}

local vertical = {
	anchor = "CENTER",

	height = { padding = 0 },
	width = { padding = 0 },

	prompt_position = "top",
	mirror = true,
}

local layout_config = {
	scroll_speed = 4,
	horizontal = horizontal,
	vertical = vertical,
	flip_columns = preview_cutoff,
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

local find_command = {
	"rg",
	"--files",
	"--hidden",
	"--glob",
	"!**/.git/*",
}

M.opts = {
	defaults = {
		layout_strategy = layout_strategy,
		layout_config = layout_config,
		sorting_strategy = sorting_strategy,
		mappings = mappings,
	},
	pickers = {
		find_files = {
			find_command = find_command,
		},
	},
}

if fuzzy then
	M.opts.extensions = { fzf = fzf }
end

local binds = require("binds")
M.keys = binds.convert(binds.map.telescope, "lazy")

-- enable line wrapping in preview
vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	callback = function()
		vim.wo.wrap = true
	end,
})

local function vimgrep_arguments()
	local telescope_config = require("telescope.config")
	local args = { unpack(telescope_config.values.vimgrep_arguments) }

	table.insert(args, "--hidden")
	table.insert(args, "--glob")
	table.insert(args, "!**/.git/*")

	return args
end

function M.config()
	local telescope = require("telescope")

	M.opts.defaults.vimgrep_arguments = vimgrep_arguments()
	telescope.setup(M.opts)

	if fuzzy then
		telescope.load_extension("fzf")
	end

	if selecter then
		telescope.load_extension("ui-select")
	end
end

return M
