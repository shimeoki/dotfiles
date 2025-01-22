local cfg = require("config.cmp")

local snippet_addon = "saadparwaiz1/cmp_luasnip"

local addons = {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	snippet_addon,
}

return {
	"hrsh7th/nvim-cmp",
	name = "cmp",
	main = "cmp",
	dependencies = addons,
	opts = function()
		cfg.autopairs_setup()

		local opts = cfg.opts

		opts.mapping = cfg.binds()
		opts.sources = cfg.src()
		opts.window = cfg.window()

		return opts
	end,
}
