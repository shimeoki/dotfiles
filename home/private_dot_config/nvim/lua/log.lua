local M = {}

local title = "config"
local log = vim.notify
local lvl = vim.log.levels

function M.info(msg)
	log(msg, lvl.INFO, { title = title })
end

function M.warn(msg)
	log(msg, lvl.WARN, { title = title })
end

function M.error(msg)
	log(msg, lvl.ERROR, { title = title })
end

return M
