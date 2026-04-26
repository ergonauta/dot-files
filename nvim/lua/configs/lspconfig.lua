dofile(vim.g.base46_cache .. "lsp")
require "lspconfig" -- registers server cmd/filetypes/root_markers
require "configs.diagnostics"

-- Capabilities (for nvim-cmp completion support)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- Apply capabilities to all servers via wildcard config
-- Per-server settings live in ~/.config/nvim/lsp/*.lua (native 0.12)
vim.lsp.config("*", { capabilities = capabilities })

-- Enable servers (each reads its lsp/<name>.lua automatically)
-- ts_ls removed: typescript-tools.nvim manages tsserver directly (faster, source-def native)
local servers = { "html", "cssls", "jsonls", "lua_ls", "ruff", "pyright", "eslint" }
vim.lsp.enable(servers)

-- Inlay hints (off by default, toggle with <leader>lh)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method "textDocument/inlayHint" then
      vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    end
  end,
})

-- CodeLens (enable() added in 0.12; guard for 0.11 compat)
if vim.lsp.codelens.enable then
  vim.lsp.codelens.enable(true)
end
