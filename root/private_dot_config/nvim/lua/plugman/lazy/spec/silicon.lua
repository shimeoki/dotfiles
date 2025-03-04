local silicon = require("config.plugins").silicon

return {
	"michaelrommel/nvim-silicon",
	cond = silicon.enabled,
	name = silicon.name,
	lazy = true,
	main = "nvim-silicon",
	cmd = "Silicon",
	opts = silicon.config.opts,
}
