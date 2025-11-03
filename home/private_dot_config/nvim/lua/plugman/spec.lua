local not_opening_a_file = vim.fn.argc(-1) == 0

return {
	-- luasnip is sorted differently because of the dependencies, but whatever
	-- keep-sorted start block=yes by_regex=(?i)".+/(.+)"
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
		opts = function()
			return require("plugins.blink").opts
		end,
	},
	{
		"stevearc/conform.nvim",
		main = "conform",
		event = { "BufWritePre" },
		cmd = { "ConformInfo", "Format", "FormatEnable", "FormatDisable" },
		config = function()
			require("plugins.conform").setup()
		end,
	},
	{
		"hat0uma/csvview.nvim",
		main = "csvview",
		cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
		opts = function()
			return require("plugins.csvview").opts
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		main = "luasnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("plugins.luasnip").setup()
		end,
	},
	{
		"wintermute-cell/gitignore.nvim",
		config = function()
			require("gitignore")
		end,
		cmd = { "Gitignore" },
	},
	{
		"lewis6991/gitsigns.nvim",
		main = "gitsigns",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {},
	},
	{
		"3rd/image.nvim",
		main = "image",
		ft = { "markdown" },
		opts = function()
			return require("plugins.image").opts
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
		opts = {},
	},
	{
		"mikesmithgh/kitty-scrollback.nvim",
		main = "kitty-scrollback",
		cmd = {
			"KittyScrollbackGenerateKittens",
			"KittyScrollbackCheckHealth",
			"KittyScrollbackGenerateCommandLineEditing",
		},
		event = { "User KittyScrollbackLaunch" },
		version = "^6.0.0",
		opts = function()
			return require("plugins.scrollback").opts
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = { "Mason", "MasonToolsInstall", "MasonToolsUpdate" },
		main = "mason-tool-installer",
		build = ":MasonToolsUpdate",
		lazy = not_opening_a_file,
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim", opts = {} },
		opts = function()
			return require("plugins.mason")
		end,
	},
	{
		"folke/noice.nvim",
		main = "noice",
		event = "VeryLazy",
		opts = function()
			return require("plugins.noice").opts
		end,
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		main = "catppuccin",
		priority = 1000,
		opts = function()
			return require("plugins.catppuccin").opts
		end,
	},
	{
		"windwp/nvim-autopairs",
		main = "nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
		},
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			require("plugins.lint").setup()
		end,
	},
	{
		"nvim-neotest/nvim-nio",
	},
	{
		"rcarriga/nvim-notify",
		opts = function()
			return require("plugins.notify").opts
		end,
	},
	{
		"michaelrommel/nvim-silicon",
		main = "nvim-silicon",
		cmd = "Silicon",
		opts = function()
			return require("plugins.silicon").opts
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			require("plugins.treesitter").setup()
		end,
		-- idk is this supported yet
		-- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	{
		"nvim-lualine/lualine.nvim",
		main = "lualine",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("plugins.lualine").opts
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		main = "nvim-web-devicons",
		opts = {},
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("plugins.telescope").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		main = "which-key",
		event = "VeryLazy",
		config = function()
			require("plugins.whichkey").setup()
		end,
	},
	{
		"mikavilpas/yazi.nvim",
		main = "yazi",
		event = "VeryLazy",
		opts = function()
			return require("plugins.yazi").opts
		end,
	},
	-- keep-sorted end
}
