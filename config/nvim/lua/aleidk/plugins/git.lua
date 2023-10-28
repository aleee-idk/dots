return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, "<leader>g" .. l, r, { buffer = buffer, desc = desc })
				end

				-- stylua: ignore start
				map("n", "j", gs.next_hunk, "Next Hunk")
				map("n", "k", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "s", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "r", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "u", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "R", gs.reset_buffer, "Reset Buffer")
				map("n", "p", gs.preview_hunk, "Preview Hunk")
				map("n", "l", function() gs.blame_line() end, "Blame Line")
				map("n", "d", gs.diffthis, "Diff This")
			end,
		},
	},

	-- Testing main Git plugin

	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		keys = {
			{ "<leader>gG", ":Git<CR>", desc = "Fugitive" },
		},
	},

	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gL", ":LazyGit<CR>", desc = "Lazygit" },
		},
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
		opts = {
			disable_insert_on_commit = "auto",
			kind = "replace",
			disable_line_numbers = false,
			commit_editor = {
				kind = "replace",
			},
		},
		keys = {
			{
				"<leader>gg",
				function()
					require("neogit").open()
				end,
				desc = "Neogit",
			},
		},
	},
}
