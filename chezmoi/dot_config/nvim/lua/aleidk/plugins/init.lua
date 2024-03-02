return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	{
		-- Highlight word under cursor
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		opts = {
			auto_enable = true,
			lsp = true,
		},
	},
	-- Dotfiles management
	{
		"xvzc/chezmoi.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "alker0/chezmoi.vim" },
		config = function()
			require("chezmoi").setup({
				{
					edit = {
						watch = false,
						force = false,
					},
					notification = {
						on_open = true,
						on_apply = true,
						on_watch = false,
					},
					telescope = {
						select = { "<CR>" },
					},
				},
			})

			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				-- INFO: this should be the same as $(chezmoi source-path)
				pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/chezmoi/*" },
				callback = function()
					vim.schedule(require("chezmoi.commands.__edit").watch)
				end,
			})
			local telescope = require("telescope")

			telescope.load_extension("chezmoi")
			vim.keymap.set("n", "<leader>fz", telescope.extensions.chezmoi.find_files, { desc = "Find dotfile" })
		end,
	},
}
