local enabled = true

local alts = {
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

for k, v in pairs(alts) do
	local alt = {}
	table.insert(alt, k:lower())

	for _, s in ipairs(v) do
		table.insert(alt, s)
		table.insert(alt, s:lower())
	end

	keywords[k].alt = alt
end

return {
	"folke/todo-comments.nvim",
	cond = enabled,
	name = "todo-comments",
	main = "todo-comments",
	cmd = { "TodoTelescope" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		signs = false,
		keywords = keywords,
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
