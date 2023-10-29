return {
	{
		"nvim-tree/nvim-tree.lua",
		-- enabled = false,
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			local tree = require("nvim-tree")
			local api = require("nvim-tree.api")

			tree.setup({
				hijack_unnamed_buffer_when_opening = true,
				disable_netrw = false,
				hijack_netrw = false, -- handle by telescope browser
				hijack_cursor = true, -- cursor at the start of filename
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true, -- focus curren file
					update_root = true,
				},
				actions = { open_file = { quit_on_open = true } },
				renderer = {
					full_name = true, -- show remaining name in floating text
					group_empty = true, -- group empty folders
					add_trailing = true, -- Trailing slash to folders
					highlight_opened_files = "all",
					highlight_git = true,
				},
				view = {
					centralize_selection = true, -- center current file on enter
					width = 30, -- N° of columns or %
				},
				on_attach = function(bufnr)
					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					-- Check defaults here: https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach
					api.config.mappings.default_on_attach(bufnr)

					vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
					vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
					vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
					vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
					vim.keymap.set("n", "s", api.node.open.vertical, opts("Open in vsplit"))
					vim.keymap.set("n", "v", api.node.open.horizontal, opts("Open in hsplit"))
					vim.keymap.set("n", "t", api.node.open.tab, opts("Open in tab"))
					vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close dir"))
					vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close dir"))
					vim.keymap.set("n", "i", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
					vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
				end,
			})

			-- Auto open when a dir is opened

			local function open_nvim_tree(data)
				-- buffer is a directory
				local directory = vim.fn.isdirectory(data.file) == 1

				if not directory then
					return
				end

				-- create a new, empty buffer
				vim.cmd.enew()

				-- wipe the directory buffer
				vim.cmd.bw(data.buf)

				-- change to the directory
				vim.cmd.cd(data.file)

				-- open the tree
				require("nvim-tree.api").tree.open()
			end

			vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
			vim.api.nvim_create_user_command("Tree", "NvimTreeToggle", {})

			-- bindings
			-- disabled to discourage the use of this plugin without disabling it
			-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })
			-- vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = function()
			local oil = require("oil")
			return {
				win_options = {
					number = false,
				},
				delete_to_trash = true,
				trash_command = "trash",
				skip_confirm_for_simple_edits = false,
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["l"] = "actions.select",
					["<C-CR>"] = "actions.open_external",
					["<C-s>"] = function()
						oil.select({ vertical = true })
						vim.cmd.wincmd({ args = { "p" } })
						oil.close()
						vim.cmd.wincmd({ args = { "p" } })
					end,
					["<C-v>"] = "actions.select_split",
					["<C-t>"] = "actions.select_tab",
					["<C-p>"] = "actions.preview",
					["<C-d>"] = "actions.preview_scroll_down",
					["<C-u>"] = "actions.preview_scroll_up",
					["<Esc>"] = "actions.close",
					["<C-r>"] = "actions.refresh",
					["y"] = "actions.copy_entry_path",
					["h"] = "actions.parent",
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
				},
			}
		end,
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<Leader>e", "<CMD>Oil<CR>", desc = "Open file explorer" },
		},
	},
}
