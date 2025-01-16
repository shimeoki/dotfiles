return {
    "neovim/nvim-lspconfig",
    priority = 10, -- load after mason
    config = require("config.lsp").init,
}
