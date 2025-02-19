local jupytext = require("config.plugins").jupytext

return {
	"GCBallesteros/jupytext.nvim",
	name = jupytext.name,
	cond = jupytext.enabled,
	opts = jupytext.config.opts,
}
