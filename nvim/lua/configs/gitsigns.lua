local gitsigns = require "gitsigns"

gitsigns.setup {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "▁" },
    topdelete = { text = "▔" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  signs_staged_enable = true,
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Hunk navigation
    map("n", "]h", function()
      if vim.wo.diff then
        vim.cmd.normal { "]c", bang = true }
      else
        gitsigns.nav_hunk("next", { wrap = true })
      end
    end, { desc = "Next hunk" })
    map("n", "[h", function()
      if vim.wo.diff then
        vim.cmd.normal { "[c", bang = true }
      else
        gitsigns.nav_hunk("prev", { wrap = true })
      end
    end, { desc = "Prev hunk" })

    -- Hunk text objects
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "inner hunk" })
    map({ "o", "x" }, "ah", ":<C-U>Gitsigns select_hunk<CR>", { desc = "around hunk" })

    -- git hunk (gh)
    map({ "n", "v" }, "<leader>gha", ":Gitsigns stage_hunk<CR>", { desc = "Hunk add (stage)" })
    map({ "n", "v" }, "<leader>ghx", ":Gitsigns reset_hunk<CR>", { desc = "Hunk discard (reset)" })
    map("n", "<leader>ghu", gitsigns.undo_stage_hunk, { desc = "Hunk undo stage" })
    map("n", "<leader>ghv", gitsigns.preview_hunk, { desc = "Hunk view (float)" })
    map("n", "<leader>ghV", gitsigns.preview_hunk_inline, { desc = "Hunk view inline" })

    -- git buffer (gb)
    map("n", "<leader>gba", gitsigns.stage_buffer, { desc = "Buffer add (stage all)" })
    map("n", "<leader>gbx", gitsigns.reset_buffer, { desc = "Buffer discard (reset all)" })

    -- git toggle (gt)
    map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "Toggle deleted hunks" })
    map("n", "<leader>gwt", gitsigns.toggle_current_line_blame, { desc = "Who toggle (line blame)" })

    -- git who / blame (gw)
    map("n", "<leader>gwl", function()
      gitsigns.blame_line { full = true }
    end, { desc = "Who line (blame)" })

    -- git diff (gd)
    map("n", "<leader>gdi", gitsigns.diffthis, { desc = "Diff index" })
    map("n", "<leader>gdh", function()
      gitsigns.diffthis "HEAD"
    end, { desc = "Diff HEAD" })
    map("n", "<leader>gdp", function()
      gitsigns.diffthis "~1"
    end, { desc = "Diff previous (HEAD~1)" })
  end,
}
