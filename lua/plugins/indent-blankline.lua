return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
    },
    config = function(_, opts)
      require("indent_blankline").setup(opts)
    end
  }
}
