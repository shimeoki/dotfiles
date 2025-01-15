local runtime = "LuaJIT"
local format = true
local hints = true

local function on_init(client)
    if not client.workspace_folders then
        return
    end

    local path = client.workspace_folders[1].name
    local rc1 = vim.loop.fs_stat(path .. "/.luarc.json")
    local rc2 = vim.loop.fs_stat(path .. "/.luarc.jsonc")

    if rc1 or rc2 then
        return
    end

    local cfg = client.config.settings.Lua

    cfg = vim.tbl_deep_extend('force', cfg, {
        runtime = { version = runtime },
        workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
        }
    })
end

-- source: https://github.com/neovim/neovim/issues/21686#issuecomment-1522446128
local settings = {
    runtime = { version = runtime },
    diagnostics = {
        globals = {
            "vim",
            "require",
        }
    },
    telemetry = { enable = false },
    format = { enable = format },
    hint = { enable = hints },
}

require("lspconfig").lua_ls.setup({
    on_init = on_init,
    settings = { Lua = settings },
})
