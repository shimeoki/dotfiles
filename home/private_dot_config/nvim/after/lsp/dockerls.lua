-- INFO: sources
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/dockerls.lua

--- @type vim.lsp.Config
return {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
	root_markers = { "Dockerfile" },
}
