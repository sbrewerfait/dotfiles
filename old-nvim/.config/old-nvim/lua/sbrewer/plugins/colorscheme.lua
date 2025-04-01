return {
    "RRethy/base16-nvim",
    -- "iagorrr/noctishc.nvim",
    -- "tinted-theming/tinted-vim",
    -- "Tsuzat/NeoSolarized.nvim",
    -- "liminalminds/icecream.nvim",
	-- "nonetallt/vim-neon-dark",
    -- "stankovictab/mgz.nvim",
    -- "paulo-granthon/hyper.nvim",
	-- "BoilingSoup/fruitypebbles.nvim",
    lazy = false,
	priority = 1000,
    config = function()
        vim.cmd("colorscheme base16-isotope")
    --     require('noctishc').setup({
    --         transparent = true,
    --     })
    --     -- require('fruitypebbles').setup({
    --     --     colors = {
    --     --         purple = "#6060ff",
    --     --     },
    --     --     highlights = {
    --     --         ["@string"] = {fg = '$purple'},
    --     --     },
    --     --     transparent = true,
    --     -- })
    --     -- require('fruitypebbles').load()
    end,
        -- vim.cmd("colorscheme noctishc")
        -- vim.cmd("colorscheme base16-pinky")
        -- vim.cmd("colorscheme fruitypebbles")
        -- vim.cmd("colorscheme neosolarized")
        -- vim.cmd("colorscheme icecream")
        -- vim.cmd("colorscheme mgz")
		-- vim.cmd("colorscheme hyper")
		-- require('neon-dark').load()
}
