local tab_width = 4
local tab_to_spaces = true

local columns = 80

local set = vim.opt

set.tabstop = 8
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
