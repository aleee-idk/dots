return {
	hide_root_node = true,
	retain_hidden_root_indent = true,
	enable_diagnostics = true,
	default_component_configs = {
		same_level = true,
		indent = {
			with_expanders = true,
		},
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "➜",
				untracked = "★",
				ignored = "◌",
				unstaged = "✗",
				staged = "✓",
				conflict = "",
			},
		},
	},
	window = {
		width = 30,
		auto_expand_width = true,
		mappings = {
			["<2-LeftMouse>"] = "open_with_window_picker",
			["<cr>"] = "open_with_window_picker",
			["o"] = "o",
			["l"] = "open_with_window_picker",
			["S"] = "split_with_window_picker:",
			["v"] = "vsplit_with_window_picker:",
			["h"] = "close_node",
			["<esc>"] = "end_preview",
			["<tab>"] = { "toggle_preview", config = { use_float = true } },
			["."] = "set_root",
			["i"] = "toggle_hidden",
			["R"] = "refresh",
			["/"] = "fuzzy_finder",
			["f"] = "filter_on_submit",
			["<c-x>"] = "clear_filter",
			["a"] = { "add", config = { show_path = "relative" } },
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy",
			["m"] = "move",
			["q"] = "close_window",
			["e"] = function()
				vim.api.nvim_exec("Neotree focus filesystem left", true)
			end,
			["b"] = function()
				vim.api.nvim_exec("Neotree focus buffers left", true)
			end,
			["g"] = function()
				vim.api.nvim_exec("Neotree focus git_status left", true)
			end,
		},
	},
	filesystem = {
		group_empty_dirs = true,
		hijack_netrw_behavior = "open_default",
		filtered_items = {
			hide_by_name = {
				".DS_Store",
				"thumbs.db",
				"node_modules",
				"__pycache__",
			},
		},
		components = {
			harpoon_index = function(config, node)
				local Marked = require("harpoon.mark")
				local path = node:get_id()
				local succuss, index = pcall(Marked.get_index_of, path)
				if succuss and index and index > 0 then
					return {
						text = string.format("-> %d", index), -- <-- Add your favorite harpoon like arrow here
						highlight = config.highlight or "NeoTreeDirectoryIcon",
					}
				else
					return {}
				end
			end,
		},
		renderers = {
			file = {
				{ "icon" },
				{ "name",         use_git_status_colors = true },
				{ "harpoon_index" }, --> This is what actually adds the component in where you want it
				{ "diagnostics" },
				{ "git_status",   highlight = "NeoTreeDimText" },
			},
		},
		window = {
			mappings = {
				["h"] = "close_node",
			},
		},
	},
	buffers = {
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
			},
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			},
		},
	},
	event_handlers = {
		{
			event = "vim_buffer_enter",
			handler = function(_)
				if vim.bo.filetype == "neo-tree" then
					vim.wo.signcolumn = "auto"
				end

				vim.cmd("highlight! Cursor blend=100")
			end,
		},
		{
			event = "file_opened",
			handler = function()
				--auto close
				require("neo-tree").close_all()
			end,
		},
	},
}
