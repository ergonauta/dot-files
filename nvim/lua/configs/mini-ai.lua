require("mini.ai").setup {
  -- Search up to 500 lines for text object boundaries
  n_lines = 500,
  -- Custom text objects beyond defaults
  custom_textobjects = {
    -- Whole buffer
    g = function()
      local from = { line = 1, col = 1 }
      local to = { line = vim.fn.line "$", col = math.max(vim.fn.getline("$"):len(), 1) }
      return { from = from, to = to }
    end,
  },
}
