local cfg = require("config.lsp")

return {
    "neovim/nvim-lspconfig",
    priority = 10, -- load after mason
    opts = cfg.opts,
    config = cfg.init,
}
