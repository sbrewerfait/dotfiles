return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("noice").setup {
            notify = {
                enabled = false,
            },
            lsp = {
                progress = {
                    enabled = false,
                },
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for searchers
                command_palette = true, -- position the cmdline and popupmenu together
            },
        }
    end,
}
