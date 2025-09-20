return {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        require("fzf-lua").setup({
            winopts = {
                height = 0.8,
                width = 0.8,
                border = "rounded",
            },
        })
    end,
}
