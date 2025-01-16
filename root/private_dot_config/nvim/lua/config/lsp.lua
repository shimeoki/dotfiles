local M = {}

-- enable or disable lsp's here
local enabled = {
    lua_ls = true,
}

-- make a list from enabled lsp's
M.list = {}
for k, v in pairs(enabled) do
    if v then
        table.insert(M.list, k)
    end
end

function M.init()
    local cfg = require("lspconfig")
    if not cfg then
        return
    end

    local prefix = "config.lsp."
    local lspcfg

    for _, v in ipairs(M.list) do
        lspcfg = require(prefix .. v)
        if lspcfg then
            cfg[v].setup(lspcfg.opts)
        end
    end
end

return M
