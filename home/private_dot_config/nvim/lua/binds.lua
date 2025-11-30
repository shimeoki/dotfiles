-- info:
-- there are binds specified in which-key format for lazy loading in one place.
-- this file should be required() to which-key add() function.

local lsp = vim.lsp
local lspb = lsp.buf
local input = vim.api.nvim_input

local function show_symbol_info()
	lspb.hover()
end

local function show_signature_help()
	lspb.signature_help()
end

local function toggle_hints()
	local hints = lsp.inlay_hint
	hints.enable(not hints.is_enabled())
end

local function list_code_actions()
	lspb.code_action()
end

local function rename_symbol()
	lspb.rename()
end

local function toggle_comment_in_normal()
	input("gcc")
end

local function toggle_comment_in_visual()
	input("gc")
end

local function luasnip_next()
	local ls = require("luasnip")
	return ls.choice_active() and ls.change_choice(1)
end

local function luasnip_prev()
	local ls = require("luasnip")
	return ls.choice_active() and ls.change_choice(-1)
end

local function luasnip_unlink()
	require("luasnip").unlink_current()
end

local t = "Telescope "

--- @class Bind
---
--- @field [1] string key (lhs)
--- @field no_leader? boolean
---
--- @field [2] string | fun(): any cmd (rhs)
--- @field no_wrap? boolean
---
--- @field [3] string | fun(): string description
---
--- @field silent? boolean
--- @field modes? string | string[]

--- @param b Bind
local function new(b)
	local key = b[1]
	local cmd = b[2]
	local desc = b[3]

	local lhs
	if b.no_leader then
		lhs = key
	else
		lhs = "<leader>" .. key
	end

	local rhs
	if type(cmd) == "function" or b.no_wrap then
		rhs = cmd
	else
		rhs = "<cmd>" .. cmd .. "<cr>"
	end

	local silent = b.silent or true
	local modes = b.modes or { "n", "v" }

	return { lhs, rhs, desc = desc, silent = silent, mode = modes }
end

return {
	new({
		"<space>",
		"<nop>",
		"no spacebar action",
		no_leader = true,
		no_wrap = true,
	}),

	new({
		"<c-d>",
		'"_d',
		"delete with no register",
		no_wrap = true,
	}),

	new({ "@", "cd %:p:h", "change current working directory to file's" }),

	new({ "u", "w", "save current file" }),
	new({ "U", "wall", "save all files" }),
	new({ "x", "wqall", "save all files and quit" }),

	new({ "h", "wincmd h", "focus left split" }),
	new({ "j", "wincmd j", "focus bottom split" }),
	new({ "k", "wincmd k", "focus top split" }),
	new({ "l", "wincmd l", "focus right split" }),

	new({ "H", "wincmd H", "swap split to left" }),
	new({ "J", "wincmd J", "swap split to bottom" }),
	new({ "K", "wincmd K", "swap split to top" }),
	new({ "L", "wincmd L", "swap split to right" }),

	new({ ",", "bnext", "next buffer" }),
	new({ ".", "bprevious", "previous buffer" }),

	new({ "<c-h>", "4wincmd <", "decrease split width" }),
	new({ "<c-j>", "4wincmd -", "decrease split height" }),
	new({ "<c-k>", "4wincmd +", "increase split width" }),
	new({ "<c-l>", "4wincmd >", "increase split width" }),

	new({ "'", "vsplit", "split horizontally current" }),
	new({ ";", "split", "split vertically current" }),

	new({ '"', "vnew", "split horizontally new" }),
	new({ ":", "new", "split vertically new" }),

	new({ "<enter>", "vsplit", "open current" }),
	new({ "<s-enter>", "vnew", "open new" }),

	new({ "<bs>", "quit", "close current split" }),
	new({ "<s-bs>", "only", "close all except current split" }),
	new({ "<c-bs>", "bdelete", "close current buffer" }),

	new({ "[", "-wincmd w", "focus previous split" }),
	new({ "]", "+wincmd w", "focus next split" }),

	new({ "{", "wincmd R", "swap split with next" }),
	new({ "}", "wincmd r", "swap split with previous" }),

	new({ "i", show_symbol_info, "show symbol information" }),
	new({ "I", show_signature_help, "show symbol signature help" }),
	new({ "<c-i>", toggle_hints, "toggle inlay hints" }),
	new({ "a", list_code_actions, "list code actions" }),
	new({ "N", rename_symbol, "rename symbol" }),

	new({
		"c",
		toggle_comment_in_normal,
		"toggle comment (normal)",
		modes = "n",
	}),
	new({
		"c",
		toggle_comment_in_visual,
		"toggle comment (visual)",
		modes = "v",
	}),

	new({ "e", "Yazi", "open yazi at the current file" }),
	new({ "E", "Yazi cwd", "open yazi in current working directory" }),
	new({ "<c-e>", "Yazi toggle", "resume last yazi session" }),

	new({ "p", "Lazy", "open lazy.nvim" }),

	new({ "f", t .. "find_files", "find files" }),
	new({ "F", t .. "live_grep", "live grep fils" }),

	new({ "b", t .. "buffers", "list buffers" }),
	new({ "B", t .. "oldfiles", "list old files" }),

	new({ "r", t .. "commands", "list commands" }),
	new({ "<c-r>", t .. "command_history", "show command history" }),

	new({ "v", t .. "registers", "list registers" }),

	new({ "/", t .. "current_buffer_fuzzy_find", "fuzzy find in buffer" }),
	new({ "n", t .. "lsp_references", "list symbol references" }),

	new({ "d", t .. "diagnostics bufnr=0", "list buffer diagnostics" }),
	new({ "D", t .. "diagnostics", "list workspace diagnostics" }),
	new({ "s", t .. "lsp_document_symbols", "list buffer symbols" }),
	new({ "S", t .. "lsp_workspace_symbols", "list workspace symbols" }),
	new({ "t", t .. "lsp_definitions", "list symbol definitions" }),
	new({ "T", t .. "lsp_implementations", "list symbol implementations" }),
	new({ "<c-t>", t .. "lsp_type_definitions", "list symbol type definitions" }),

	new({ "g", t .. "git_commits", "list commits" }),
	new({ "G", t .. "git_branches", "list branches" }),
	new({ "<c-g>", t .. "git_status", "list staged files" }),

	new({
		"<c-s-l>",
		luasnip_next,
		"next luasnip choice",
		modes = { "i", "s" },
		no_leader = true,
	}),
	new({
		"<c-s-h>",
		luasnip_prev,
		"previous luasnip choice",
		modes = { "i", "s" },
		no_leader = true,
	}),
	new({
		"<c-bs>",
		luasnip_unlink,
		"unlink snippet",
		modes = { "i", "s" },
		no_leader = true,
	}),
}
