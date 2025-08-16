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

local function opts()
	return {
		region_check_events = "InsertEnter",
		delete_check_events = "InsertLeave,TextChanged",
		ext_opts = ext_opts(),
	}
end

local function config()
	require("luasnip").setup(opts())
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load()
end

return {
	setup = config,
}
