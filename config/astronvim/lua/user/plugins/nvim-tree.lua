return {
	"nvim-tree/nvim-tree.lua",
	-- enabled = false,
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local tree = require("nvim-tree")
		local tree_cb = require("nvim-tree.config").nvim_tree_callback

		tree.setup({
			hijack_unnamed_buffer_when_opening = true,
			disable_netrw = true,
			hijack_netrw = true,
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
				mappings = {
					custom_only = false,
					-- list of mappings to set on the tree manually
					list = {
						{ key = { "l", "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
						-- {key = {"L", "<2-RightMouse>", "<C-]>"}, action = "cd"},
						{ key = "s",                                   action = "vsplit" },
						{ key = "v",                                   action = "split" },
						{ key = "t",                                   action = "tabnew" },
						{ key = { "h", "<BS>" },                       action = "close_node" },
						{ key = "i",                                   action = "toggle_dotfiles" },
						{ key = "I",                                   action = "toggle_ignored" },
						{ key = { "<C-l>", "<C-CR>" },                 cb = tree_cb("system_open") },
					},
				},
			},
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

		-- bindings
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })
		vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })
	end,
}
