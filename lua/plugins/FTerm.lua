return { -- Floating terminal
  {
    "numToStr/FTerm.nvim",
    opts = {
    },
    config = function(_, opts)
      require("FTerm").setup(opts)
    end
  } }
