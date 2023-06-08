return {
	"ckolkey/ts-node-action",
	dependencies = { "nvim-treesitter", "jose-elias-alvarez/null-ls.nvim" },
	config = function()
		require("ts-node-action").setup({})

		vim.keymap.set({ "n" }, "<leader>lA", require("ts-node-action").node_action, { desc = "Trigger Node Action" })

		require("null-ls").register({
			name = "more_actions",
			method = { require("null-ls").methods.CODE_ACTION },
			filetypes = { "_all" },
			generator = {
				fn = require("ts-node-action").available_actions,
			},
		})
	end,
}