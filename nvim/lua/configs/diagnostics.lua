vim.diagnostic.config {
  virtual_text = {
    spacing = 2,
    prefix = "●",
    -- hard-truncate so it never overflows your terminal width
    format = function(d)
      local msg = d.message:gsub("\n", " ")
      local max = math.max(30, math.floor(vim.o.columns * 0.4)) -- ~40% of window
      if #msg > max then
        return msg:sub(1, max) .. "…"
      end
      return msg
    end,
  },
  -- Full diagnostic as virtual line on the current cursor line (0.12 native)
  virtual_lines = { current_line = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
    },
  },
  float = {
    border = "rounded",
    source = true,
  },
  severity_sort = true,
  update_in_insert = false,
}
