local M = {}

local function plug()
	return require("cmp")
end

local snippet = {
	expand = function(args)
		require("luasnip").lsp_expand(args.body)
	end,
}

-- todo move to binds
function M.binds()
	local map = plug().mapping

	return map.preset.insert({
		["<C-b>"] = map.scroll_docs(-4),
		["<C-f>"] = map.scroll_docs(4),
		["<C-Space>"] = map.complete(),
		["<C-e>"] = map.abort(),
		["<CR>"] = map.confirm({ select = true }),
	})
end

function M.src()
	return plug().config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	})
end

M.opts = {
	snippet = snippet,
}

return M
