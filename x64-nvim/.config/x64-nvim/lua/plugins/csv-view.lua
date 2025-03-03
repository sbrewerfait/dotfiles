return {
  "hat0uma/csvview.nvim",
  lazy = true,
  ft = { "csv", "tsv" },
  config = function()
    require("csvview").setup()
  end,
}
