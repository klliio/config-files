return {
  {
    -- Ayu theme
    'Shatur/neovim-ayu',
    lazy = true,
    priority = 1000,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {     -- :h background
        light = "latte",
        dark = "mocha",
      },

      integrations = {
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        telescope = true,
        treesitter = true,
        fidget = true,
        gitsigns = true,
        mason = true,
        cmp = true,
      },
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      dark_variant = "main"
    }
  },
  {
    "folke/tokyonight.nvim",
    lazy = true
  } }
