local function config()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "java" },
		callback = function()
			local path = require("langservers.jdtls")(vim.fn.exepath("jdtls"))
			require("jdtls").start_or_attach(path)
		end,
	})
end

return {
	setup = config,
}
