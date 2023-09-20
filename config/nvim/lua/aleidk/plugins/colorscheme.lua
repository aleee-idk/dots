return {
	"catppuccin/nvim",
	priority = 1000,
	lazy = false,
	opts = {
		flavour = "macchiato",
		transparent_background = true,
		integrations = {
			fidget = true,
		},
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
