-- INFO: sources
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/cssls.lua

--- @type vim.lsp.Config
return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	init_options = { provideFormatter = true },
	root_markers = { "package.json", ".git" },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
}
