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

function M.make(modes, keys, cmd, desc)
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

M.add(M.make("nv", "h", "wincmd h", "focus left split"))
M.add(M.make("nv", "j", "wincmd j", "focus down split"))
M.add(M.make("nv", "k", "wincmd k", "focus up split"))
M.add(M.make("nv", "l", "wincmd l", "focus right split"))

local function init()
	local map = vim.keymap.set
	for _, bind in ipairs(M.map) do
		map(M.convert_to_std(bind))
	end
end

init()

return M
