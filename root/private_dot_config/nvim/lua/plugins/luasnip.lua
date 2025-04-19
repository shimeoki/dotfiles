local enabled = true

local function config()
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_lua").load()
end

return {
	"L3MON4D3/LuaSnip",
	cond = enabled,
	main = "luasnip",
	lazy = true,
	version = "v2.*",
	build = "make install_jsregexp",
	config = config,
	dependencies = { "rafamadriz/friendly-snippets" },
}
