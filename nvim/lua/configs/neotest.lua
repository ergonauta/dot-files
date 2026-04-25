require("neotest").setup {
  adapters = {
    require "neotest-vitest",
  },
  discovery = {
    filter_dir = function(name)
      return name ~= "node_modules" and name ~= ".git" and name ~= "dist" and name ~= "build" and name ~= "coverage"
    end,
  },
  status = {
    virtual_text = true,
    signs = true,
  },
  floating = {
    border = "rounded",
  },
  quickfix = {
    open = true,
  },
}
