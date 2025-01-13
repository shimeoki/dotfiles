local cfg = require("nvim-treesitter.configs")

local langs = {
    "lua",
    "go"
}

cfg.setup({
    ensure_installed = langs,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
