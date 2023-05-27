return {
	"ray-x/lsp_signature.nvim",
	lazy = false, -- Doesn't work if lazy loaded
	opts = {
		hint_enable = false,
	},
	keys = {
		{
			"<leader>lk",
			vim.lsp.buf.signature_help,
			desc = "Toggle signature",
		},
	},
}
