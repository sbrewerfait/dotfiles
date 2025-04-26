return {
    {
        "GustavEikaas/easy-dotnet.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
            local dotnet = require("easy-dotnet")
            dotnet.setup({
                picker = "snacks",
                new = {
                    project = {
                        prefix = "none",
                    },
                },
            })
            vim.keymap.set("n", "<leader>dnf", "<cmd>Dotnet createFile<cr>", { desc = "Create Dotnet File" })
        end,
    },
}

