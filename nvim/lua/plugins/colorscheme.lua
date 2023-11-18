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
					colored_indent_levels = true,
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
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "night",
			light_style = "day",
			transparent = false,
			terminal_colors = false,
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = false },
				keywords = { italic = false },
				functions = {},
				variables = {},

				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark",
				floats = "dark",
			},
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = true,
			lualine_bold = false,
		}
	} }
