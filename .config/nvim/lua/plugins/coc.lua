return {
  'neoclide/coc.nvim',
  config = function()
    -- <leader>gdで定義にジャンプ
    vim.api.nvim_set_keymap('n', '<leader>gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
    
    -- <leader>grで参照元にジャンプ
    vim.api.nvim_set_keymap('n', '<leader>gr', '<Plug>(coc-references)', { noremap = true, silent = true })
    
    -- Shift + Tabで前の候補に移動
    vim.api.nvim_set_keymap(
      'i',
      '<S-Tab>',
      [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
      { noremap = true, expr = true, silent = true }
    )
  end
}
