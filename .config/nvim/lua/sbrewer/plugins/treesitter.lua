local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup {
            ensure_installed = {
                "lua",
                "markdown",
                "markdown_inline",
                "bash",
            },
            auto_install = true,
            highlight = { enable = false },
            indent = { enable = true },
        }
    end,
}

return M
