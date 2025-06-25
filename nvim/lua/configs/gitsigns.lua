require("gitsigns").setup {
  vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" }),
  vim.keymap.set("n", "<leader>gP", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview Hunk Inline" }),
}
