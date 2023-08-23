return { -- Floating terminal
  {
    "numToStr/FTerm.nvim",
    lazy = true,
    opts = {
      blend = 30,
      dimensions = {
        height = 0.9,
        width = 0.9,
        x = 0.5,
        y = 0.5,
      },
    },
    config = function(_, opts)
      require("FTerm").setup(opts)
    end
  } }
