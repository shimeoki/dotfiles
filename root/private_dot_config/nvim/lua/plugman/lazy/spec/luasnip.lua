local luasnip = require("config.plugins").luasnip

return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	version = "v2.*",
	build = "make install_jsregexp",
	config = luasnip.config.setup,
}
