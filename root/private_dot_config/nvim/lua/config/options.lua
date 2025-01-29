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

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- subject to change
