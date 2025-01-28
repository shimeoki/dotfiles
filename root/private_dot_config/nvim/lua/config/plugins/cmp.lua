local M = {}

local function plug()
	return require("cmp")
end

local function luasnip()
	return require("luasnip")
end

local snippet = {
	expand = function(args)
		require("luasnip").lsp_expand(args.body)
	end,
}

-- todo move to binds
function M.binds()
	local cmp = plug()
	local snip = luasnip()
	local map = cmp.mapping

	local function jump(step)
		return function(fallback)
			if cmp.visible() then
				if step > 0 then
					cmp.select_next_item()
				else
					cmp.select_prev_item()
				end
			elseif snip.locally_jumpable(step) then
				snip.jump(step)
			else
				fallback()
			end
		end, { "i", "s" }
	end

	local function select()
		return function(fallback)
			if cmp.visible() then
				if snip.expandable() then
					snip.expand()
				else
					cmp.confirm({ select = true })
				end
			else
				fallback()
			end
		end
	end

	return {
		["<cr>"] = map(select()),
		["<tab>"] = map(jump(1)),
		["<s-tab>"] = map(jump(-1)),
	}
end

function M.src()
	return plug().config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	})
end

function M.window()
	local bordered = plug().config.window.bordered()

	return {
		completion = bordered,
		documentation = bordered,
	}
end

function M.autopairs_setup()
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	plug().event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

M.opts = {
	snippet = snippet,
}

return M
