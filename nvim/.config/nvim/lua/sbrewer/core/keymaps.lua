vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>rk", ":so ~/.config/nvim/lua/sbrewer/core/keymaps.lua<cr>", { desc = "Reload keymaps" })
keymap.set("n", "<leader>ro", ":so ~/.config/nvim/lua/sbrewer/core/options.lua<cr>", { desc = "Reload options" })
keymap.set("n", "<leader>rh", ":so ~/.config/nvim/lua/sbrewer/core/highlights.lua<cr>", { desc = "Reload highlights" })

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

-- Buffers
keymap.set("n", "H", "<cmd>BufferPrevious<cr>", { desc = "Move to left tab" })
keymap.set("n", "L", "<cmd>BufferNext<cr>", { desc = "Move to right tab" })
keymap.set("n", "<leader>bc", "<cmd>BufferClose<cr>", { desc = "Move to right tab" })

-- Fuzzy Find
keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })

-- File Explorer
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Explorer" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse Explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh Explorer" })

-- Create task - REPLACED WITH SNIPPET
-- keymap.set({ "n", "i" }, "<leader>at", function()
--   -- Get the current line/row/column
--   local cursor_pos = vim.api.nvim_win_get_cursor(0)
--   local row, _ = cursor_pos[1], cursor_pos[2]
--   local line = vim.api.nvim_get_current_line()
--   -- 1) If line is empty => replace it with "- [ ] " and set cursor after the brackets
--   if line:match("^%s*$") then
--     local final_line = "- [ ] "
--     vim.api.nvim_set_current_line(final_line)
--     -- "- [ ] " is 6 characters, so cursor col = 6 places you *after* that space
--     vim.api.nvim_win_set_cursor(0, { row, 6 })
--     return
--   end
--   -- 2) Check if line already has a bullet with possible indentation: e.g. "  - Something"
--   --    We'll capture "  -" (including trailing spaces) as `bullet` plus the rest as `text`.
--   local bullet, text = line:match("^([%s]*[-*]%s+)(.*)$")
--   if bullet then
--     -- Convert bullet => bullet .. "[ ] " .. text
--     local final_line = bullet .. "[ ] " .. text
--     vim.api.nvim_set_current_line(final_line)
--     -- Place the cursor right after "[ ] "
--     -- bullet length + "[ ] " is bullet_len + 4 characters,
--     -- but bullet has trailing spaces, so #bullet includes those.
--     local bullet_len = #bullet
--     -- We want to land after the brackets (four characters: `[ ] `),
--     -- so col = bullet_len + 4 (0-based).
--     vim.api.nvim_win_set_cursor(0, { row, bullet_len + 4 })
--     return
--   end
--   -- 3) If there's text, but no bullet => prepend "- [ ] "
--   --    and place cursor after the brackets
--   local final_line = "- [ ] " .. line
--   vim.api.nvim_set_current_line(final_line)
--   -- "- [ ] " is 6 characters
--   vim.api.nvim_win_set_cursor(0, { row, 6 })
-- end, { desc = "Convert bullet to a task or insert new task bullet" })
