local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

require("sbrewer.core.options")
require("sbrewer.core.keymaps")
require("sbrewer.core.autocmds")
require("sbrewer.lazy")

vim.cmd('colorscheme onedark_vivid')

require("sbrewer.core.lsp")
require("sbrewer.core.highlights")
-- require("oil").setup()
