local M = require("toolbox").new({
	enabled = true,
})

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

M:add({
	name = "python",
	enabled = true,
	filetypes = { "python" },
})

M:add({
	name = "bash",
	enabled = true,
	filetypes = { "sh", "bash", "zsh" },
})

M:parse_groups({ "treesitter" })

return M
