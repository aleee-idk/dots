return {
	"rebelot/heirline.nvim",
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	event = "UiEnter",
	config = function()
		require("heirline").setup({
			statusline = {},
			winbar = {},
			tabline = {},
			statuscolumn = {},
			opts = {},
		})
	end,
}
