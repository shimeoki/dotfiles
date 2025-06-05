local M = {}

local ts = vim.treesitter

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
}

local function setup_gtkcss()
	ts.language.register("css", { "gtkcss" })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "gtkcss" },
		callback = function()
			ts.start()
		end,
	})
end

function M.setup()
	require("nvim-treesitter").install(highlighters)

	setup_gtkcss()
end

return M
