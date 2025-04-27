-- info:
-- there are binds specified in which-key format for lazy loading in one place.
-- this file should be required() to which-key add() function.

local lsp = vim.lsp
local lspb = lsp.buf
local input = vim.api.nvim_input

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
	new({ "`", "cd %:p:h", "change current working directory to file's" }),

	new({ "u", "w", "save current file" }),
	new({ "U", "wall", "save all files" }),

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

	new({
		"i",
		function()
			lspb.hover()
		end,
		"show symbol information",
	}),
	new({
		"I",
		function()
			lspb.signature_help()
		end,
		"show symbol signature help",
	}),
	new({
		"<c-i>",
		function()
			local hints = lsp.inlay_hint
			hints.enable(not hints.is_enabled())
		end,
		"toggle inlay hints",
	}),
	new({
		"a",
		function()
			lspb.code_action()
		end,
		"list code actions",
	}),
	new({
		"N",
		function()
			lspb.rename()
		end,
		"rename symbol",
	}),

	new({
		"c",
		function()
			input("gcc")
		end,
		"toggle comment (normal)",
		modes = "n",
	}),
	new({
		"c",
		function()
			input("gc")
		end,
		"toggle comment (visual)",
		modes = "v",
	}),

	new({ "e", "Yazi", "open yazi at the current file" }),
	new({ "E", "Yazi cwd", "open yazi in current working directory" }),
	new({ "<c-e>", "Yazi toggle", "resume last yazi session" }),

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

	new({
		"q",
		function()
			require("quarto.runner").run_cell()
		end,
		"run cell with quarto",
		modes = "n",
	}),
	new({
		"q",
		function()
			require("quarto.runner").run_range()
		end,
		"run visual range with quarto",
		modes = "v",
	}),
	new({
		"Q",
		function()
			require("quarto.runner").run_above()
		end,
		"run cell and above with quarto",
	}),
	new({
		"<c-q>",
		function()
			require("quarto.runner").run_all()
		end,
		"run all cells with quarto",
	}),

	new({
		"<c-s-l>",
		function()
			local ls = require("luasnip")
			return ls.choice_active() and ls.change_choice(1)
		end,
		"next luasnip choice",
		modes = { "i", "s" },
		no_leader = true,
	}),
	new({
		"<c-s-h>",
		function()
			local ls = require("luasnip")
			return ls.choice_active() and ls.change_choice(-1)
		end,
		"previous luasnip choice",
		modes = { "i", "s" },
		no_leader = true,
	}),
}
