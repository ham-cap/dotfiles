return {
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,
            ts_config = {
                ruby = {'function', 'method', 'table'},  -- Rubyに対する補完設定
            }
        })
    end
}

