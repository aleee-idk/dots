return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>um", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"blue",
			"pylint",
			"eslint_d",
			"markdownlint",
			"nimlsp",
			"prettierd",
			"shellcheck",
			"stylua",
		},
	},
}
