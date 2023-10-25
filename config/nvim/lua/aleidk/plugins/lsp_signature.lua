return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		hint_enable = false,
	},
	keys = {
		{
			"<leader>lK",
			vim.lsp.buf.signature_help,
			desc = "Toggle signature",
		},
	},
}
