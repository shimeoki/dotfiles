-- source: https://lazy.folke.io/installation

local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(path) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		repo,
		path,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\npress any key to exit" },
		}, true, {})

		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(path)

local opts = {
	check = false,
	reload = false,
	ui = {
		theme = "catppuccin",
		border = "rounded",
	},
	install = {
		missing = true,
	},
}

require("lazy").setup({
	spec = { { import = "plugins" } },
	install = {
		missing = opts.install.missing,
		colorscheme = { opts.ui.theme },
	},
	checker = { enabled = opts.check },
	ui = { border = opts.ui.border },
	rocks = { hererocks = true },
	change_detection = { enabled = opts.reload },
})
