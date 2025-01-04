local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "c",
                "c_sharp",
                "cpp",
                "go",
                "java",
                "javascript",
                "json",
                "lua",
                "python",
                "rust",
                "typescript",
                "yaml",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        }
    end,
}

return M
