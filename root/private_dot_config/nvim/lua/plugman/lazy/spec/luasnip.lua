-- todo: i don't like the architecture of this

local function vue_init()
	local ls = require("luasnip")
	local text = ls.text_node
	local cond = require("luasnip.extras.conditions.expand").line_begin

	return ls.snippet("init", {
		text({ '<script setup lang="ts">', "" }),
		text({ "</script>", "", "" }),
		text({ "<template></template>", "", "" }),
		text({ '<style scoped lang="css">', "" }),
		text("</style>"),
	}, {
		condition = cond,
	})
end

local function config()
	local ls = require("luasnip")

	ls.add_snippets("vue", { vue_init() })
end
return {
	"L3MON4D3/LuaSnip",
	name = "luasnip",
	main = "luasnip",
	lazy = true,
	version = "v2.*",
	build = "make install_jsregexp",
	config = config,
}
