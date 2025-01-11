return {
    "Al0den/notion.nvim",
    lazy = false,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("notion").setup()
    end,
}
