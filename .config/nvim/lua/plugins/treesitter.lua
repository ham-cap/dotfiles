return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      -- 言語ごとのインストール
      ensure_installed = { "ruby", "javascript", "html" },  -- RubyとJavaScriptとHTMLを指定
      highlight = {
        enable = true,               -- ハイライトを有効にする
        additional_vim_regex_highlighting = false,  -- デフォルトはfalseで良いです
      },
      endwise = {
        enable = true,
      },
    }
  end
}
