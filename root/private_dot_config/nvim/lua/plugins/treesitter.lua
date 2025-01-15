local M = {}

table.insert(M, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
})

return M
