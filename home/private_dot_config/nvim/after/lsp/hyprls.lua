-- INFO: sources
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/hyprls.lua

--- @type vim.lsp.Config
return {
	cmd = { "hyprls", "--stdio" },
	filetypes = { "hyprlang" },
	root_markers = { ".git" },
}
