local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup {
            ensure_installed = {
                "markdown",
                "markdown_inline",
                "lua",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
}

return M
