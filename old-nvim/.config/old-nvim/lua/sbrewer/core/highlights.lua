local heading_1 = "#6060FF"
local heading_2 = "#007eff"
local heading_3 = "#33DD2D"
local heading_4 = "#fdda0d"
local heading_5 = "#ff7800"
local heading_6 = "#d22b2b"

vim.cmd(
  string.format([[highlight @markup.heading.1.markdown cterm=bold ctermbg=none gui=bold guifg=%s guibg=none]], heading_1)
)
