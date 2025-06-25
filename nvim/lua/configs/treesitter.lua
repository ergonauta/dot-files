require("telescope").setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "html",
    "glimmer_javascript",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "glimmer_typescript",
    "typescript",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
