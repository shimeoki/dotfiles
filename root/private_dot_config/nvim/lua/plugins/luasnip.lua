local enabled = true

local function ext_opts()
	local types = require("luasnip.util.types")
	return {
		[types.choiceNode] = {
			active = { virt_text = { { "●", "LuaSnipChoice" } } },
		},
		[types.insertNode] = {
			active = { virt_text = { { "●", "LuaSnipInsert" } } },
		},
	}
end

local function config()
	require("luasnip").setup({ ext_opts = ext_opts() })
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
