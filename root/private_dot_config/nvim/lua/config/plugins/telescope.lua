local M = {}

local fuzzy = true
local selecter = true
local wrap = true

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

local function mappings()
	local actions = require("telescope.actions")
	local layout = require("telescope.actions.layout")

	local keys = {
		["<c-j>"] = "move_selection_next",
		["<c-k>"] = "move_selection_previous",
		["<c-l>"] = actions.cycle_previewers_next,
		["<c-h>"] = actions.cycle_previewers_prev,
		["<c-u>"] = false,
		["<c-d>"] = actions.delete_buffer,
		["J"] = "preview_scrolling_down",
		["K"] = "preview_scrolling_up",
		["T"] = layout.toggle_preview,
		["<s-esc>"] = actions.close,
	}

	return { i = keys, n = keys }
end

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

local function vimgrep_arguments()
	local telescope_config = require("telescope.config")
	local args = { unpack(telescope_config.values.vimgrep_arguments) }

	table.insert(args, "--hidden")
	table.insert(args, "--glob")
	table.insert(args, "!**/.git/*")

	return args
end

local function opts()
	local o = {
		defaults = {
			layout_strategy = layout_strategy,
			layout_config = layout_config,
			sorting_strategy = sorting_strategy,
			mappings = mappings(),
			vimgrep_arguments = vimgrep_arguments(),
			wrap_results = wrap,
		},
		pickers = {
			find_files = {
				find_command = find_command,
			},
		},
	}

	if fuzzy then
		o.extensions = { fzf = fzf }
	end

	return o
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

function M.config()
	local telescope = require("telescope")

	telescope.setup(opts())

	if fuzzy then
		telescope.load_extension("fzf")
	end

	if selecter then
		telescope.load_extension("ui-select")
	end
end

return M
