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

  ui = { enable = false }, -- render-markdown.nvim handles rendering
}
