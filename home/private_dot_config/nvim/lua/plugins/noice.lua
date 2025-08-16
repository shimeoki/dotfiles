local M = {}

-- source: https://github.com/folke/noice.nvim/wiki/Configuration-Recipes

local cmdline = {
	format = {
		input = { view = "cmdline_popup" }, -- don't force a border
	},
}

local popup = {
	border = {
		style = "none",
		padding = { 1, 1 },
	},
	filter_options = {},
}

local cmdline_popup = {
	border = {
		style = "none",
		padding = { 1, 1 },
	},
	filter_options = {},
	win_options = {
		winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
	},
}

local notify = {
	replace = true,
}

local hover = {
	border = {
		style = "none",
		padding = { 1, 1 },
	},
	filter_options = {},
	position = { row = 2, col = 0 },
}

local confirm = {
	border = {
		style = "none",
		padding = { 1, 1 },
	},
	filter_options = {},
}

local views = {
	popup = popup,
	cmdline_popup = cmdline_popup,
	notify = notify,
	hover = hover,
	confirm = confirm,
}

local lsp = {
	override = {
		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		["vim.lsp.util.stylize_markdown"] = true,
	},
}

local hide_search_virtual_text = {
	filter = {
		event = "msg_show",
		kind = "search_count",
	},
	opts = { skip = true },
}

local hide_written_messages = {
	filter = {
		event = "msg_show",
		kind = "",
		find = "written",
	},
	opts = { skip = true },
}

local routes = {
	hide_search_virtual_text,
	hide_written_messages,
}

M.opts = {
	cmdline = cmdline,
	lsp = lsp,
	views = views,
	routes = routes,
}

return M
