require "nvchad.options"

local o = vim.o
o.conceallevel = 2 -- Enable concealing for obsidian.nvim UI features

-- Markdown-specific settings (for obsidian.nvim)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldenable = true
    vim.opt_local.foldlevel = 00
  end,
})
