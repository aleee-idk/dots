return {
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter", "jose-elias-alvarez/null-ls.nvim" },
		config = function()
			require("ts-node-action").setup({})

			vim.keymap.set({ "n" }, "<leader>lA", require("ts-node-action").node_action, { desc = "Node Action" })

			require("null-ls").register({
				name = "more_actions",
				method = { require("null-ls").methods.CODE_ACTION },
				filetypes = { "_all" },
				generator = {
					fn = require("ts-node-action").available_actions,
				},
			})
		end,
	},
	{
		"Wansmer/treesj",
		cmd = { "TSJToggle" },
		keys = {
			{ "<leader>lm", "<CMD>TSJToggle<CR>", desc = "Toggle treesitter join" },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = true,
		},
	},
}
