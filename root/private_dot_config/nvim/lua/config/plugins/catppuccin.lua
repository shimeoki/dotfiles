local M = {}

local integrations = {
	notify = true,
	noice = true,
	mason = true,
	which_key = true,
}

M.opts = {
	integrations = integrations,
}

return M
