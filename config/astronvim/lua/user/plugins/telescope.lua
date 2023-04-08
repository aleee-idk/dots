return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"debugloop/telescope-undo.nvim",
	},
	config = function(plugin, opts)
		local actions = require("telescope.actions")
		opts.defaults.mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-s>"] = actions.file_vsplit,
				["<C-v>"] = actions.file_split,
				["<ESC>"] = actions.close,
			},
		}
		opts.extensions = {
			undo = {
				entry_format = "state #$ID, $STAT, $TIME",
				mappings = {
					i = {
						["<cr>"] = require("telescope-undo.actions").yank_additions,
						["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
						["<C-cr>"] = require("telescope-undo.actions").restore,
					},
				},
			},
		}
		require("plugins.configs.telescope")(plugin, opts)

		-- require telescope and load extensions as necessary
		local telescope = require("telescope")
		telescope.load_extension("undo")
		vim.keymap.set("n", "<leader>fu", function()
			telescope.extensions.undo.undo()
		end, { desc = "Undo tree" })
	end,
}
