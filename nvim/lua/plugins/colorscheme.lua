return {
  -- { "tinted-theming/tinted-vim" },
  -- {
  --     "catppuccin",
  --     enabled = false,
  -- },
  -- {
  --     "tokyonight",
  --     enabled = false,
  -- },
  {
    "iagorrr/noctishc.nvim",
    lazy = false,
    priority = 1000,
  },
  -- {
  --   "notken12/bash46-colors",
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "base16-darkviolet",
      colorscheme = "noctishc",
    },
  },
}
