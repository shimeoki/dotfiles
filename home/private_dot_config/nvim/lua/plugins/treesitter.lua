local M = {}

local ts = vim.treesitter
local api = vim.api

local highlighters = {
	"lua",
	"go",
	"gomod",
	"gosum",
	"gotmpl",
	"java",
	"python",
	"bash",
	"markdown",
	"markdown_inline",
	"hyprlang",
	"html",
	"json",
	"jsonc",
	"toml",
	"cpp",
	"c",
	"nu",
	"javascript",
	"typescript",
	"yaml",
	"css",
	"vue",
	"vim",
	"regex",
	"kotlin",
	"ron",
	"kdl",
	"nix",
	"svelte",
}

local function start()
	ts.start()
end

local function setup_gtkcss()
	ts.language.register("css", { "gtkcss" })
	api.nvim_create_autocmd("FileType", {
		pattern = { "gtkcss" },
		callback = start,
	})
end

local function setup_shell()
	ts.language.register("bash", { "sh", "zsh" })
	api.nvim_create_autocmd("FileType", {
		pattern = { "sh", "zsh" },
		callback = start,
	})
end

function M.setup()
	require("nvim-treesitter").install(highlighters)

	api.nvim_create_autocmd("FileType", {
		pattern = highlighters,
		callback = start,
	})

	setup_gtkcss()
	setup_shell()
end

return M
