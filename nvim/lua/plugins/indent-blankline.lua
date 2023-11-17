return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			debounce = 100,
			indent = {
				char = '┃',
			},
		},
		config = function(_, opts)
			require("ibl").setup(opts)
		end
	}
}
