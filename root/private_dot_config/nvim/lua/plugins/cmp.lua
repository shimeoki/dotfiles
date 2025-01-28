local enabled = true
local name = "cmp"

local cmp = require("config.plugins.cmp")

local dependencies = {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
}

return {
	"hrsh7th/nvim-cmp",
	cond = enabled,
	event = "InsertEnter",
	name = name,
	main = name,
	dependencies = dependencies,
	opts = cmp.opts,
}
