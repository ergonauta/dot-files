return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require "configs.snacks"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      return require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-lua/plenary.nvim",
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPost",
    config = function()
      require "configs.treesitter-context"
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
    },
    keys = {
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run file tests",
      },
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.run { suite = true }
        end,
        desc = "Run test suite",
      },
      {
        "<leader>tx",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop test run",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.attach()
        end,
        desc = "Attach to test",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand "%")
        end,
        desc = "Toggle test watch",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle test summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open { enter = true }
        end,
        desc = "Open test output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle test output panel",
      },
      {
        "]t",
        function()
          require("neotest").jump.next()
        end,
        desc = "Next test",
      },
      {
        "[t",
        function()
          require("neotest").jump.prev()
        end,
        desc = "Previous test",
      },
      {
        "]T",
        function()
          require("neotest").jump.next { status = "failed" }
        end,
        desc = "Next failed test",
      },
      {
        "[T",
        function()
          require("neotest").jump.prev { status = "failed" }
        end,
        desc = "Previous failed test",
      },
    },
    config = function()
      require "configs.neotest"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<M-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<M-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<M-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<M-l>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },

  {
    "xiyaowong/transparent.nvim",
    event = "UIEnter",
    config = function()
      require "configs.transparent"
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>trd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble Diagnostics" },
      { "<leader>trb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble Buffer diagnostics" },
      { "<leader>trq", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble Quickfix" },
      { "<leader>trl", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble Loclist" },
      { "<leader>trs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Trouble Symbols" },
      { "<leader>trr", "<cmd>Trouble lsp_references toggle<cr>", desc = "Trouble References" },
    },
    config = function()
      require "configs.trouble"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "configs.noice"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
      require "configs.gitsigns"
    end,
  },

  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "configs.octo"
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewRefresh", "DiffviewFileHistory" },
    keys = {
      { "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>dvr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh Diffview" },
      { "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", desc = "File history in Diffview" },
      { "<leader>dvf", "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
      { "<leader>dvm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Diff vs main" },
      {
        "<leader>dvb",
        ":DiffviewOpen origin/...HEAD<Left><Left><Left><Left><Left><Left>",
        desc = "Diff vs branch (prompt)",
      },
      { "<leader>dv2", "<cmd>DiffviewOpen HEAD~2<cr>", desc = "Diff 2 commits back" },
      {
        "<leader>dvp",
        ":DiffviewOpen origin/main...HEAD -- <C-r>=expand('%:.')<CR>",
        desc = "Diff current file vs main",
      },
      { "<leader>dvs", "<cmd>DiffviewOpen --staged<cr>", desc = "Diff staged changes" },
    },
    config = function()
      require "configs.diffview"
    end,
  },

  {
    "tpope/vim-dadbod",
    cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    config = function()
      require "configs.dadbod"
    end,
  },

  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = { "tpope/vim-dadbod" },
    ft = { "sql", "mysql", "plsql", "postgresql" },
  },

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    cmd = { "Obsidian" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.obsidian"
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.neoscroll"
    end,
  },

  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Request send" },
      { "<leader>Ra", desc = "Request send all" },
      { "<leader>Rb", desc = "Request scratchpad" },
      { "<leader>Rr", desc = "Request replay last" },
      { "<leader>Re", desc = "Request select env" },
      { "<leader>Ri", desc = "Request inspect" },
      { "<leader>Ro", desc = "Request open kulala" },
      { "<leader>Rf", desc = "Request find" },
      { "<leader>Rc", desc = "Request copy as cURL" },
      { "<leader>RC", desc = "Request paste from cURL" },
      { "<leader>Rt", desc = "Request toggle headers/body" },
    },
    ft = { "http", "rest" },
    config = function()
      require "configs.kulala"
    end,
  },

  {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>gws", desc = "Git Worktree switch" },
      { "<leader>gwn", desc = "Git Worktree new" },
    },
    config = function()
      require "configs.git-worktree"
    end,
  },

  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      require "configs.claudecode"
    end,
    keys = {
      { "<leader>c", nil, desc = "Claude" },
      { "<leader>cc", "<cmd>ClaudeCodeFocus<cr>", mode = { "n", "t" }, desc = "Claude Code (focus toggle)" },
      { "<leader>ch", "<cmd>ClaudeCodeClose<cr>", desc = "Claude Hide" },
      { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Claude Resume" },
      { "<leader>cn", "<cmd>ClaudeCode --continue<cr>", desc = "Claude coNtinue" },
      { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Claude Model" },
      { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude Buffer (add file)" },
      { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude Send selection" },
      {
        "<leader>cs",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Claude Send (tree file)",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Claude Accept diff" },
      { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Claude Deny diff" },
      { "<leader>ci", "<cmd>ClaudeCodeStatus<cr>", desc = "Claude Info (status)" },
    },
  },
}
