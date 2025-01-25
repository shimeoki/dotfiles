local M = {}

local binds = require("binds")

M.binds = {}

local function add(bind)
	table.insert(M.binds, bind)
end

add(binds.new("nv", "e", "Yazi", "open yazi at the current file"))
add(binds.new("nv", "E", "Yazi cwd", "open yazi in current working directory"))
add(binds.new("nv", "<c-e>", "Yazi toggle", "resume last yazi session"))

return M
