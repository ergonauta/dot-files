local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      i = {
        ["<C-u>"] = false, -- Disable clearing the prompt
        ["<C-d>"] = false, -- Disable deleting half of the prompt
      },
    },
    path_display = { "smart" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
}
