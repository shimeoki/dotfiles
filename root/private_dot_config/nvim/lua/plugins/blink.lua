local enabled = true

local function show_no_snippets(cmp)
	cmp.show({ providers = { "lsp", "path", "buffer" } })
end

local keymap = {
	preset = "none",

	["<enter>"] = { "accept", "fallback" },
	["<s-enter>"] = { "show", "hide", "fallback" },

	["<c-space>"] = { show_no_snippets, "fallback_to_mappings" },

	["<tab>"] = { "snippet_forward", "select_next", "fallback" },
	["<s-tab>"] = { "snippet_backward", "select_prev", "fallback" },

	["<c-j>"] = { "select_next", "fallback_to_mappings" },
	["<c-k>"] = { "select_prev", "fallback_to_mappings" },

	["<c-h>"] = { "snippet_backward", "fallback_to_mappings" },
	["<c-l>"] = { "snippet_forward", "fallback_to_mappings" },

	["<c-d>"] = { "scroll_documentation_down", "fallback_to_mappings" },
	["<c-u>"] = { "scroll_documentation_up", "fallback_to_mappings" },

	["<c-s>"] = { "show_signature", "hide_signature", "fallback_to_mappings" },
	["<c-i>"] = { "show_documentation", "hide_documentation", "fallback_to_mappings" },
}

local completion = {
	keyword = { range = "full" },
	list = {
		selection = { preselect = true, auto_insert = false },
	},
	menu = {
		border = "rounded",
		direction_priority = { "n", "s" },
		draw = {
			columns = {
				{ "label", "label_description", gap = 1 },
				{ "kind_icon", "kind", "source_name", gap = 1 },
			},
		},
	},
	documentation = {
		auto_show = true,
		auto_show_delay_ms = 200,
		window = { border = "rounded" },
	},
	ghost_text = { enabled = true },
}

local cmdline = {
	keymap = { preset = "inherit" },
	completion = {
		list = {
			selection = { auto_insert = false },
		},
		menu = { auto_show = true },
	},
}

-- code below for source sorting from
-- https://github.com/Saghen/blink.cmp/issues/1098#issuecomment-2679295335

local source_priority = {
	snippets = 4,
	lsp = 3,
	path = 2,
	buffer = 1,
}

local function source_sort(a, b)
	local a_priority = source_priority[a.source_id]
	local b_priority = source_priority[b.source_id]

	if a_priority ~= b_priority then
		return a_priority > b_priority
	end
end

local fuzzy = {
	sorts = {
		source_sort,
		"score",
		"sort_text",
	},
}

local opts = {
	keymap = keymap,
	completion = completion,
	signature = { enabled = false },
	cmdline = cmdline,
	snippets = { preset = "luasnip" },
	sources = { default = { "lsp", "snippets", "path", "buffer" } },
	fuzzy = fuzzy,
}

return {
	"saghen/blink.cmp",
	cond = enabled,
	version = "1.*",
	lazy = true,
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
	opts = opts,
}
