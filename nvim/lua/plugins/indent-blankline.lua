return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent_blankline_max_indent_increase = 1,
    },
    config = function(_, opts)
      require("indent_blankline").setup(opts)
    end
  }
}
