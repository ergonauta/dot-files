require("treesitter-context").setup {
  enable = true,
  max_lines = 5,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = "outer",
  mode = "topline",
  separator = "─",
  zindex = 20,
}
