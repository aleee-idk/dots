return {
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },
	{ "rcarriga/nvim-notify",        enabled = false },
	--
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
	},
	{
		"s1n7ax/nvim-comment-frame",
		dependencies = { "nvim-treesitter" },
		config = {
			disable_default_keymap = true,
		},
	},
	{
		"danymat/neogen",
		config = { snippet_engine = "luasnip" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		version = "*", -- stable releases
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "mason-lspconfig.nvim" }, -- make sure to load after mason-lspconfig
		config = function()
			local lsp = require("astronvim.utils.lsp")
			require("rust-tools").setup({
				server = lsp.config("rust_analyzer"), -- get the server settings and built in capabilities/on_attach
			})
		end,
	},
}
