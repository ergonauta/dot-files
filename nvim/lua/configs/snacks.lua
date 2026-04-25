require("snacks").setup {
  notifier = { enabled = true, timeout = 3000 },
  lazygit = { enabled = true },
  gitbrowse = { enabled = true },
  indent = { enabled = true, animate = { enabled = false } },
  quickfile = { enabled = true },
  words = { enabled = true },
  scope = { enabled = true },
  statuscolumn = { enabled = true },
  dashboard = {
    enabled = true,
    width = 80,
    row = nil,
    col = nil,
    pane_gap = 4,
    autokeys = "1234567890abcdefghijklmnopqrstuvwxyz",
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
        { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "o", desc = "Obsidian Search", action = ":Obsidian search" },
        { icon = " ", key = "d", desc = "Database UI", action = ":DBUIToggle" },
        { icon = " ", key = "t", desc = "Claude Code", action = ":ClaudeCodeFocus" },
        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
    sections = {
      { section = "header" },
      {
        pane = 2,
        icon = " ",
        desc = "Browse Repo",
        padding = 1,
        key = "b",
        action = function()
          Snacks.gitbrowse()
        end,
      },
      function()
        local in_git = Snacks.git.get_root() ~= nil
        local cmds = {
          {
            title = "Notifications",
            cmd = "gh status",
            action = function()
              vim.ui.open "https://github.com/notifications"
            end,
            key = "n",
            icon = " ",
            height = 5,
            enabled = true,
          },
          {
            title = "Open Issues",
            cmd = "gh issue list -L 3",
            key = "i",
            action = function()
              vim.fn.jobstart("gh issue list --web", { detach = true })
            end,
            icon = " ",
            height = 7,
          },
          {
            icon = " ",
            title = "Open PRs",
            cmd = "gh pr list -L 3",
            key = "P",
            action = function()
              vim.fn.jobstart("gh pr list --web", { detach = true })
            end,
            height = 7,
          },
          {
            icon = " ",
            title = "Git Status",
            cmd = "git --no-pager diff --stat -B -M -C",
            height = 10,
          },
        }
        return vim.tbl_map(function(cmd)
          return vim.tbl_extend("force", {
            pane = 2,
            section = "terminal",
            enabled = in_git,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          }, cmd)
        end, cmds)
      end,
      { section = "startup" },
    },
  },
}
