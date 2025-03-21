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

M:add({
	name = "markdown",
	enabled = true,
	filetypes = { "markdown" },
})

M:add({
	name = "markdown_inline",
	enabled = true,
	filetypes = { "markdown" },
})

M:add({
	name = "hyprlang",
	enabled = true,
	filetypes = { "hyprlang" },
})

M:add({
	name = "html",
	enabled = true,
	filetypes = { "html" },
})

M:add({
	name = "json",
	enabled = true,
	filetypes = { "json" },
})

M:add({
	name = "toml",
	enabled = true,
	filetypes = { "toml" },
})

M:add({
	name = "cpp",
	enabled = true,
	filetypes = { "cpp" },
})

M:add({
	name = "c",
	enabled = true,
	filetypes = { "c" },
})

M:add({
	name = "nu",
	enabled = true,
	filetypes = { "nu" },
})

M:add({
	name = "javascript",
	enabled = true,
	filetypes = { "javascript", "javascriptreact" },
})

M:add({
	name = "typescript",
	enabled = true,
	filetypes = { "typescript", "typescriptreact" },
})

M:parse_groups({ "treesitter" })

return M
