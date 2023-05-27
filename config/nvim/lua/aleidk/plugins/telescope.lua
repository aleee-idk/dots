-- Fuzzy Finder (files, lsp, etc)
return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			-- Blazingly Fast Fuzzy Finder Algorithm for Telescope
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		local opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<c-u>"] = false,
						["<c-d>"] = false,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-s>"] = actions.file_vsplit,
						["<C-v>"] = actions.file_split,
						["<ESC>"] = actions.close,
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<a-t>"] = function(...)
							return require("trouble.providers.telescope").open_selected_with_trouble(...)
						end,
					},
				},
			},
		}
		telescope.setup(opts)

		-- Enable telescope fzf native, if installed
		pcall(telescope.load_extension, "fzf")

		-- Find files
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })

		-- Search stuff
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sD", function()
			builtin.commands({ bufnr = 0 })
		end, { desc = "[S]earch Workspace [D]iagnostics" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch Document [D]iagnostics" })
		vim.keymap.set("n", "<leader>sc", builtin.command_history, { desc = "[S]earch [C]ommand History" })
		vim.keymap.set("n", "<leader>sC", builtin.commands, { desc = "[S]earch [C]ommands" })
	end,
}
