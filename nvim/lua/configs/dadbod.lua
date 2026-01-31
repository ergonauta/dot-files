local data_dir = vim.fn.getcwd() .. "/.nvim"

vim.g.db_ui_save_location = data_dir .. "/db_ui"
vim.g.db_ui_use_nerd_fonts = 1

-- UI behaviour
vim.g.db_ui_winwidth = 50
vim.g.db_ui_execute_on_save = true

-- Results panel configuration
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 0
vim.g.db_ui_win_position = "left"

-- Set result window height to ~50% of screen
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.cmd("resize " .. math.floor(vim.o.lines * 0.5))
  end,
})
