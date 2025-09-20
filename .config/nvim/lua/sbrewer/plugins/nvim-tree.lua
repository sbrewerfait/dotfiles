return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    enabled = true,
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            on_attach = function(bufnr)
                local api = require('nvim-tree.api')

                local function opts(desc)
                    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set('n', 'A', function()
                    local node = api.tree.get_node_under_cursor()
                    local path = node.type == "directory" and node.absolute_path or vim.fs.dirname(node.absolute_path)
                    require("easy-dotnet").create_new_item(path)
                end, opts('Create file from dotnet template'))
            end,
            view = {
                width = 35,
                relativenumber = false,
                side = "left",
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            hijack_directories = {
                enable = false,
                auto_open = false,
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                    quit_on_open = true,
                },
            },
            filters = {
                custom = { ".DS_Store", "^\\._" },
            },
            git = {
                ignore = false,
            },
        })
    end,
}
