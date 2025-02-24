local image = require("config.plugins").image

return {
	"3rd/image.nvim",
	name = image.name,
	cond = image.enabled,
	ft = { "markdown" },
	opts = image.config.opts,
}
