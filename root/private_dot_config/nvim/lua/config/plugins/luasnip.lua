local M = {}

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

function M.setup()
	local ls = require("luasnip")

	ls.add_snippets("vue", { vue_init() })
end

return M
