return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	config = function()
		require("trouble").setup({
			mode = "document_diagnostics",
			action_keys = {
				open_split = "s",
				open_vsplit = "v",
				open_tab = "t",
			},
		})

		MAP("n", "<leader>fd", "<cmd>TroubleToggle<cr>", { silent = true, desc = "Search diagnostics" })
	end,
}
