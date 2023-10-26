return { -- Change colors.none if not using a transparent background
	"catppuccin/nvim",
	priority = 1000,
	lazy = false,
	opts = {
		flavour = "macchiato",
		transparent_background = false,
		integrations = {
			cmp = true,
			indent_blankline = {
				enabled = true,
			},
		},
		custom_highlights = function(colors)
			return {
				-- Fix colors for cmp
				Pmenu = { bg = colors.none, blend = 0 },
				FloatBorder = { bg = colors.none },
				CmpItemMenu = { fg = colors.text, bg = colors.none },
			}
		end,
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
