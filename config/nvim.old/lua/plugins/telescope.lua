local function config()
	-- Telescope.nvim
	local telescope = require("telescope")
	local pickers = require("telescope.builtin")
	require("project_nvim").setup()

	-- Extensions
	telescope.load_extension("projects")

	-- Open Files
	vim.keymap.set("n", "<Leader>f", function()
		pickers.find_files()
	end, { silent = true, desc = "Find file" })

	vim.keymap.set("n", "<Leader>Fp", function()
		telescope.extensions.projects.projects()
	end, { silent = true, desc = "Find project" })

	-- List vim stuff
	vim.keymap.set("n", "<Leader>bf", function()
		pickers.buffers()
	end, { silent = true, desc = "Find buffers" })

	-- List LSP Stuff
	vim.keymap.set("n", "<Leader>ld", function()
		pickers.diagnostics({ bufnr = 0 })
	end, { silent = true, desc = "Find diagnostics" })

	vim.keymap.set("n", "<Leader>lD", function()
		pickers.diagnostics()
	end, { silent = true, desc = "Find diagnostics in all buffers" })

	-- Config
	local telescope_actions = require("telescope.actions")
	telescope.setup({
		defaults = {
			entry_prefix = "  ",
			selection_caret = "* ",
			file_ignore_patterns = { "%.env", "cache", ".xlsx" },
			mappings = {
				i = {
					["<C-j>"] = telescope_actions.move_selection_next,
					["<C-k>"] = telescope_actions.move_selection_previous,
					["<C-s>"] = telescope_actions.file_vsplit,
					["<C-v>"] = telescope_actions.file_split,
					["<ESC>"] = telescope_actions.close,
				},
				n = {
					["gg"] = telescope_actions.move_to_top,
					["G"] = telescope_actions.move_to_bottom,
					["s"] = telescope_actions.file_vsplit,
					["v"] = telescope_actions.file_split,
				},
			},
			path_display = {
				truncate = 1,
			},
		},
		-- Specific config
		pickers = {
			buffers = {
				sort_lastused = true,
				mappings = {
					i = { ["d"] = require("telescope.actions").delete_buffer },
					n = { ["<c-d>"] = require("telescope.actions").delete_buffer },
				},
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"ahmedkhalf/project.nvim",
	},
	config = config,
}
