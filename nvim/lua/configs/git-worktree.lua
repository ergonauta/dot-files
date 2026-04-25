local telescope = require "telescope"
local hooks = require "git-worktree.hooks"

telescope.load_extension "git_worktree"

local map = vim.keymap.set

map("n", "<leader>gws", function()
  telescope.extensions.git_worktree.git_worktree()
end, { desc = "Git Worktree switch" })

map("n", "<leader>gwn", function()
  -- Resolve the main git dir so Telescope works from inside a worktree
  local toplevel = vim.fn.system "git rev-parse --show-toplevel 2>/dev/null"
  toplevel = vim.trim(toplevel)
  -- If inside a worktree, .git is a file; find the common dir's parent
  local git_dir = vim.fn.system "git rev-parse --git-common-dir 2>/dev/null"
  git_dir = vim.trim(git_dir)
  local cwd = toplevel
  if git_dir ~= "" and git_dir ~= ".git" then
    -- git-common-dir returns the shared .git dir; its parent is the main worktree
    cwd = vim.fn.fnamemodify(git_dir, ":h")
  end
  telescope.extensions.git_worktree.create_git_worktree { cwd = cwd }
end, { desc = "Git Worktree new" })

hooks.register(hooks.type.SWITCH, hooks.builtins.update_current_buffer_on_switch)

hooks.register(hooks.type.SWITCH, function(path, prev_path)
  vim.notify("Switched to worktree: " .. path, vim.log.levels.INFO)
end)

hooks.register(hooks.type.CREATE, function(path, branch, upstream)
  vim.notify("Created worktree: " .. path .. " [" .. branch .. "]", vim.log.levels.INFO)
end)

hooks.register(hooks.type.DELETE, function(path)
  vim.notify("Deleted worktree: " .. path, vim.log.levels.INFO)
end)
