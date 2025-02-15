local M = {
	indent = {
		width = 4,
		spaces = true,
		keep = true,
	},
	text = {
		columns = 80,
		scrolloff = 4,
	},
	split = {
		right = true,
		below = true,
	},
	cursor = {
		highlight_line = true,
	},
	relative_numbers = true,
}

local set = vim.opt

set.tabstop = M.indent.width
set.softtabstop = M.indent.width
set.shiftwidth = M.indent.width
set.expandtab = M.indent.spaces

set.number = true
set.relativenumber = M.relative_numbers

-- source: https://stackoverflow.com/a/50415982
set.textwidth = 0
set.wrapmargin = 0
set.wrap = true
set.linebreak = true

set.colorcolumn = tostring(M.text.columns + 1)

set.breakindent = M.indent.keep

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.termguicolors = true

set.scrolloff = M.text.scrolloff

set.signcolumn = "yes"

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.showmode = false
set.showtabline = 0

set.splitright = M.split.right
set.splitbelow = M.split.below

set.cursorline = M.cursor.highlight_line

set.updatetime = 1000

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- subject to change

local python_exec = "/nvim/bin/python3"
vim.g.python3_host_prog = vim.fn.expand(vim.env.VENV_HOME .. python_exec)

return M
