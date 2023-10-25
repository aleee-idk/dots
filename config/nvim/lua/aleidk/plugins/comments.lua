return {
	{
		"echasnovski/mini.comment",
		version = "*",
		event = "VeryLazy",
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
		-- init = nil,
		event = "VeryLazy",
		-- opts = {},
		config = function()
			require("comment-box").setup({
				outer_blank_lines = true,
			})

			local cb = require("comment-box")

			-- left aligned fixed size box with left aligned text
			MAP({ "n", "v" }, "<Leader>cb", cb.lcbox, "Create a comment box")
			-- centered adapted box with centered text
			MAP({ "n", "v" }, "<Leader>cl", cb.cline, "Create a comment line")
		end,
	},
}
