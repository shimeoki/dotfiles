local function show_except_snippets(cmp)
	cmp.show({ providers = { "lsp", "path", "buffer" } })
end

local function show_only_snippets(cmp)
	cmp.show({ providers = { "snippets" } })
end

local function show_all(cmp)
	cmp.show({ providers = { "lsp", "snippets", "path", "buffer" } })
end

local function text_idx(ctx)
	if ctx.idx <= 9 then
		return tostring(ctx.idx)
	else
		return " "
	end
end

local function accept_idx(idx)
	return function(cmp)
		cmp.accept({ index = idx })
	end
end

local completion = {
	keyword = { range = "full" },
	list = {
		selection = { preselect = true, auto_insert = false },
	},
	menu = {
		max_height = 11,
		direction_priority = { "n", "s" },
		draw = {
			columns = {
				{ "item_idx" },
				{ "label" },
				{ "label_description" },
				{ "kind_icon" },
				{ "kind" },
				{ "source_name" },
			},
			components = {
				item_idx = { text = text_idx },
			},
		},
	},
	documentation = {
		auto_show = true,
		auto_show_delay_ms = 0,
	},
	ghost_text = { enabled = true },
}

local keymap = {
	preset = "none",

	["<enter>"] = { "accept", "snippet_forward", "fallback" },
	["<tab>"] = { "accept", "snippet_forward", "fallback" },

	["<c-s>"] = { "show", "hide", "fallback_to_mappings" },
	["<c-a>"] = { show_all, "fallback_to_mappings" },
	["<c-e>"] = { show_except_snippets, "fallback_to_mappings" },
	["<c-o>"] = { show_only_snippets, "fallback_to_mappings" },

	["<c-j>"] = { "select_next", "fallback_to_mappings" },
	["<c-k>"] = { "select_prev", "fallback_to_mappings" },

	["<c-h>"] = { "snippet_backward", "fallback_to_mappings" },
	["<c-l>"] = { "snippet_forward", "fallback_to_mappings" },

	["<c-d>"] = { "scroll_documentation_down", "fallback" },
	["<c-u>"] = { "scroll_documentation_up", "fallback" },

	["<c-t>"] = { "show_signature", "hide_signature", "fallback" },
	["<c-i>"] = { "show_documentation", "hide_documentation", "fallback" },

	["<c-1>"] = { accept_idx(1) },
	["<c-2>"] = { accept_idx(2) },
	["<c-3>"] = { accept_idx(3) },
	["<c-4>"] = { accept_idx(4) },
	["<c-5>"] = { accept_idx(5) },
	["<c-6>"] = { accept_idx(6) },
	["<c-7>"] = { accept_idx(7) },
	["<c-8>"] = { accept_idx(8) },
	["<c-9>"] = { accept_idx(9) },
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
		"exact",
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
	opts = opts,
}
