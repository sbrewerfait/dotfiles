return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("transparent").setup {
            enable = true,
            extra_groups = { "Dashboard", "WhichKey", "NeoTree", "Trouble", "Outline", "BufferLine" },
            transparent_dir = "transparent",
            default_style = "dark",
        }
    end,
}
