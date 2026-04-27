local builtin = require "telescope.builtin"
local actions = require "telescope.actions"

-- State for toggling test files
local show_test_files = false

local test_ignore_patterns = {
  "%.test%.",
  "%.spec%.",
  "__tests__/",
  "%.test%.ts$",
  "%.test%.js$",
  "%.test%.tsx$",
  "%.test%.jsx$",
  "%.spec%.ts$",
  "%.spec%.js$",
  "%.html$",
  "assets/",
}

local function get_ignore_patterns()
  local patterns = { "node_modules", ".git" }
  if not show_test_files then
    for _, p in ipairs(test_ignore_patterns) do
      table.insert(patterns, p)
    end
  end
  return patterns
end

local function find_files_filtered()
  builtin.find_files { file_ignore_patterns = get_ignore_patterns() }
end

local function grep_string_filtered()
  builtin.grep_string { file_ignore_patterns = get_ignore_patterns() }
end

local function live_grep_filtered()
  builtin.live_grep { file_ignore_patterns = get_ignore_patterns() }
end

local function toggle_test_files()
  show_test_files = not show_test_files
  local status = show_test_files and "shown" or "hidden"
  vim.notify("Test files are now " .. status, vim.log.levels.INFO)
end

-- Keymaps: <leader>f = "find"
local map = vim.keymap.set
map("n", "<leader>ff", find_files_filtered, { desc = "Find files" })
map("n", "<leader>fg", live_grep_filtered, { desc = "Find by grep" })
map("n", "<leader>fw", grep_string_filtered, { desc = "Find word (under cursor)" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
map("n", "<leader>fT", toggle_test_files, { desc = "Find toggle tests" })
map("n", "<leader>fr", builtin.resume, { desc = "Find resume (last picker)" })
map("n", "<leader>f.", builtin.oldfiles, { desc = "Find recent files" })
map("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find in buffer" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
map("n", "<leader>fM", builtin.marks, { desc = "Find marks" })
map("n", "<leader>fn", "<cmd>Noice telescope<CR>", { desc = "Find notifications" })

-- Setup
require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    sorting_strategy = "descending",
    layout_config = {
      horizontal = { prompt_position = "bottom", preview_width = 0.55 },
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-t>"] = function()
          toggle_test_files()
        end,
      },
    },
    path_display = { "smart" },
  },
  pickers = {
    find_files = { hidden = true },
    buffers = {
      sort_mru = true,
      mappings = { i = { ["<C-x>"] = actions.delete_buffer } },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "ui-select"
