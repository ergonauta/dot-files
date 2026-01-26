-- lua/configs/diagnostics.lua
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
  float = {
    border = "rounded",
    source = "always",
  },
  severity_sort = true,
  update_in_insert = false,
}

-- Show diagnostics automatically when you pause the cursor
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})
