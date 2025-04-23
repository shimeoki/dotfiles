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
}

local opts = {
	ensure_installed = highlighters,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

local function config()
	require("nvim-treesitter.configs").setup(opts)

	vim.treesitter.language.register("css", "gtkcss")
end

return {
	setup = config,
}
