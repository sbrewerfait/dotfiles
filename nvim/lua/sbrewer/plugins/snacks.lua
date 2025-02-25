return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
              keys = {
                { icon = " ", key = "e", desc = "Explore Directory", action = ":Neotree" },
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                {
                  icon = " ",
                  key = "c",
                  desc = "Config",
                  action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                },
                { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
              },
            },
            sections = {
              {
                section = "terminal",
                cmd = "chafa ~/Pictures/brew_cat.png --format symbols --size 50x50; sleep .1",
                height = 30,
              },
              {
                section = "terminal",
                cmd = "printf 'WoW! Much Arch! Very Wezterm! Goodest Neovim!'",
              },
              {
                pane = 2,
                icon = " ",
                title = "Shortcuts",
                section = "keys",
                indent = 2,
                gap = 1,
                padding = 1,
              },
              {
                pane = 2,
                icon = " ",
                title = "Recent Files",
                section = "recent_files",
                limit = 10,
                indent = 2,
              },
              { section = "startup" },
            },
            width = 50,
        },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
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
    },
}
