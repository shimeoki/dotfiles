local M = {}

local lsp_list = {
    "lua_ls",
}

M.lsp = {}

M.lsp.opts = {
    ensure_installed = lsp_list,
}

return M
