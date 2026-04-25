local data_dir = vim.fn.getcwd() .. "/.nvim"

vim.g.db_ui_save_location = data_dir .. "/db_ui"
vim.g.db_ui_use_nerd_fonts = 1

-- UI behaviour
vim.g.db_ui_winwidth = 50
vim.g.db_ui_execute_on_save = true
vim.g.db_ui_win_position = "left"
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 0

-- Table helpers for PostgreSQL
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_table_helpers = {
  postgresql = {
    ["Count"] = "SELECT count(*) FROM {table}",
    ["Describe"] = "\\d+ {table}",
    ["Indexes"] = "\\di+ {table}",
    ["Top 100"] = "SELECT * FROM {table} LIMIT 100",
    ["Explain"] = "EXPLAIN ANALYZE SELECT * FROM {table} LIMIT 100",
    ["Foreign Keys"] = [[
SELECT conname, pg_get_constraintdef(oid)
FROM pg_constraint
WHERE conrelid = '{table}'::regclass AND contype = 'f']],
  },
}

-- Set result window height to ~50% of screen
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.cmd("resize " .. math.floor(vim.o.lines * 0.5))
  end,
})

-- Enable vim-dadbod-completion for sql buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql", "postgresql" },
  callback = function()
    local cmp = require "cmp"

    cmp.setup.buffer {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    }

    vim.bo.omnifunc = "vim_dadbod_completion#omni"
  end,
})
