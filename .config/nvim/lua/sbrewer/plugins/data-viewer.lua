return {
    'vidocqh/data-viewer.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('data-viewer').setup({
            -- maxLineEachTable = 45,
            view = {
                float = false,
            },
            keymap = {
                next_table = '<leader>dl',
                prev_table = '<leader>dh',
            }
        })
    end,
}
