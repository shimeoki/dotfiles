local M = {}

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- subject to change

--- @class Bind
--- @field modes string
--- @field keys string
--- @field cmd string
--- @field desc string
local Bind = {}
Bind.__index = Bind

M.map = {}

local bytes = string.byte
local char = string.char

local function split(str)
	local codes = { bytes(str, 1, #str) }

	local chars = {}
	for i = 1, #codes do
		chars[i] = char(codes[i])
	end

	return chars
end

function M.new(modes, keys, cmd, desc)
	local self = setmetatable({}, Bind)

	self.modes = modes
	self.keys = "<leader>" .. keys
	self.cmd = "<cmd>" .. cmd .. "<cr>"
	self.desc = desc

	return self
end

function M.add(bind)
	table.insert(M.map, bind)
end

function M.add_new(modes, keys, cmd, desc)
	local bind = M.new(modes, keys, cmd, desc)
	M.add(bind)
	return bind
end

function Bind:to_std()
	return split(self.modes), self.keys, self.cmd, { desc = self.desc }
end

function M.convert_to_std(bind)
	return bind:to_std()
end

function Bind:to_which_key()
	return {
		self.keys,
		self.cmd,
		desc = self.desc,
		mode = split(self.modes),
	}
end

function M.convert_to_whichkey(bind)
	return bind:to_which_key()
end

function Bind:to_lazy()
	return {
		self.keys,
		self.cmd,
		mode = split(self.modes),
		desc = self.desc,
	}
end

function M.convert_to_lazy(bind)
	return bind:to_lazy()
end

-- todo move somewhere else

M.add_new("nv", "`", "cd %:p:h", "change current working directory to file's")

-- file management

M.add_new("nv", "u", "w", "save current file")
M.add_new("nv", "U", "wall", "save all files")

-- splits

M.add_new("nv", "h", "wincmd h", "focus left split")
M.add_new("nv", "j", "wincmd j", "focus bottom split")
M.add_new("nv", "k", "wincmd k", "focus top split")
M.add_new("nv", "l", "wincmd l", "focus right split")

M.add_new("nv", "H", "wincmd H", "swap split to left")
M.add_new("nv", "J", "wincmd J", "swap split to bottom")
M.add_new("nv", "K", "wincmd K", "swap split to top")
M.add_new("nv", "L", "wincmd L", "swap split to right")

M.add_new("nv", "'", "vsplit", "split left current")
M.add_new("nv", ";", "split", "split top current")

M.add_new("nv", '"', "vnew", "split left new")
M.add_new("nv", ":", "new", "split top new")

M.add_new("nv", "<enter>", "vsplit", "open current")
M.add_new("nv", "<s-enter>", "vnew", "open new")

M.add_new("nv", "<bs>", "close", "close current split")
M.add_new("nv", "<s-bs>", "only", "close all except current split")
M.add_new("nv", "<c-bs>", "bdelete", "close current buffer")

M.add_new("nv", "[", "-wincmd w", "focus previous split")
M.add_new("nv", "]", "+wincmd w", "focus next split")

M.add_new("nv", "{", "wincmd R", "swap split with next")
M.add_new("nv", "}", "wincmd r", "swap split with previous")

-- lsp

M.add_new("nv", "i", "=vim.lsp.buf.hover()", "show symbol information")
M.add_new("nv", "I", "=vim.lsp.buf.signature_help()", "show symbol signature help")

M.add_new("nv", "a", "=vim.lsp.buf.code_action()", "list code actions")

M.add_new("nv", "N", "=vim.lsp.buf.rename()", "rename symbol")

local function init()
	local map = vim.keymap.set
	for _, bind in ipairs(M.map) do
		map(M.convert_to_std(bind))
	end
end

init()

return M
