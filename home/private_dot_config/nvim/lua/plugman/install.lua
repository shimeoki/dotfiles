-- source: https://lazy.folke.io/installation

return function(path)
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
