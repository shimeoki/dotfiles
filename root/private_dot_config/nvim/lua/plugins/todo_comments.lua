local enabled = true

local signs = false

local alt_keywords = {
	FIX = {
		"FIXME",
		"BUG",
		"FIXIT",
		"ISSUE",
	},
	TODO = {},
	HACK = {},
	WARN = {
		"WARNING",
		"XXX",
	},
	PERF = {
		"OPTIM",
		"PERFORMANCE",
		"OPTIMIZE",
	},
	NOTE = {
		"INFO",
	},
	TEST = {
		"TESTING",
		"PASSED",
		"FAILED",
	},
}

local keywords = {
	FIX = { icon = " ", color = "error" },
	TODO = { icon = " ", color = "info" },
	HACK = { icon = " ", color = "warning" },
	WARN = { icon = " ", color = "warning" },
	PERF = { icon = " ", color = "info" },
	NOTE = { icon = " ", color = "info" },
	TEST = { icon = "⏲ ", color = "test" },
}

for keyword, alt_keyword in pairs(alt_keywords) do
	local alt = {}
	table.insert(alt, keyword:lower())

	for _, s in ipairs(alt_keyword) do
		table.insert(alt, s)
		table.insert(alt, s:lower())
	end

	keywords[keyword].alt = alt
end

local opts = {
	signs = signs,
	keywords = keywords,
}

return {
	"folke/todo-comments.nvim",
	cond = enabled,
	main = "todo-comments",
	lazy = true,
	cmd = { "TodoTelescope" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = opts,
}
