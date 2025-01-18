local M = {}

local function plug()
	return require("langmapper")
end

function M.init()
	plug().automapping({
		global = true,
		buffer = true,
	})
end

return M
