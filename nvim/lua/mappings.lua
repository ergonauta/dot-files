require "nvchad.mappings"

-- Remove NvChad git mappings that conflict
vim.keymap.del("n", "<leader>cm") -- confilcts with ClaudeCodeSelectModel
vim.keymap.del("n", "<leader>gt") -- duplicate of git status
vim.keymap.del("n", "<leader>ma") -- makrks moved to <leader>fm

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- LSP
--
-- Mnemonic guide:
--  Go to (bare g): gd/dG/dr/gi/gt/gs/gS = definition, Declaration, references, implementation, type, symbils
--  Edit (<leader>l): ca/rn/f            = code action, rename, format
--  Toggle (<leader>l): th/x/k           = toggle hints, execute codelens, hover

-- Go to / Navigate (bare g prefix)
map("n", "gd", function()
  local clients = vim.lsp.get_clients { bufnr = 0, name = "ts_ld" }
  if #clients > 0 then
    vim.cmd "LspTypescriptGoToSourceDefinition"
  else
    vim.lsp.buf.definition()
  end
end, { desc = "Go to definition (source-aware)" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Go to references" })
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Go to implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Go to document symbols" })
map("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Go to workspace symbol" })

-- Edit / Refactor (<leader>l prefix)
map({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, { desc = "LSP Code action" })
map("n", "<leader>lrn", vim.lsp.buf.rename, { desc = "LSP Rename symbol" })
map("n", "<leader>lf", function()
  require("conform").format { lsp_format = "fallback" }
end, { desc = "LSP Format buffer" })

-- Inspect / Toggle (<leader>l prefix)
map("n", "<leader>lth", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP Toggle inlay hints" })
map("n", "<leader>lt", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "LSP Toggle diagnostics" })
map("n", "<leader>lx", vim.lsp.codelens.run, { desc = "LSP Run codelens" })
map("n", "<leader>lk", function()
  vim.lsp.buf.hover { border = "rounded" }
end, { desc = "LSP Hover info" })
map("n", "<leader>ly", function()
  local d = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
  if #d > 0 then
    vim.fn.setreg("+", d[1].message)
    vim.notify("Copied: " .. d[1].message, vim.log.levels.INFO)
  end
end, { desc = "LSP Yank diagnostic message" })

-- Diagnostic navigation (severity-filtered)
map("n", "]e", function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
end, { desc = "Next error" })
map("n", "[e", function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
end, { desc = "Prev error" })

-- Git Integration (LazyGit)
map("n", "<leader>go", function()
  Snacks.lazygit()
end, { desc = "Git open (LazyGit)" })
map("n", "<leader>gof", function()
  Snacks.lazygit.log_file()
end, { desc = "Git open file" })
map("n", "<leader>gol", function()
  Snacks.lazygit.log()
end, { desc = "Git open log" })

-- Pull Request Commands
-- <leader>pr  = PR management
-- <leader>prv = PR review workflow
--
-- Mnemonic guide:
--   pr  l/s/d/c/f = list, search, diff, commits, files
--   pr  o/n/m/r   = open-browser, new, merge, ready
--   prv s/r/u/c/d = start, resume, submit(u), comments, discard
--   prv a/x/t     = add-comment, delete-comment, close-tab

-- PR listing & navigation
map("n", "<leader>prl", "<cmd>Octo pr list<CR>", { desc = "PR list" })
map("n", "<leader>prs", "<cmd>Octo pr search<CR>", { desc = "PR search" })
map("n", "<leader>prd", "<cmd>Octo pr diff<CR>", { desc = "PR diff" })
map("n", "<leader>prc", "<cmd>Octo pr commits<CR>", { desc = "PR commits" })
map("n", "<leader>prf", "<cmd>Octo pr changes<CR>", { desc = "PR changed files" })
map("n", "<leader>prk", "<cmd>Octo pr checks<CR>", { desc = "PR checks" })
map("n", "<leader>prp", "<cmd>Octo pr url<CR>", { desc = "PR copy url" })

-- PR lifecycle
map("n", "<leader>prn", "<cmd>Octo pr create<CR>", { desc = "PR new (create)" })
map("n", "<leader>pro", "<cmd>Octo pr browser<CR>", { desc = "PR open in browser" })
map("n", "<leader>prm", "<cmd>Octo pr merge<CR>", { desc = "PR merge" })
map("n", "<leader>prr", "<cmd>Octo pr ready<CR>", { desc = "PR mark ready" })
map("n", "<leader>prx", "<cmd>Octo pr close<CR>", { desc = "PR close" })
map("n", "<leader>prR", "<cmd>Octo pr reopen<CR>", { desc = "PR reopen" })
map("n", "<leader>prh", function()
  vim.ui.input({ prompt = "PR Number: " }, function(input)
    if input then
      vim.cmd("Octo pr checkout " .. input)
    end
  end)
end, { desc = "PR checkout" })
map("n", "<leader>prL", "<cmd>Octo pr reload<CR>", { desc = "PR reload" })

-- PR metadata
map("n", "<leader>praa", "<cmd>Octo assignee add<CR>", { desc = "PR add assignee" })
map("n", "<leader>prad", "<cmd>Octo assignee remove<CR>", { desc = "PR remove assignee" })
map("n", "<leader>prla", "<cmd>Octo label add<CR>", { desc = "PR add label" })
map("n", "<leader>prld", "<cmd>Octo label remove<CR>", { desc = "PR remove label" })
map("n", "<leader>prea", "<cmd>Octo reviewer add<CR>", { desc = "PR add reviewer" })

-- Review workflow: <leader>prv
map("n", "<leader>prvs", "<cmd>Octo review start<CR>", { desc = "Review start" })
map("n", "<leader>prvr", "<cmd>Octo review resume<CR>", { desc = "Review resume" })
map("n", "<leader>prvu", "<cmd>Octo review submit<CR>", { desc = "Review submit" })
map("n", "<leader>prvc", "<cmd>Octo review comments<CR>", { desc = "Review view comments" })
map("n", "<leader>prvd", "<cmd>Octo review discard<CR>", { desc = "Review discard" })
map("n", "<leader>prvt", "<cmd>Octo review close<CR>", { desc = "Review close tab" })

-- Comments (inside PR/review buffers)
map("n", "<leader>prva", "<cmd>Octo comment add<CR>", { desc = "Review add comment" })
map("n", "<leader>prvx", "<cmd>Octo comment delete<CR>", { desc = "Review delete comment" })

-- Thread resolution
map("n", "<leader>prvR", "<cmd>Octo thread resolve<CR>", { desc = "Review resolve thread" })
map("n", "<leader>prvU", "<cmd>Octo thread unresolve<CR>", { desc = "Review unresolve thread" })

-- GitHub Issues
map("n", "<leader>gil", "<cmd>Octo issue list<CR>", { desc = "Issue list" })
map("n", "<leader>gis", "<cmd>Octo issue search<CR>", { desc = "Issue search" })
map("n", "<leader>gin", "<cmd>Octo issue create<CR>", { desc = "Issue new" })
map("n", "<leader>gix", "<cmd>Octo issue close<CR>", { desc = "Issue close" })
map("n", "<leader>gio", "<cmd>Octo issue reopen<CR>", { desc = "Issue reopen" })
map("n", "<leader>gib", "<cmd>Octo issue browser<CR>", { desc = "Issue open in browser" })
map("n", "<leader>gip", "<cmd>Octo issue url<CR>", { desc = "Issue copy url" })

-- Notify
vim.keymap.set("n", "<leader>nd", function()
  Snacks.notifier.hide()
end, { desc = "Dismiss notifications" })
vim.keymap.set("n", "<leader>nh", function()
  Snacks.notifier.show_history()
end, { desc = "Notification history" })

-- Database Mappings
vim.keymap.set("n", "<leader>dbt", "<cmd>DBUIToggle<CR>", { desc = "DB UI toggle" })
vim.keymap.set("n", "<leader>dbb", "<cmd>DBUIFindBuffer<CR>", { desc = "DB find buffer" })
vim.keymap.set("n", "<leader>dba", "<cmd>DBUIAddConnection<CR>", { desc = "DB add connection" })

-- Query execution (works in DBUI sql buffers)
vim.keymap.set("n", "<leader>dbe", "<Plug>(DBUI_ExecuteQuery)", { desc = "DB execute query" })
vim.keymap.set("v", "<leader>dbe", "<Plug>(DBUI_ExecuteQuery)", { desc = "DB execute selection" })
vim.keymap.set("n", "<leader>dbw", "<Plug>(DBUI_SaveQuery)", { desc = "DB save query" })

-- Code Folding
map("n", "<leader>zt", "za", { desc = "Fold toggle" })
map("n", "<leader>zca", "zM", { desc = "Fold close all" })
map("n", "<leader>zoa", "zR", { desc = "Fold open all" })

-- Claude Code Mappings are in plugins/init.lua (lazy.nvim keys for auto-loading)

-- Obsidian
map("n", "<leader>on", "<cmd>Obsidian new<CR>", { desc = "New Obsidian note" })
map("n", "<leader>oo", "<cmd>Obsidian open<CR>", { desc = "Open in Obsidian app" })
map("n", "<leader>os", "<cmd>Obsidian search<CR>", { desc = "Search Obsidian notes" })
map("n", "<leader>oq", "<cmd>Obsidian quick_switch<CR>", { desc = "Quick switch notes" })

-- Daily notes
map("n", "<leader>ot", "<cmd>Obsidian today<CR>", { desc = "Today's daily note" })
map("n", "<leader>oy", "<cmd>Obsidian yesterday<CR>", { desc = "Yesterday's daily note" })
map("n", "<leader>oT", "<cmd>Obsidian tomorrow<CR>", { desc = "Tomorrow's daily note" })

-- Links and backlinks
map("n", "<leader>ol", "<cmd>Obsidian links<CR>", { desc = "Show note links" })
map("n", "<leader>ob", "<cmd>Obsidian backlinks<CR>", { desc = "Show backlinks" })
map("n", "<leader>of", "<cmd>Obsidian follow_link<CR>", { desc = "Follow link under cursor" })

-- Templates and tags
map("n", "<leader>otp", "<cmd>Obsidian template<CR>", { desc = "Insert template" })
map("n", "<leader>otg", "<cmd>Obsidian tags<CR>", { desc = "Search by tags" })

-- Workspace switching
map("n", "<leader>ow", "<cmd>Obsidian workspace<CR>", { desc = "Switch workspace" })

-- Toggle checkboxes
map("n", "<leader>oc", "<cmd>Obsidian toggle_checkbox<CR>", { desc = "Toggle checkbox" })

-- Insert empty checkbox
map("n", "<leader>oC", "i- [ ] <Esc>", { desc = "Insert empty checkbox" })
map("i", "<C-c><C-c>", "- [ ] ", { desc = "Insert empty checkbox (insert mode)" })

-- Paste image from clipboard
map("n", "<leader>op", "<cmd>Obsidian paste_img<CR>", { desc = "Paste image" })
