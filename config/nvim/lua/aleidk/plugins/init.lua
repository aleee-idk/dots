return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	{
		-- Highlight word under cursor
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"echasnovski/mini.surround",
		version = "*",
		event = "VeryLazy",
	},
}
