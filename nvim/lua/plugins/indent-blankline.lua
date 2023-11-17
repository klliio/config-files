return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			debounce = 100,
			indent = {
				char = '┃',
			},
			scope = {
				show_start = false,
				show_end = false,
			}
		},
		config = function(_, opts)
			require("ibl").setup(opts)
		end
	}
}
