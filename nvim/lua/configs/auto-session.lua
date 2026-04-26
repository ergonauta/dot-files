require("auto-session").setup {
  log_level = "error",
  -- Skip home dir, downloads, root — only project dirs get sessions
  suppressed_dirs = { "~/", "~/Downloads", "/" },
  -- Separate session per git branch → plays well with worktrees
  use_git_branch = true,
  -- Close nvim-tree before save; it stores absolute paths that break on restore
  pre_save_cmds = { "NvimTreeClose" },
}
