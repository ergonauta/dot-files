-- Git status highlight colors
vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL", { fg = "#73daca" }) -- green: untracked
vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL", { fg = "#e0af68" }) -- yellow: modified
vim.api.nvim_set_hl(0, "NvimTreeGitFileStagedHL", { fg = "#73daca" }) -- green: staged
vim.api.nvim_set_hl(0, "NvimTreeGitFileRenamedHL", { fg = "#7aa2f7" }) -- blue: renamed
vim.api.nvim_set_hl(0, "NvimTreeGitFileDeletedHL", { fg = "#f7768e" }) -- red: deleted
vim.api.nvim_set_hl(0, "NvimTreeGitFileMergeHL", { fg = "#ff9e64" }) -- orange: unmerged
vim.api.nvim_set_hl(0, "NvimTreeGitFileIgnoredHL", { fg = "#565f89" }) -- dim gray: ignored

local options = {
  sort = {
    sorter = "modification_time",
    folders_first = true,
  },
  view = {
    width = {
      min = 35,
      max = 55,
    },
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    highlight_git = "name",
    icons = {
      show = {
        git = false, -- hide git icons; color on names is enough
      },
    },
  },
  filters = {
    dotfiles = false,
    exclude = { ".env" },
    custom = {
      ".DS_Store",
      "node_modules",
      "__pycache__",
      "^%.git$",
      ".pytest_cache",
      ".mypy_cache",
      ".ruff_cache",
      "*.pyc",
      ".venv",
      "dist",
      ".next",
      "coverage",
      ".turbo",
    },
  },
  update_focused_file = {
    enable = true,
  },
  git = {
    enable = true,
  },
  modified = {
    enable = true,
  },
  diagnostics = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = true, -- tree closes after you pick a file
    },
  },
}

return options
