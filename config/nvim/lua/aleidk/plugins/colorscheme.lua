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
				scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
				colored_indent_levels = true,
			},
		},
		custom_highlights = function(colors)
			return {
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
