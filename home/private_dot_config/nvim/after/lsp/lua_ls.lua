local globals = {
	"vim",
	"require",
}

-- INFO: sources
-- https://github.com/neovim/neovim/issues/21686#issuecomment-1522446128
-- https://github.com/neovim/nvim-lspconfig/blob/ac98db2f9f06a56498ec890a96928774eae412c3/lsp/lua_ls.lua

--- @type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = globals },
			telemetry = { enable = false },
			format = { enable = false }, -- another formatter is used
			hint = {
				enable = true,
				arrayIndex = "Auto",
				await = true,
				paramName = "Literal",
				paramType = true,
				semicolon = "SameLine",
				setType = true,
			},
		},
	},
}
