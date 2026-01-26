local cmp = require "cmp"

cmp.setup {
  sources = cmp.config.sources {
    { name = "copilot", priority = 1000, group_index = 2 },
    { name = "nvim_lsp", priority = 900 },
    { name = "path", priority = 500 },
    { name = "buffer", priority = 300 },
    { name = "vim-dadbod-completion" },
  },

  -- mapping = cmp.mapping.preset.insert {
  --   ["<Tab>"] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.select_next_item()
  --     else
  --       fallback()
  --     end
  --   end, { "i", "s" }),
  --
  --   ["<S-Tab>"] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.select_prev_item()
  --     else
  --       fallback()
  --     end
  --   end, { "i", "s" }),
  --
  --   ["<CR>"] = cmp.mapping.confirm { select = true },
  -- },
}
