local M = {}

local ts = vim.treesitter
local api = vim.api

local highlighters = {
	-- keep-sorted start
	"bash",
	"c",
	"cpp",
	"css",
	"go",
	"gomod",
	"gosum",
	"gotmpl",
	"html",
	"hyprlang",
	"java",
	"javascript",
	"json",
	"jsonc",
	"kdl",
	"kitty",
	"kotlin",
	"lua",
	"markdown",
	"markdown_inline",
	"nix",
	"nu",
	"python",
	"regex",
	"ron",
	"svelte",
	"toml",
	"typescript",
	"vim",
	"vue",
	"yaml",
	-- keep-sorted end
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
