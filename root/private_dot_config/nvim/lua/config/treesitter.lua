local langs = {
    "lua",
    "go"
}

require("nvim-treesitter.configs").setup({
    ensure_installed = langs,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
