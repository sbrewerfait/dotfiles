return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "prettier",
                "csharp_ls",
            }
        }
    },
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false,
        opts = {
            enabled = true,
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            return require "configs.nvim-tree"
        end
    },
    {
        "GustavEikaas/easy-dotnet.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = "Dotnet",
        config = function()
            require("easy-dotnet").setup()
        end
    },
    {
        "echasnovski/mini.nvim",
        lazy = false,
        version = false,
        enabled = true,
        config = function()
            require "configs.mini"
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        enabled = true,
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require "configs.noice"
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = require "configs.render-markdown"
    },
    {
        "bullets-vim/bullets.vim",
        lazy = false,
        config = function()
            vim.g.bullets_delete_last_bullet_if_empty = 1
        end,

    },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "lua", "markdown",
                "markdown_inline", "bash",
                "c_sharp"
            },
        },
    },
}
