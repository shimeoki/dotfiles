return {
    "neovim/nvim-lspconfig",
    priority = 10, -- load after mason
    config = function()
        require("lspconfig").lua_ls.setup(require("config.lsp.lua_ls").opts)
    end,
}
