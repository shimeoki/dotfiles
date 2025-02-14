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

set.colorcolumn = tostring(columns + 1)

set.breakindent = true

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

set.splitright = true
set.splitbelow = true

set.cursorline = true

set.updatetime = 1000

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- subject to change

local python_exec = "/nvim/bin/python3"
vim.g.python3_host_prog = vim.fn.expand(vim.env.VENV_HOME .. python_exec)
