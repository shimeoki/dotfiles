local M = {}

local langs = {
	"lua",
	"go",
}

M.opts = {
	ensure_installed = langs,
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
}

return M
