return {
  -- { "tinted-theming/tinted-vim" },
  {
    "catppuccin",
    enabled = false,
  },
  {
    "tokyonight",
    enabled = false,
  },
  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   config = function()
  --     require("solarized-osaka").setup({
  --       transparent = true,
  --       styles = {
  --         sidebars = "transparent",
  --         floats = "transparent",
  --       },
  --     })
  --   end,
  -- },
  {
    "tiagovla/tokyodark.nvim",
    config = function()
      require("tokyodark").setup({
        transparent_background = true,
        custom_highlights = {
          LspVariable = { fg = "#7F00FF" },
        },
        -- custom_palette = {
        --   fg = "#7F00FF",
        -- },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "base16-darkviolet",
      colorscheme = "tokyodark",
    },
  },
}
