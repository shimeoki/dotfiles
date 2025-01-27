local M = require("toolbox").new({
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

M:parse_groups({ "mason" })

return M
