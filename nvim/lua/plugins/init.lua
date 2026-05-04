return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.which-key"
    end,
  },

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
      "nvim-neotest/neotest-python",
    },
    keys = {
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Test run file",
      },
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Test run nearest",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Test run last",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.run { suite = true }
        end,
        desc = "Test run suite",
      },
      {
        "<leader>tx",
        function()
          require("neotest").run.stop()
        end,
        desc = "Test stop",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.attach()
        end,
        desc = "Test attach",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand "%")
        end,
        desc = "Test watch toggle",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Test summary toggle",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open { enter = true }
        end,
        desc = "Test output open",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Test output panel toggle",
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
      { "<M-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Tmux navigate left" },
      { "<M-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux navigate down" },
      { "<M-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux navigate up" },
      { "<M-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux navigate right" },
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
      { "<leader>trd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble diagnostics" },
      { "<leader>trb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble buffer diagnostics" },
      { "<leader>trq", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble quickfix" },
      { "<leader>trl", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble loclist" },
      { "<leader>trs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Trouble symbols" },
      { "<leader>trr", "<cmd>Trouble lsp_references toggle<cr>", desc = "Trouble references" },
    },
    config = function()
      require "configs.trouble"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
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
      { "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
      { "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
      { "<leader>dvr", "<cmd>DiffviewRefresh<cr>", desc = "Diffview refresh" },
      { "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview file history" },
      { "<leader>dvf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview current file history" },
      { "<leader>dvm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Diffview diff vs main" },
      {
        "<leader>dvb",
        ":DiffviewOpen origin/...HEAD<Left><Left><Left><Left><Left><Left>",
        desc = "Diffview diff vs branch",
      },
      { "<leader>dv2", "<cmd>DiffviewOpen HEAD~2<cr>", desc = "Diffview diff 2 commits back" },
      {
        "<leader>dvp",
        ":DiffviewOpen origin/main...HEAD -- <C-r>=expand('%:.')<CR>",
        desc = "Diffview diff current file vs main",
      },
      { "<leader>dvs", "<cmd>DiffviewOpen --staged<cr>", desc = "Diffview diff staged" },
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
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.render-markdown"
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
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require "configs.typescript-tools"
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.flash"
    end,
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash jump",
      },
      {
        "S",
        mode = { "n" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Flash remote",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash treesitter search",
      },
    },
  },

  {
    "dnlhc/glance.nvim",
    cmd = "Glance",
    config = function()
      require "configs.glance"
    end,
  },

  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      require "configs.mini-ai"
    end,
  },

  {
    "stevearc/aerial.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    cmd = { "AerialToggle", "AerialOpen" },
    keys = {
      { "<leader>lo", "<cmd>AerialToggle<cr>", desc = "LSP outline toggle" },
      { "<leader>fs", "<cmd>Telescope aerial<cr>", desc = "Find symbols (aerial)" },
    },
    config = function()
      require "configs.aerial"
    end,
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require "configs.auto-session"
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
      { "<leader>cc", "<cmd>ClaudeCodeFocus<cr>", mode = { "n", "t" }, desc = "Claude focus toggle" },
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
