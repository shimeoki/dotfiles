local keymap = {
	preset = "none",

	["<enter>"] = { "accept", "fallback" },
	["<s-enter>"] = { "show", "hide", "fallback" },

	["<s-j>"] = { "scroll_documentation_down", "fallback" },
	["<s-k>"] = { "scroll_documentation_up", "fallback" },

	["<c-j>"] = { "select_next", "fallback_to_mappings" },
	["<c-k>"] = { "select_prev", "fallback_to_mappings" },

	["<tab>"] = { "select_next", "fallback" },
	["<s-tab>"] = { "select_prev", "fallback" },

	["<c-h>"] = { "snippet_backward", "fallback_to_mappings" },
	["<c-l>"] = { "snippet_forward", "fallback_to_mappings" },

	["<s-space>"] = { "show_signature", "hide_signature", "fallback" },
	["<c-space>"] = { "show_documentation", "hide_documentation", "fallback" },
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

local opts = {
	keymap = keymap,
	completion = completion,
	signature = { enabled = false },
	cmdline = cmdline,
	snippets = { preset = "luasnip" },
	sources = { default = { "lsp", "snippets", "path", "buffer" } },
}

return {
	"saghen/blink.cmp",
	version = "1.*",
	lazy = true,
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
	opts = opts,
}
