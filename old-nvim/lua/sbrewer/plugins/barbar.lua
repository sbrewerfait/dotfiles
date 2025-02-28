local P = {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
}

function P.config()
    require('barbar').setup()

    local keymap = vim.keymap
    keymap.set("n", "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Close current tab" })
    keymap.set("n", "<leader>b,", "<cmd>BufferPrevious<CR>", { desc = "Move to left tab" })
    keymap.set("n", "<leader>b.", "<cmd>BufferNext<CR>", { desc = "Move to right tab" })
end

return P
