return {
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     require("tokyonight").setup({
        --         transparent = true,
        --         styles = {
        --             comments = { italic = true },
        --             keywords = { italic = false },
        --             functions = {},
        --             variables = {},
        --             -- Background styles. Can be "dark", "transparent" or "normal"
        --             sidebars = "transparent", -- style for sidebars, see below
        --             floats = "transparent", -- style for floating windows
        --         },
        --     })
        -- end,
    },
    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedarkpro").setup({
                options = {
                    transparency = true,
                }
            })
        end,
    }
}
-- return {
    -- "EdenEast/nightfox.nvim",
    -- priority = 1000,
    -- lazy = false,
    -- config = function()
    --     local carbonfox = require("nightfox.palette.carbonfox")
    --     require("nightfox").setup({
    --         transparent = true,
    --         palettes = {
    --             duskfox = {
    --                 bg0 = carbonfox.palette.bg0,
    --                 bg1 = carbonfox.palette.bg0,
    --                 bg2 = carbonfox.palette.bg2,
    --                 bg3 = carbonfox.palette.bg3,
    --                 bg4 = carbonfox.palette.bg4,
    --             },
    --         },
    --     })
    --     vim.cmd("colorscheme duskfox")
    -- end,
    -- "uloco/bluloco.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- dependencies = { 'rktjmp/lush.nvim' },
    -- config = function()
    --     require('bluloco').setup({
    --         transparent = true,
    --     })
    --     vim.cmd("colorscheme bluloco")
    -- -- your optional config goes here, see below.
    -- end,
-- }
-- return {
--     "RRethy/base16-nvim",
--     -- "iagorrr/noctishc.nvim",
--     -- "tinted-theming/tinted-vim",
--     -- "Tsuzat/NeoSolarized.nvim",
--     -- "liminalminds/icecream.nvim",
-- 	-- "nonetallt/vim-neon-dark",
--     -- "stankovictab/mgz.nvim",
--     -- "paulo-granthon/hyper.nvim",
-- 	-- "BoilingSoup/fruitypebbles.nvim",
--     lazy = false,
-- 	priority = 1000,
--     config = function()
--         vim.cmd("colorscheme base16-isotope")
--     --     require('noctishc').setup({
--     --         transparent = true,
--     --     })
--     --     -- require('fruitypebbles').setup({
--     --     --     colors = {
--     --     --         purple = "#6060ff",
--     --     --     },
--     --     --     highlights = {
--     --     --         ["@string"] = {fg = '$purple'},
--     --     --     },
--     --     --     transparent = true,
--     --     -- })
--     --     -- require('fruitypebbles').load()
--     end,
--         -- vim.cmd("colorscheme noctishc")
--         -- vim.cmd("colorscheme base16-pinky")
--         -- vim.cmd("colorscheme fruitypebbles")
--         -- vim.cmd("colorscheme neosolarized")
--         -- vim.cmd("colorscheme icecream")
--         -- vim.cmd("colorscheme mgz")
-- 		-- vim.cmd("colorscheme hyper")
-- 		-- require('neon-dark').load()
-- }
