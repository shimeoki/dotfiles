local tab_width = 4
local tab_to_spaces = true
local columns = 80
local scrolloff = 4

local set = vim.opt

set.tabstop = tab_width
set.softtabstop = tab_width
set.shiftwidth = tab_width
set.expandtab = tab_to_spaces

set.number = true
set.relativenumber = true

-- source: https://stackoverflow.com/a/50415982
set.textwidth = 0
set.wrapmargin = 0
set.wrap = true
set.linebreak = true
set.columns = columns

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.termguicolors = true

set.scrolloff = scrolloff

set.signcolumn = "yes"

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.showmode = false
set.showtabline = 0

-- source: https://github.com/Wansmer/langmapper.nvim
local function escape(str)
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

set.langmap = vim.fn.join({
	escape(ru_shift) .. ";" .. escape(en_shift),
	escape(ru) .. ";" .. escape(en),
}, ",")
