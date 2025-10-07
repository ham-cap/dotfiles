return {
  'echasnovski/mini.indentscope',
  config = function()
    require('mini.indentscope').setup({
      draw = {
        delay = 0,  -- 遅延を0に設定して即座に表示
        animation = require('mini.indentscope').gen_animation.none(),  -- アニメーションを無効化
        priority = 2,
      },
      mappings = {
        object_scope = 'ii',
        object_scope_with_border = 'ai',
        goto_top = '[i',
        goto_bottom = ']i',
      },
      options = {
        border = 'both',
        indent_at_cursor = true,
        try_as_border = false,
      },
      symbol = '|',  -- インデントを示す文字
    })
  end,
}
