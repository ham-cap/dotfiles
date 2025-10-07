return {
  'romgrk/barbar.nvim',
  config = function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
    map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)
  end,
}
