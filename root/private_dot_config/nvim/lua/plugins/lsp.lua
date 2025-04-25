local M = {}

local lsp = vim.lsp

local function setup(name, opts)
	if opts then
		lsp.config(name, opts)
	end

	lsp.enable(name)
end

function M.setup()
	require("diagnostics")

	lsp.inlay_hint.enable()

	-- todo: load only on corresponding filetypes
	setup("lua_ls", require("langservers.luals").opts)
	setup("jedi_language_server")
	setup("ruff", require("langservers.ruff").opts)
	setup("bashls", require("langservers.bashls").opts)
	setup("clangd")
	setup("nushell")
	setup("volar")
	setup("ts_ls", require("langservers.tsls").opts())
	setup("cssls")
	setup("texlab")
	setup("hyprls")
	setup("gopls", require("langservers.gopls").opts)
	setup("dockerls")
end

return M
