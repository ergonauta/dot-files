local glance = require "glance"
local actions = glance.actions

glance.setup {
  height = 18,
  zindex = 45,
  border = { enable = true, top_char = "―", bottom_char = "―" },
  theme = { enable = true, mode = "auto" },
  mappings = {
    list = {
      ["j"] = actions.next,
      ["k"] = actions.previous,
      ["<Tab>"] = actions.next_location,
      ["<S-Tab>"] = actions.previous_location,
      ["<C-u>"] = actions.preview_scroll_win(5),
      ["<C-d>"] = actions.preview_scroll_win(-5),
      ["v"] = actions.jump_vsplit,
      ["s"] = actions.jump_split,
      ["t"] = actions.jump_tab,
      ["<CR>"] = actions.jump,
      ["o"] = actions.jump,
      ["<C-q>"] = actions.quickfix,
      ["q"] = actions.close,
      ["Q"] = actions.close,
    },
    preview = {
      ["q"] = actions.close,
      ["<Tab>"] = actions.next_location,
      ["<S-Tab>"] = actions.previous_location,
    },
  },
}
