return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "lua"
                },
                sync_install = false,
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
            })
        end
    },
    {
        "neovim/nvim-lspconfig"
    },
}
