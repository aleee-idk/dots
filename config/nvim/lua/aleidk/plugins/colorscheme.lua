local colorscheme = "rose-pine"
return {
	"rose-pine/neovim",
	name = colorscheme,
	priority = 1000,
	config = function(_, opts)
		require(colorscheme).setup(opts)
		vim.cmd.colorscheme(colorscheme)
	end,
	opts = {
		--- @usage 'auto'|'main'|'moon'|'dawn'
		variant = "moon",
		--- @usage 'main'|'moon'|'dawn'
		dark_variant = "moon",
		--- @usage string hex value or named color from rosepinetheme.com/palette
		groups = {
			background = "none",
		},
		-- Change specific vim highlight groups
		-- https://github.com/rose-pine/neovim/wiki/Recipes
		highlight_groups = {
			TelescopeBorder = { fg = "highlight_high", bg = "none" },
			TelescopeNormal = { bg = "none" },
			TelescopePromptNormal = { bg = "base" },
			TelescopeResultsNormal = { fg = "subtle", bg = "none" },
			TelescopeSelection = { fg = "text", bg = "base" },
			TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
		},
	},
}
