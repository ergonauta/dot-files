-- nvim-treesitter main branch moved queries from queries/ to runtime/queries/.
-- Neovim's rtp lookup expects queries/ at the plugin root, so add runtime/ explicitly.
local ts_plugin_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"
vim.opt.rtp:prepend(ts_plugin_dir .. "/runtime")

-- Enable treesitter highlighting for all buffers
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if vim.treesitter.get_parser(ev.buf, nil, { error = false }) then
      vim.treesitter.start(ev.buf)
    end
  end,
})
