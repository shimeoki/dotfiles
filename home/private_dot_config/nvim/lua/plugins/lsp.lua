local M = {}

local lsp = vim.lsp
local log = require("log")

local function fix_rename()
	-- hack: workaround for "buffer newer than edits"
	-- source: https://github.com/neovim/neovim/issues/12970#issuecomment-1166957212

	lsp.util.apply_text_document_edit = function(text_document_edit, _, offset_encoding)
		local text_document = text_document_edit.textDocument
		local bufnr = vim.uri_to_bufnr(text_document.uri)

		if offset_encoding == nil then
			log.warn("apply_text_document_edit must be called with valid offset encoding")
		end

		lsp.util.apply_text_edits(text_document_edit.edits, bufnr, offset_encoding)
	end
end

local function setup(name, opts)
	if opts then
		lsp.config(name, opts)
	end

	lsp.enable(name)
end

function M.setup()
	require("diagnostics")

	lsp.inlay_hint.enable()
	fix_rename()

	-- todo: load only on corresponding filetypes
	setup("lua_ls")
	setup("jedi_language_server")
	setup("ruff")
	setup("bashls")
	setup("clangd")
	setup("nushell")
	setup("vue_ls")
	setup("ts_ls", require("langservers.tsls").opts())
	setup("cssls")
	setup("texlab")
	setup("hyprls")
	setup("gopls")
	setup("dockerls")
	setup("marksman")
	setup("denols")
	setup("svelte")
	setup("jdtls")
end

return M
