local M = {}

M.opts = {
	preset = "modern",
	win = {
		border = "none",
	},
}

function M.setup()
	local wk = require("which-key")
	wk.setup(M.opts)
	wk.add(require("binds"))
end

return M
