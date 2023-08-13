return {
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = { "110" },
      scope = "window",
      disabled_filetypes = { "json" }
    },
    config = function(_, opts)
      require("smartcolumn").setup(opts)
    end
  }
}
