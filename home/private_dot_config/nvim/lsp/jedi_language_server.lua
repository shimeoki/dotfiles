-- INFO: sources
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/jedi_language_server.lua

--- @type vim.lsp.Config
return {
	cmd = { "jedi-language-server" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},
}
