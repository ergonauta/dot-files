local options = {
  format_on_save = {
    timeout_ms = 500, -- Timeout for formatting
    lsp_fallback = true, -- Use LSP formatting if conform fails
  },
  -- Filetype → formatter chain (first available wins)
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" }, -- .jsx
    typescript = { "prettier" },
    typescriptreact = { "prettier" }, -- .tsx

    python = { "ruff_format" },
  },

  -- Optional fine-tuning
  -- formatters = {
  --   stylua = { args = { "--search-parent-directories", "-" } },
  --   prettierd = { env = { PRETTIERD_LOCAL_PRETTIER_ONLY = "1" } }, -- prefer project prettier
  --   prettier = { args = { "--stdin-filepath", "$FILENAME" } },
  --   ruff_format = {},
  --   black = { args = { "--fast", "-" } },
  -- },
}

return options
