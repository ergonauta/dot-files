local parsers = {
  "bash",
  "css",
  "dockerfile",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "regex",
  "sql",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

-- main branch removed the Lua install API; parsers managed via build = ":TSUpdate"
-- Run :Lazy build nvim-treesitter or :TSUpdate to install missing parsers

-- Enable treesitter highlighting for all buffers
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if vim.treesitter.get_parser(ev.buf, nil, { error = false }) then
      vim.treesitter.start(ev.buf)
    end
  end,
})
