local cmp = require "cmp"

cmp.setup {
  sources = cmp.config.sources {
    { name = "nvim_lsp", priority = 900 },
    { name = "path", priority = 500 },
    { name = "buffer", priority = 300 },
  },
}
