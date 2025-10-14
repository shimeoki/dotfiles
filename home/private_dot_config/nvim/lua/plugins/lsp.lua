local M = {}

local lsp = vim.lsp

local function setup(name, opts)
	if opts then
		lsp.config(name, opts)
	end

	lsp.enable(name)
end

local ts_ls_filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
}
local denols_root_markers = {
	"deno.json",
	"deno.jsonc",
	"deno.lock",
}

function M.setup()
	lsp.inlay_hint.enable()

	-- todo: load only on corresponding filetypes
	setup("lua_ls")
	setup("jedi_language_server")
	setup("ruff")
	setup("bashls")
	setup("clangd")
	setup("nushell")
	setup("vue_ls")
	-- FIXME: remove after migrating from lspconfig
	setup("ts_ls", { filetypes = ts_ls_filetypes })
	setup("cssls")
	setup("texlab")
	setup("hyprls")
	setup("gopls")
	setup("dockerls")
	setup("marksman")
	-- FIXME: remove after migrating from lspconfig
	setup("denols", { root_markers = denols_root_markers })
	setup("svelte")
	setup("jdtls")
end

return M
