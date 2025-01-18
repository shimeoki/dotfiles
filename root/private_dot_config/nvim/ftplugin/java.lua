local cfg = require("config.lsp.jdt_ls")

require("jdtls").start_or_attach(cfg.config())
