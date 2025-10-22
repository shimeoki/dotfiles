-- INFO: sources
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/nushell.lua

--- @type vim.lsp.Config
return {
	cmd = { "nu", "--lsp" },
	filetypes = { "nu" },
	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.root(bufnr, { ".git" }) or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
	end,
}
