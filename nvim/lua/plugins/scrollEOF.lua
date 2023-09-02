return {
	{
		"Aasim-A/scrollEOF.nvim",
		opts = {
			insert_mode = true,
		},
		config = function(_, opts)
			require('scrollEOF').setup(opts)
		end
	}
}
