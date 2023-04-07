return {
	"nvim-telescope/telescope.nvim",
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
		require("plugins.configs.telescope")(plugin, opts)
	end,
}
