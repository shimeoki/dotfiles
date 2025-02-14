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
	config = require("config.linters.luacheck"),
})

M:add({
	name = "golangcilint",
	enabled = true,
	filetypes = { "go" },
	aliases = {
		mason = "golangci-lint",
	},
})

M:add({
	name = "shellcheck",
	enabled = false, -- bashls does this automatically
	filetypes = { "sh", "bash" },
})

M:parse_groups({ "mason" })

return M
