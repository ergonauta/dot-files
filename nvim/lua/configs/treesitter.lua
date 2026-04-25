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

-- Install parsers if not already installed
local installed = require("nvim-treesitter.config").get_installed()
local to_install = vim.tbl_filter(function(p)
  return not vim.list_contains(installed, p)
end, parsers)

if #to_install > 0 then
  require("nvim-treesitter").install(to_install)
end

-- Enable treesitter highlighting for all buffers
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if vim.treesitter.get_parser(ev.buf, nil, { error = false }) then
      vim.treesitter.start(ev.buf)
    end
  end,
})
