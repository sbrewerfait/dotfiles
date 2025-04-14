vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    }
})

vim.cmd("let g:newrw_liststyle = 3")

-- vim.notify = require('mini.notify').make_notify()

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.smartindent = true

opt.wrap = false

opt.cursorline = false

opt.incsearch = true

opt.termguicolors = true
-- opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 8
-- opt.colorcolumn = "150"

opt.updatetime = 50

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
