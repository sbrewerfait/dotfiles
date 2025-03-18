return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    },
    config = function()
        require("neo-tree").setup {
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            enable_modified_markers = true,
            sort_case_insensitive = true,
            window = {
                position = "float",
                width = 35,
            },
        }
    end,
}
