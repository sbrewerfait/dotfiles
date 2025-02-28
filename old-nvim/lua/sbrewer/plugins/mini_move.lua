local P = {
    'echasnovski/mini.move',
    version = '*',
}

function P.config()
    require("mini.move").setup()
end

return P
