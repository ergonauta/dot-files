local cmp = require "cmp"

cmp.setup {
  sources = cmp.config.sources {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = function(fallback)
      -- If Copilot suggestion is visible, accept it
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      -- If cmp menu is visible, select next item
      elseif cmp.visible() then
        cmp.select_next_item()
      -- If cursor is at line start or only whitespace, insert tab
      elseif vim.fn.col "." == 1 or vim.fn.getline("."):sub(1, vim.fn.col "." - 1):match "^%s*$" then
        vim.api.nvim_feedkeys("\t", "n", false)
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
}
