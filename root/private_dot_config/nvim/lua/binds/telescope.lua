local M = {}

local binds = require("binds")
local t = "Telescope "

M.binds = {}

local function add(bind)
	table.insert(M.binds, bind)
end

add(binds.new("nv", "f", t .. "find_files", "find files"))
add(binds.new("nv", "F", t .. "live_grep", "live grep files"))

add(binds.new("nv", "b", t .. "buffers", "list buffers"))
add(binds.new("nv", "B", t .. "oldfiles", "list old files"))

add(binds.new("nv", "r", t .. "commands", "list commands"))
add(binds.new("nv", "<c-r>", t .. "command_history", "show command history"))

add(binds.new("nv", "v", t .. "registers", "list registers"))

add(binds.new("nv", "/", t .. "current_buffer_fuzzy_find", "fuzzy find in buffer"))

add(binds.new("nv", "n", t .. "lsp_references", "list symbol references"))
-- N is rename

add(binds.new("nv", "d", t .. "diagnostics bufnr=0", "list buffer diagnostics"))
add(binds.new("nv", "D", t .. "diagnostics", "list workspace diagnostics"))

add(binds.new("nv", "s", t .. "lsp_document_symbols", "list buffer symbols"))
add(binds.new("nv", "S", t .. "lsp_workspace_symbols", "list workspace symbols"))

add(binds.new("nv", "t", t .. "lsp_definitions", "list symbol definitions"))
add(binds.new("nv", "T", t .. "lsp_implementations", "list symbol implementations"))
add(binds.new("nv", "<c-t>", t .. "lsp_type_definitions", "list symbol type definitions"))

add(binds.new("nv", "g", t .. "git_commits", "list commits"))
add(binds.new("nv", "G", t .. "git_branches", "list branches"))

return M
