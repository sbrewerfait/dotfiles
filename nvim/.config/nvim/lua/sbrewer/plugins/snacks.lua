return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                header = [[
██████╗ ██████╗ ███████╗██╗    ██╗██╗   ██╗██╗███╗   ███╗
██╔══██╗██╔══██╗██╔════╝██║    ██║██║   ██║██║████╗ ████║
██████╔╝██████╔╝█████╗  ██║ █╗ ██║██║   ██║██║██╔████╔██║
██╔══██╗██╔══██╗██╔══╝  ██║███╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝██║  ██║███████╗╚███╔███╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                         
]],
            },
            sections = {
                {
                    { section = "header", padding = 1 },
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "recent_files", gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
        },
        explorer = {
            enabled = true,
            layout = {
                cycle = false,
            },
            replace_netrw = true,
        },
        indent = { enabled = true },
        input = { enabled = false },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        -- words = { enabled = true },
        zen = { enabled = true },
        lazygit = { enabled = true },
        win = { enabled = true },
    },
    keys = {
        { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
        { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zen Zoom" },
        { "<C-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "<leader>fr", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
        { "<leader>n", function()
            if Snacks.config.picker and Snacks.config.picker.enabled then
                Snacks.picker.notifications()
            else
                Snacks.notifier.show_history()
              end
            end, desc = "Notification History" },
        { "<leader>ee", function() Snacks.explorer() end, desc = "Toggle Explorer" },
    },
}
