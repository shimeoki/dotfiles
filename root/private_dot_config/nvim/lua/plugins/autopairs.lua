local enabled = true
local name = "autopairs"

return {
	"windwp/nvim-autopairs",
	cond = enabled,
	name = name,
	main = "nvim-autopairs",
	event = "InsertEnter",
	opts = {},
}
