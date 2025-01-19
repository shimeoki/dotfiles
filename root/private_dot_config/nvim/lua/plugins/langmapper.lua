local name = "langmapper"
local enabled = true

local function config()
	local plug = require(name)

	plug.automapping({
		global = true,
		buffer = true,
	})
end

return {
	"Wansmer/langmapper.nvim",
	cond = enabled,
	name = name,
	main = name,
	lazy = false,
	priority = 1,
	opts = {},
	config = config,
}
