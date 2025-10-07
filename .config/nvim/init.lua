-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'double'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1
vim.o.virtualedit = 'onemore'

-- everforest(カラースキーム)の設定
vim.o.background = 'dark'
vim.g.everforest_background = 'soft'

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- manipulation
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard:append{'unnamedplus'}
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

local opts = { noremap = true, silent = true }
-- ノーマル、ビジュアル、ビジュアルブロックモードに適用
vim.api.nvim_set_keymap('n', 'j', 'gj', opts)
vim.api.nvim_set_keymap('n', 'k', 'gk', opts)
vim.api.nvim_set_keymap('v', 'j', 'gj', opts)
vim.api.nvim_set_keymap('v', 'k', 'gk', opts)
vim.api.nvim_set_keymap('x', 'j', 'gj', opts)
vim.api.nvim_set_keymap('x', 'k', 'gk', opts)
vim.api.nvim_set_keymap('n', '<Down>', 'gj', opts)
vim.api.nvim_set_keymap('n', '<Up>', 'gk', opts)
vim.api.nvim_set_keymap('v', '<Down>', 'gj', opts)
vim.api.nvim_set_keymap('v', '<Up>', 'gk', opts)
vim.api.nvim_set_keymap('x', '<Down>', 'gj', opts)
vim.api.nvim_set_keymap('x', '<Up>', 'gk', opts)
vim.api.nvim_set_keymap('n', '<S-h>', '0', opts)
vim.api.nvim_set_keymap('n', '<S-l>', '$', opts)
vim.api.nvim_set_keymap('v', '<S-h>', '0', opts)
vim.api.nvim_set_keymap('v', '<S-l>', '$', opts)
vim.api.nvim_set_keymap('x', '<S-h>', '0', opts)
vim.api.nvim_set_keymap('x', '<S-l>', '$', opts)

vim.api.nvim_set_keymap('n', '?', '<Plug>ReplaceWithRegisterOperator', opts)

vim.api.nvim_set_keymap('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', { expr = true, noremap = true })

vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>', opts)

-- 定義ジャンプ
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.fn.CocAction("jumpDefinition", false)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.fn.CocAction("jumpReferences", false)<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.html.erb",
  command = "set filetype=html"
})

require("config.lazy")

vim.cmd('colorscheme everforest')

if vim.g.vscode then
  local vscode = require('vscode-neovim')
  local mappings = {
    up = 'k',
    down = 'j',
    wrappedLineStart = '0',
    wrappedLineFirstNonWhitespaceCharacter = '^',
    wrappedLineEnd = '$',
  }

  local function moveCursor(to, select)
    return function()
      local mode = vim.api.nvim_get_mode()
      if mode.mode == 'V' or mode.mode == '' then
        return mappings[to]
      end

      vscode.action('cursorMove', {
        args = {
          {
            to = to,
            by = 'wrappedLine',
            value = vim.v.count1,
            select = select
          },
        },
      })
      return '<Ignore>'
    end
  end

  vim.keymap.set('n', 'k', moveCursor('up'), { expr = true })
  vim.keymap.set('n', 'j', moveCursor('down'), { expr = true })

  vim.keymap.set('v', 'k', moveCursor('up', true), { expr = true })
  vim.keymap.set('v', 'j', moveCursor('down', true), { expr = true })
end

vim.notify('initialization complated')

-- Copilot (coc-github-copilot) inline completion accept on <C-l>
vim.keymap.set("i", "<C-l>", function()
  if vim.fn["coc#inline#visible"]() == 1 then
    return vim.fn["coc#inline#accept"]()
  end
  return "<C-l>"
end, { expr = true, silent = true, noremap = true })
vim.keymap.set("t", "<C-t>", [[<C-\><C-n>]], { silent = true })

