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
			background = { -- :h background
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
		lazy = true,
		name = "rose-pine",
		opts = {
			variant = 'auto',
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = 'moon',
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = false,
			disable_float_background = false,
			disable_italics = true,

			--- @usage string hex value or named color from rosepinetheme.com/palette
			groups = {
				background = 'base',
				background_nc = '_experimental_nc',
				panel = 'surface',
				panel_nc = 'base',
				border = 'highlight_med',
				comment = 'muted',
				link = 'iris',
				punctuation = 'subtle',

				error = 'love',
				hint = 'iris',
				info = 'foam',
				warn = 'gold',

				headings = {
					h1 = 'iris',
					h2 = 'foam',
					h3 = 'rose',
					h4 = 'gold',
					h5 = 'pine',
					h6 = 'foam',
				}
				-- or set all headings at once
				-- headings = 'subtle'
			},

			-- Change specific vim highlight groups
			-- https://github.com/rose-pine/neovim/wiki/Recipes
			highlight_groups = {
				ColorColumn = { bg = 'rose' },

				-- Blend colours against the "base" background
				CursorLine = { bg = 'foam', blend = 10 },
				StatusLine = { fg = 'love', bg = 'love', blend = 10 },

				-- By default each group adds to the existing config.
				-- If you only want to set what is written in this config exactly,
				-- you can set the inherit option:
				Search = { bg = 'gold', inherit = false },
			}
		}
	},
	{
		"folke/tokyonight.nvim",
		lazy = true
	} }
