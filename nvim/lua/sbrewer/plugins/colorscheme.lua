return {
    "tinted-theming/tinted-vim",
    -- "Tsuzat/NeoSolarized.nvim",
    -- "liminalminds/icecream.nvim",
	-- "nonetallt/vim-neon-dark",
    -- "stankovictab/mgz.nvim",
    -- "paulo-granthon/hyper.nvim",
	-- "BoilingSoup/fruitypebbles.nvim",
	priority = 1000,
	config = function()
        vim.g.tinted_colorspace = 256
        -- vim.cmd("colorscheme base16-pinky")
        vim.cmd("colorscheme base16-darkviolet")
        -- vim.cmd("colorscheme neosolarized")
        -- vim.cmd("colorscheme icecream")
        -- vim.cmd("colorscheme mgz")
		-- vim.cmd("colorscheme hyper")
		-- require('fruitypebbles').load()
		-- require('neon-dark').load()
	end,
}
