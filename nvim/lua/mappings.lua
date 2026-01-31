require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Copilot
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Copilot Chat" })

-- Tmux navigation
map("n", "<M-h>", ":TmuxNavigateLeft<CR>", { desc = "Tmux Navigate Left" })
map("n", "<M-j>", ":TmuxNavigateDown<CR>", { desc = "Tmux Navigate Down" })
map("n", "<M-k>", ":TmuxNavigateUp<CR>", { desc = "Tmux Navigate Up" })
map("n", "<M-l>", ":TmuxNavigateRight<CR>", { desc = "Tmux Navigate Right" })

-- Map NVChad rename to <leader>rn
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP Rename" })
-- Map code action to <leader>ca
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code Action" })

-- Map Trouble to <leader>t
-- Trouble diagnostics toggle <leader>td
map("n", "<leader>td", "<cmd>TroubleToggle<CR>", { desc = "Trouble Diagnostics" })
-- Trouble workspace diagnostics toggle <leader>tw
map("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Trouble Workspace Diagnostics" })
-- Trouble quickfix toggle <leader>tq
map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Trouble Quickfix" })

-- Use tf to run require("neotest").run.run(vim.fn.expand("%"))
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run the current file's tests" })

-- Use tn to run nearest test require("neotest").run.run()
map("n", "<leader>tn", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

-- ── Diffview.nvim ─────────────────────────────────────────
map("n", "<leader>dvo", ":DiffviewOpen<CR>", { noremap = true, silent = true, desc = "Open Diffview" })
map("n", "<leader>dvc", ":DiffviewClose<CR>", { noremap = true, silent = true, desc = "Close Diffview" })
map("n", "<leader>dvr", ":DiffviewRefresh<CR>", { noremap = true, silent = true, desc = "Refresh Diffview" })
map(
  "n",
  "<leader>dvh",
  ":DiffviewFileHistory<CR>",
  { noremap = true, silent = true, desc = "File history in Diffview" }
)
-- Optional: quick ranges
map(
  "n",
  "<leader>dvm",
  ":DiffviewOpen origin/main...HEAD<CR>",
  { noremap = true, silent = true, desc = "Diff vs main" }
)
map("n", "<leader>dv2", ":DiffviewOpen HEAD~2<CR>", { noremap = true, silent = true, desc = "Diff 2 commits back" })

-- Notify
vim.keymap.set("n", "<leader>nd", function()
  require("notify").dismiss { silent = true, pending = true }
end, { desc = "Dismiss notifications" })

-- ── LSP Navigation via Telescope ─────────────────────────

-- Go to definition (with preview & split support)
map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to Definition (Telescope)" })

-- Find references
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Go to References (Telescope)" })

-- Go to implementations
map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Go to Implementation (Telescope)" })

-- Symbol searching
map("n", "<leader>gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document Symbols" })

map("n", "<leader>gS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })

-- ── Database Mappings ─────────────────────────
vim.keymap.set("n", "<leader>dbt", "<cmd>DBUIToggle<CR>", { desc = "DB UI toggle" })
vim.keymap.set("n", "<leader>dbb", "<cmd>DBUIFindBuffer<CR>", { desc = "DB find buffer" })
