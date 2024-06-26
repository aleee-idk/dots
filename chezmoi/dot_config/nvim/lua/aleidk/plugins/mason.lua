return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"blue",
			"eslint_d",
			"markdownlint",
			"nimlsp",
			"prettierd",
			"shellcheck",
			"stylua",
		},
	},
}
