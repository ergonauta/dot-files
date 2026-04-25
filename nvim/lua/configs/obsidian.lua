require("obsidian").setup {
  legacy_commands = false,

  workspaces = {
    {
      name = "Second Brain",
      path = "/Users/gio/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain",
    },
  },

  daily_notes = {
    folder = "dailies",
    date_format = "YYYY-MM-DD",
    alias_format = "MMMM D, YYYY",
    template = nil,
  },

  completion = {
    nvim_cmp = true,
    min_chars = 1,
  },

  templates = {
    folder = "templates",
    date_format = "YYYY-MM-DD",
    time_format = "HH:mm",
    substitutions = {},
  },

  note_id_func = function(title)
    local suffix = ""
    if title ~= nil then
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      suffix = tostring(os.time())
    end
    return suffix
  end,

  frontmatter = {
    enabled = true,
    func = function(note)
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },

  picker = {
    name = "telescope.nvim",
    note_mappings = {
      new = "<C-x>",
      insert_link = "<C-l>",
    },
  },

  link = {
    style = "wiki",
  },

  attachments = {
    folder = "assets/imgs",
    img_name_func = function()
      return string.format("%s-", os.time())
    end,
  },

  checkbox = {
    order = { " ", "x", ">", "~", "!", "-" },
  },

  ui = {
    enable = true,
    update_debounce = 200,
    max_file_length = 5000,
    checkboxes = {
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "", hl_group = "ObsidianDone" },
      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      ["!"] = { char = "", hl_group = "ObsidianImportant" },
      ["-"] = { char = "–", hl_group = "ObsidianCancelled" },
    },
    bullets = { char = "•", hl_group = "ObsidianBullet" },
    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    reference_text = { hl_group = "ObsidianRefText" },
    highlight_text = { hl_group = "ObsidianHighlightText" },
    tags = { hl_group = "ObsidianTag" },
    block_ids = { hl_group = "ObsidianBlockID" },
    hl_groups = {
      ObsidianTodo = { bold = true, fg = "#f78c6c" },
      ObsidianDone = { bold = true, fg = "#89ddff" },
      ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
      ObsidianTilde = { bold = true, fg = "#ff5370" },
      ObsidianImportant = { bold = true, fg = "#d73128" },
      ObsidianCancelled = { bold = true, fg = "#808080" },
      ObsidianBullet = { bold = true, fg = "#89ddff" },
      ObsidianRefText = { underline = true, fg = "#c792ea" },
      ObsidianExtLinkIcon = { fg = "#c792ea" },
      ObsidianTag = { italic = true, fg = "#89ddff" },
      ObsidianBlockID = { italic = true, fg = "#89ddff" },
      ObsidianHighlightText = { bg = "#75662e" },
    },
  },
}
