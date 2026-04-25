require("transparent").setup {
  extra_groups = {
    -- Floats (Lazy, Mason, LspInfo, etc.)
    "NormalFloat",
    "FloatBorder",

    -- NormalFloat/FloatBorder excluded so hover & float windows remain visible
    "FloatTitle",

    -- NvimTree
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeWinSeparator",
    "NvimTreeEndOfBuffer",

    -- Telescope
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "TelescopeResultsNormal",
    "TelescopeResultsBorder",
    "TelescopePreviewNormal",
    "TelescopePreviewBorder",

    -- Trouble
    "TroubleNormal",

    -- Noice / Notify
    "NoiceCmdlinePopup",
    "NotifyBackground",

    -- Treesitter-context
    "TreesitterContext",
    "TreesitterContextLineNumber",

    -- NvChad UI elements
    "TbLineBufOn",
    "TbLineBufOff",
    "TbLineBufOnClose",
    "TbLineBufOffClose",
    "TbLineTabNewBtn",
    "TbLineFill",
    "NvimTreeCursorLine",

    -- Misc
    "WinSeparator",
    "VertSplit",
    "Pmenu",
    "PmenuSbar",
  },

  -- Keep CursorLine visible so you can still see which line you're on
  exclude_groups = { "CursorLine" },
}
