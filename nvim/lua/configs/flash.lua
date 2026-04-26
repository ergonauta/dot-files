require("flash").setup {
  labels = "asdfghjklqwertyuiopzxcvbnm",
  search = {
    multi_window = true,
    forward = true,
    wrap = true,
  },
  jump = {
    jumplist = true,
    pos = "start",
    history = false,
    register = false,
    nohlsearch = true,
    autojump = false,
  },
  label = {
    uppercase = false,
    current = true,
    after = true,
    before = false,
    style = "overlay",
    reuse = "lowercase",
  },
  modes = {
    -- `s` — jump to any visible position
    char = {
      enabled = false, -- keep f/t/F/T native
    },
  },
}
