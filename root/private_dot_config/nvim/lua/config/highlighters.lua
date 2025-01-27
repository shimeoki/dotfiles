local M = require("toolbox").new({})

M:add({
	name = "lua",
	enabled = true,
	filetypes = { "lua" },
})

M:add({
	name = "go",
	enabled = true,
	filetypes = { "go" },
})

M:add({
	name = "gomod",
	enabled = true,
	filetypes = { "gomod" },
})

M:add({
	name = "java",
	enabled = true,
	filetypes = { "java" },
})

M:parse_groups({ "treesitter" })

return M
