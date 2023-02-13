local telescope_actions = require("telescope.actions")

return {
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = telescope_actions.move_selection_next,
				["<C-k>"] = telescope_actions.move_selection_previous,
				["<C-s>"] = telescope_actions.file_vsplit,
				["<C-v>"] = telescope_actions.file_split,
				["<ESC>"] = telescope_actions.close,
			},
		},
	},
}
