return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('bufferline').setup({
            options = {
                always_show_bufferline = true,
                separator_style = 'thick',
                themeable = true,
                diagnostics = 'nvim_lsp',
                truncate_names = false,
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'Explorer',
                        highlight = 'Directory',
                        padding = 1,
                    },
                },
            },
            -- highlights = {
            --     tab_separator_selected = {
            --         fg = '#ff0000',
            --     }
            -- }
        })
    end,
}
