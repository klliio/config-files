return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      color_icons = true
    },
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end
  } }
