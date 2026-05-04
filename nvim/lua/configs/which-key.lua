require("which-key").setup {
  preset = "helix",
  delay = 400,
  win = { border = "rounded" },
  icons = { mappings = true },
  spec = {
    -- Claude
    { "<leader>c", group = "Claude", icon = { icon = "󱙺 ", color = "orange" } },

    -- Find
    { "<leader>f", group = "Find", icon = { icon = " ", color = "blue" } },

    -- LSP
    { "<leader>l", group = "LSP", icon = { icon = "󰀨 ", color = "green" } },
    { "<leader>li", group = "Imports" },
    { "<leader>lt", group = "Toggle" },

    -- Test / Trouble
    { "<leader>t", group = "Test", icon = { icon = "󰙨 ", color = "green" } },
    { "<leader>tr", group = "Trouble", icon = { icon = " ", color = "red" } },

    -- Git
    { "<leader>g", group = "Git", icon = { icon = " ", color = "orange" } },
    { "<leader>go", group = "Open" },
    { "<leader>gh", group = "Hunks" },
    { "<leader>gi", group = "Issues", icon = { icon = " ", color = "purple" } },
    { "<leader>gw", group = "Worktrees" },

    -- Diff / Database
    { "<leader>d", group = "Diff / DB" },
    { "<leader>dv", group = "DiffView", icon = { icon = " ", color = "cyan" } },
    { "<leader>db", group = "Database", icon = { icon = "󰆼 ", color = "cyan" } },

    -- Pull Requests
    { "<leader>pr", group = "Pull Requests", icon = { icon = " ", color = "purple" } },
    { "<leader>pra", group = "Assignee" },
    { "<leader>pre", group = "Reviewer" },
    { "<leader>prl", group = "Labels" },
    { "<leader>prv", group = "Review" },

    -- Notify
    { "<leader>n", group = "Notify", icon = { icon = "󰂚 ", color = "yellow" } },

    -- Obsidian
    { "<leader>o", group = "Obsidian", icon = { icon = "󱓧 ", color = "purple" } },
    { "<leader>ot", group = "Template/Tags" },

    -- HTTP
    { "<leader>R", group = "HTTP", icon = { icon = "󰖟 ", color = "blue" } },

    -- Folds
    { "<leader>z", group = "Folds", icon = { icon = "󰁕 ", color = "grey" } },
  },
}
