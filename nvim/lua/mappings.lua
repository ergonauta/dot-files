require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Copilot: Accept suggestion with <C-l>
map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

-- Tmux navigation 
map('n', '<C-k>', ':wincmd k<CR>', { desc = "Tmux Navigate Up" })
map('n', '<C-j>', ':wincmd j<CR>', { desc = "Tmux Navigate Down" })
map('n', '<C-h>', ':wincmd h<CR>', { desc = "Tmux Navigate Left" })
map('n', '<C-l>', ':wincmd l<CR>', { desc = "Tmux Navigate Right" })
map('n', '<C-h>', ':TmuxNavigateLeft<CR>', { desc = "Tmux Navigate Left" })
map('n', '<C-j>', ':TmuxNavigateDown<CR>', { desc = "Tmux Navigate Down" })
map('n', '<C-k>', ':TmuxNavigateUp<CR>', { desc = "Tmux Navigate Up" })
map('n', '<C-l>', ':TmuxNavigateRight<CR>', { desc = "Tmux Navigate Right" })

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
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run the current file's tests" })

-- Use tn to run nearest test require("neotest").run.run()
map("n", "<leader>tn", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
