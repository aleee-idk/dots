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
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		opts = {
			auto_enable = true,
			lsp = true,
		},
	},
}
