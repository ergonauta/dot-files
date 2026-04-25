require("claudecode").setup {
  terminal = {
    split_side = "right",
    split_width_percentage = 0.50,
    provider = "snacks",
    auto_close = false,
    git_repo_cwd = true,
    snacks_win_opts = {
      keys = {
        term_normal = {
          "jk",
          function()
            vim.cmd "stopinsert"
          end,
          mode = "t",
          desc = "Exit terminal mode",
        },
      },
    },
  },

  track_selection = true,
  focus_after_send = true,

  diff_opts = {
    layout = "vertical",
    open_in_new_tab = true,
    keep_terminal_focus = false,
    hide_terminal_in_new_tab = true,
  },
}
