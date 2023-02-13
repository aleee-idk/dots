local function tree_config()
	local tree = require("nvim-tree")
	local tree_cb = require("nvim-tree.config").nvim_tree_callback

	tree.setup({
		hijack_unnamed_buffer_when_opening = true,
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true, -- cursor at the start of filename
		update_focused_file = {
			enable = true -- focus curren file
		},
		actions = { open_file = { quit_on_open = true } },
		renderer = {
			full_name = true, -- show remaining name in floating text
			group_empty = true, -- group empty folders
			add_trailing = true, -- Trailing slash to folders
			highlight_opened_files = "all",
			highlight_git = true
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
					{ key = "s", action = "vsplit" },
					{ key = "v", action = "split" },
					{ key = "t", action = "tabnew" },
					{ key = { "h", "<BS>" }, action = "close_node" },
					{ key = "i", action = "toggle_dotfiles" },
					{ key = "I", action = "toggle_ignored" },
					{ key = { "<C-l>", "<C-CR>" }, cb = tree_cb("system_open") }
				}
			}
		}
	})

	-- bindings
	vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })
	vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })
end

return {
	'kyazdani42/nvim-tree.lua',
	config = tree_config,
	requires = {
		'kyazdani42/nvim-web-devicons' -- optional, for file icons
	}
}
