-- INFO: sources
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/ruff.lua
-- https://docs.astral.sh/ruff/editors/setup/#neovim

--- @type vim.lsp.Config
return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	-- disable hover
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
	init_options = {
		settings = {
			lineLength = 80,
			lint = { select = { "E4", "E7", "E9", "F" } },
		},
	},
}
