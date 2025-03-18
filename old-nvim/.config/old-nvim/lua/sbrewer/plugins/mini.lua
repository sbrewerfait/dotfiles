local gen_loader = require("mini.snippets").gen_loader

return {
    require("mini.notify").setup(),
    require("mini.pairs").setup(),
    require("mini.icons").setup(),
    require("mini.move").setup(),
    require("mini.comment").setup(),
    require("mini.git").setup(),
    require("mini.diff").setup(),
    require("mini.statusline").setup(),

    require("mini.snippets").setup({
        snippets = {
            gen_loader.from_file("~/.config/old-nvim/snippets/global.json"),
        },
    })
}
