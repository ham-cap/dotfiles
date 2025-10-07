return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    -- Telescope の基本設定
    telescope.setup{
      defaults = {
        hidden = true,        -- ドットファイルを含める
        no_ignore = true,     -- .gitignore 無視設定も無効化
        file_ignore_patterns = {}, -- 特定パターンの除外を無効化
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',         -- live_grep でも隠しファイルを検索対象に
          '--glob', '!.git/*' -- .git フォルダだけ除外
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,   -- .gitignore の無視を外す
        },
      },
    }

    -- キーマッピングの設定
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
