local M = {}

local bytes = string.byte
local char = string.char

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- subject to change

M.map = {}

function M.split(str)
	local codes = { bytes(str, 1, #str) }

	local chars = {}
	for i = 1, #codes do
		chars[i] = char(codes[i])
	end

	return chars
end

function M.new(modes, keys, cmd, desc)
	return {
		modes = modes,
		keys = "<leader>" .. keys,
		cmd = "<cmd>" .. cmd .. "<cr>",
		desc = desc,
	}
end

function M.add(bind)
	table.insert(M.map, bind)
end

function M.add_new(modes, keys, cmd, desc)
	local bind = M.new(modes, keys, cmd, desc)
	M.add(bind)
	return bind
end

function M.convert_to_std(bind)
	return M.split(bind.modes), bind.keys, bind.cmd, { desc = bind.desc }
end

function M.convert_to_whichkey(bind)
	return {
		bind.keys,
		bind.cmd,
		desc = bind.desc,
		mode = M.split(bind.modes),
	}
end

-- todo move somewhere else

M.add_new("nv", "`", "cd %:p:h", "change current working directory to file's")

-- splits

M.add_new("nv", "h", "wincmd h", "focus left split")
M.add_new("nv", "j", "wincmd j", "focus bottom split")
M.add_new("nv", "k", "wincmd k", "focus top split")
M.add_new("nv", "l", "wincmd l", "focus right split")

M.add_new("nv", "H", "wincmd H", "swap split to left")
M.add_new("nv", "J", "wincmd J", "swap split to bottom")
M.add_new("nv", "K", "wincmd K", "swap split to top")
M.add_new("nv", "L", "wincmd L", "swap split to right")

M.add_new("nv", ";", "vsplit", "split left current")
M.add_new("nv", "'", "split", "split top current")

M.add_new("nv", ":", "vnew", "split left new")
M.add_new("nv", '"', "new", "split top new")

M.add_new("nv", "<enter>", "vsplit", "open current")
M.add_new("nv", "<s-enter>", "vnew", "open new")

M.add_new("nv", "<bs>", "close", "close current split")
M.add_new("nv", "<s-bs>", "only", "close all except current split")

M.add_new("nv", "[", "-wincmd w", "focus previous split")
M.add_new("nv", "]", "+wincmd w", "focus next split")

M.add_new("nv", "{", "wincmd R", "swap split with next")
M.add_new("nv", "}", "wincmd r", "swap split with previous")

-- yazi

M.add_new("nv", "e", "Yazi", "open yazi at the current file")
M.add_new("nv", "E", "Yazi cwd", "open yazi in current working directory")
M.add_new("nv", "<c-e>", "Yazi toggle", "resume last yazi session")

-- telescope

M.add_new("nv", "f", "Telescope find_files", "find files")
M.add_new("nv", "F", "Telescope live_grep", "live grep files")

M.add_new("nv", "b", "Telescope buffers", "list buffers")
M.add_new("nv", "B", "Telescope oldfiles", "list old files")

M.add_new("nv", "r", "Telescope commands", "list commands")
M.add_new("nv", "<c-r>", "Telescope command_history", "show command history")

M.add_new("nv", "v", "Telescope registers", "list registers")

M.add_new("nv", "/", "Telescope current_buffer_fuzzy_find", "fuzzy find in buffer")

M.add_new("nv", "i", "=vim.lsp.buf.hover()", "show symbol information")
M.add_new("nv", "I", "=vim.lsp.buf.signature_help()", "show symbol signature help")

M.add_new("nv", "a", "=vim.lsp.buf.code_action()", "list code actions")

M.add_new("nv", "n", "Telescope lsp_references", "list symbol references")
M.add_new("nv", "N", "=vim.lsp.buf.rename()", "rename symbol")

M.add_new("nv", "d", "Telescope diagnostics bufnr=0", "list buffer diagnostics")
M.add_new("nv", "D", "Telescope diagnostics", "list workspace diagnostics")

M.add_new("nv", "s", "Telescope lsp_document_symbols", "list buffer symbols")
M.add_new("nv", "S", "Telescope lsp_workspace_symbols", "list workspace symbols")

M.add_new("nv", "t", "Telescope lsp_definitions", "list symbol definitions")
M.add_new("nv", "T", "Telescope lsp_implementations", "list symbol implementations")
M.add_new("nv", "<c-t>", "Telescope lsp_type_definitions", "list symbol type definitions")

M.add_new("nv", "g", "Telescope git_commits", "list commits")
M.add_new("nv", "G", "Telescope git_branches", "list branches")

local function init()
	local map = vim.keymap.set
	for _, bind in ipairs(M.map) do
		map(M.convert_to_std(bind))
	end
end

init()

return M
