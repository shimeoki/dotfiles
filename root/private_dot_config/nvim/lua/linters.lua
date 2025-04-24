local M = require("toolbox").new({
	enabled = true,
	events = {
		"BufEnter",
		"BufWritePost",
		"InsertLeave",
	},
})

M:add({
	name = "luacheck",
	enabled = true,
	filetypes = { "lua" },
	config = require("linters.luacheck"),
})

M:add({
	name = "golangcilint",
	enabled = true,
	filetypes = { "go", "gomod" },
})

M:add({
	name = "shellcheck",
	enabled = false, -- bashls does this automatically
	filetypes = { "sh", "bash" },
})

M:add({
	name = "dmypy",
	enabled = true,
	filetypes = { "python" },
})

M:parse_groups()

return M
