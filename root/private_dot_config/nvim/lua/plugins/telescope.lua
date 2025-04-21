local enabled = true

local fuzzy = true
local select = true
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

local flex = {
	flip_columns = preview_cutoff,
}

local layout_config = {
	scroll_speed = 4,
	horizontal = horizontal,
	vertical = vertical,
	flex = flex,
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
		["<c-d>"] = false,
		["J"] = "preview_scrolling_down",
		["K"] = "preview_scrolling_up",
		["T"] = layout.toggle_preview,
		["<esc>"] = actions.close,
		["<s-esc>"] = { "<esc>", type = "command" },
	}

	return { i = keys, n = keys }
end

local function mappings_buffers()
	local actions = require("telescope.actions")

	local keys = {
		["<c-d>"] = actions.delete_buffer,
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
			buffers = {
				mappings = mappings_buffers(),
			},
		},
	}

	if fuzzy then
		o.extensions = { fzf = fzf }
	end

	return o
end

local binds = require("binds")
local keys = binds.convert(binds.map.telescope, "lazy")

-- enable line wrapping in preview
vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	callback = function()
		vim.wo.wrap = true
	end,
})

local function config()
	local telescope = require("telescope")

	telescope.setup(opts())

	if fuzzy then
		telescope.load_extension("fzf")
	end

	if select then
		telescope.load_extension("ui-select")
	end
end

local sorter = {
	"nvim-telescope/telescope-fzf-native.nvim",
	name = "telescope-fzf-native",
	build = "make",
}

local selecter = {
	"nvim-telescope/telescope-ui-select.nvim",
	name = "telescope-ui-select",
}

return {
	"nvim-telescope/telescope.nvim",
	cond = enabled,
	main = "telescope",
	lazy = true,
	branch = "0.1.x",
	keys = keys,
	config = config,
	dependencies = { sorter, selecter },
}
