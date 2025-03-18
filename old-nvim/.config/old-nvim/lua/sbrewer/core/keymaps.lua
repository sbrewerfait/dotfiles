vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make window splits equal in size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>rt", ":retab<CR>i<ESC>", { desc = "Retab" })

-- Navigate vim panes better
keymap.set('n', '<c-k>', ':wincmd k<CR>')
keymap.set('n', '<c-j>', ':wincmd j<CR>')
keymap.set('n', '<c-h>', ':wincmd h<CR>')
keymap.set('n', '<c-l>', ':wincmd l<CR>')

keymap.set("n", "<leader>qa", ":q<CR>", { desc = "Quit" })

keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Move to left tab" })
keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Move to right tab" })
