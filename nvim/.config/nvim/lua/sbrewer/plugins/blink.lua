return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "echasnovski/mini.snippets",
    },
    version = "1.*",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        snippets = { preset = "mini_snippets" },
        keymap = { preset = "enter" },
        appearance = {
            nerd_font_variant = "mono"
        },
        completion = { documentation = { auto_show = false } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            -- providers = {
            --     ['easy-dotnet'] = {
            --         name = 'easy-dotnet',
            --         enable = true,
            --         module = 'easy-dotnet.completion.blink',
            --         score_offset = 10000,
            --         async = true,
            --     },
            -- },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
