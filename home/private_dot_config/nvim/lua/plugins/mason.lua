local M = {}

local ensure_installed = {
	-- langservers
	"lua-language-server",
	"jdtls",
	"jedi-language-server",
	"bash-language-server",
	"clangd",
	"deno",
	"vue-language-server",
	"typescript-language-server",
	"css-lsp",
	"texlab",
	"hyprls",
	"gopls",
	"dockerfile-language-server",
	"marksman",
	"deno",
	-- debuggers
	"delve",
	-- linters
	"luacheck",
	"golangci-lint",
	"shellcheck",
	"mypy",
	-- formatters
	"stylua",
	"goimports",
	"golines",
	"ruff",
	"shfmt",
	"clang-format",
	"pyproject-fmt",
	"nixfmt",
	-- compilers
	"tree-sitter-cli",
}

M.opts = {
	ensure_installed = ensure_installed,
}

return M
