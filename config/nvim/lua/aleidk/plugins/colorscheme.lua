local colorscheme = "onedark"

return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	opts = {
		options = {
			transparency = true, -- Use a transparentbackground?
		},
		colors = {
			bg = "#000000",
			fg = "#abb2bf",
			red = "#ef596f",
			orange = "#fab387",
			yellow = "#e5c07b",
			green = "#89ca78",
			cyan = "#2bbac5",
			blue = "#61afef",
			purple = "#d55fde",
			white = "#abb2bf",
			black = "#000000",
			gray = "#434852",
			highlight = "#e2be7d",
			comment = "#7f848e",
			none = "NONE",
		},
	},
	config = function(_, opts)
		require("onedarkpro").setup(opts)
		vim.cmd.colorscheme(colorscheme)
	end,
}
