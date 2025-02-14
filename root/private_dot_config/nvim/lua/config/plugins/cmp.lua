local M = {}

local source1 = {
	{ name = "nvim_lsp" },
	{ name = "luasnip" },
}

local source2 = {
	{ name = "buffer" },
}

local function cmp()
	return require("cmp")
end

local function luasnip()
	return require("luasnip")
end

local function snippet()
	local snip = luasnip()

	return {
		expand = function(args)
			snip.lsp_expand(args.body)
		end,
	}
end

local function jump(step)
	local comp = cmp()
	local snip = luasnip()

	local callback
	if step > 0 then
		callback = comp.select_next_item
	else
		callback = comp.select_prev_item
	end

	return function(fallback)
		if comp.visible() then
			callback()
		elseif snip.locally_jumpable(step) then
			snip.jump(step)
		else
			fallback()
		end
	end, { "i", "s" }
end

local function select()
	local comp = cmp()
	local snip = luasnip()

	return function(fallback)
		if comp.visible() then
			if snip.expandable() then
				snip.expand()
			else
				comp.confirm({ select = true })
			end
		else
			fallback()
		end
	end
end

local function jump_forward()
	return jump(1)
end

local function jump_backward()
	return jump(-1)
end

local function mapping()
	local map = cmp().mapping

	return {
		["<enter>"] = map(select()),
		["<tab>"] = map(jump_forward()),
		["<c-j>"] = map(jump_forward()),
		["<s-tab>"] = map(jump_backward()),
		["<c-k>"] = map(jump_backward()),
		["J"] = map.scroll_docs(4),
		["K"] = map.scroll_docs(-4),
	}
end

local function sources()
	return cmp().config.sources(source1, source2)
end

local function window()
	local bordered = cmp().config.window.bordered()

	return {
		completion = bordered,
		documentation = bordered,
	}
end

local function setup_completions()
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp().event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

function M.opts()
	local opts = {
		snippet = snippet(),
		mapping = mapping(),
		window = window(),
		sources = sources(),
	}

	-- todo: check completions before loading
	setup_completions()

	return opts
end

return M
