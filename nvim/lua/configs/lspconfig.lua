require("nvchad.configs.lspconfig").defaults()
require "configs.diagnostics"

local servers = { "html", "cssls", "ts_ls", "jsonls", "lua_ls", "markdown", "ruff", "pyright", "eslint" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
