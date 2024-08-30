return {
	{
		"echasnovski/mini.comment",
		version = "*",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-context" },
		},
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
							or vim.bo.commentstring
				end,
			},
		},
	},
	{
		"LudoPinelli/comment-box.nvim",
		event = "VeryLazy",
		config = function()
			require("comment-box").setup({
				outer_blank_lines = true,
			})

			local cb = require("comment-box")

			-- left aligned fixed size box with left aligned text
			MAP({ "n", "v" }, "gcb", cb.lcbox, "Create a comment box")
			-- centered adapted box with centered text
			MAP({ "n", "v" }, "gcl", cb.llline, "Create a comment line")
		end,
	},
	{
		"danymat/neogen",
		opts = { snippet_engine = "luasnip" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		version = "*", -- stable releases
		keys = {
			{
				"gcd",
				function()
					require("neogen").generate()
				end,
				desc = "Generate comment docstring",
			},
		},
	},
}
