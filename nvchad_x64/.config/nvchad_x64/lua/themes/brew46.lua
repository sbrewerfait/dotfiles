-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
---@type Base46Table
local M = {}
-- UI
M.base_30 = {
    white = "#ffffff",
    black = "#000000", -- usually your theme bg
    darker_black = "#000000", -- 6% darker than black
    black2 = "", -- 6% lighter than black
    one_bg = "", -- 10% lighter than black
    one_bg2 = "", -- 6% lighter than one_bg2
    one_bg3 = "", -- 6% lighter than one_bg3
    grey = "", -- 40% lighter than black (the % here depends so choose the perfect grey!)
    grey_fg = "", -- 10% lighter than grey
    grey_fg2 = "", -- 5% lighter than grey
    light_grey = "",
    red = "",
    baby_pink = "",
    pink = "",
    line = "", -- 15% lighter than black
    green = "",
    vibrant_green = "",
    nord_blue = "",
    blue = "",
    seablue = "",
    yellow = "", -- 8% lighter than yellow
    sun = "",
    purple = "",
    dark_purple = "",
    teal = "",
    orange = "",
    cyan = "",
    statusline_bg = "",
    lightbg = "",
    pmenu_bg = "",
    folder_bg = "",
}

-- check https://github.com/chriskempson/base16/blob/master/styling.md for more info
M.base_16 = {
    base00 = "",
    base01 = "",
    base02 = "",
    base03 = "",
    base04 = "",
    base05 = "",
    base06 = "",
    base07 = "",
    base08 = "",
    base09 = "",
    base0A = "",
    base0B = "",
    base0C = "",
    base0D = "",
    base0E = "",
    base0F = "",
}

-- OPTIONAL
-- overriding or adding highlights for this specific theme only
-- defaults/treesitter is the filename i.e integration there,

-- M.polish_hl = {
--     defaults = {
--         Comment = {
--             bg = "#ffffff", -- or M.base_30.cyan
--             italic = true,
--         },
--     },
--
--     treesitter = {
--         ["@variable"] = { fg = "#000000" },
--     },
-- }

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "abc")

return M
