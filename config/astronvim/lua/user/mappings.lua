return {
	n = {
		["<C-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		["<leader>fn"] = false,
		["<leader>fo"] = false,
		["<leader>fh"] = false,
		["<leader>fb"] = false,
		["<F10>"] = false,
		["<F11>"] = false,
		["<F12>"] = false,

		["<F1>"] = {
			function()
				require("dap").terminate()
			end,
			desc = "Debugger: Stop",
		}, -- S-F1
		["<F2>"] = {
			function()
				require("dap").restart_frame()
			end,
			desc = "Debugger: Restart",
		},
		["<F3>"] = {
			function()
				require("dap").step_out()
			end,
			desc = "Debugger: Step Out",
		},
		["<F4>"] = {
			function()
				require("dap").step_into()
			end,
			desc = "Debugger: Step Into",
		},
		["<F5>"] = {
			function()
				require("dap").step_over()
			end,
			desc = "Debugger: Step Over",
		},
		["<F6>"] = {
			function()
				require("dap").continue()
			end,
			desc = "Debugger: Start",
		},
		["<F7>"] = {
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debugger: Toggle Breakpoint",
		},

		["<leader>fp"] = {
			function()
				require("telescope").extensions.projects.projects()
			end,
			desc = "Search project",
		},
		["<leader>lj"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			desc = "Go to next diagnostic",
		},
		["<leader>lk"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			desc = "Go to prev diagnostic",
		},

		["<leader>Ch"] = {
			function()
				require("nvim-comment-frame").add_comment()
			end,
			desc = "Add a comment frame",
		},

		["<leader>CH"] = {
			function()
				require("nvim-comment-frame").add_multiline_comment()
			end,
			desc = "Add a multiline comment frame",
		},

		["<leader>Cd"] = {
			function()
				require("neogen").generate()
			end,
			desc = "Generate comment docstring",
		},

		["<leader>ft"] = {
			"<cmd>TodoTrouble<CR>",
			desc = "Search TODOS",
		},

		["<leader>r"] = {
			":s/",
			desc = "Search and replace",
		},
		["<leader>R"] = {
			":%s/",
			desc = "Search and replace in whole file",
		},
	},
	v = {
		["<leader>r"] = {
			":s/",
			desc = "Search and replace",
		},

		["p"] = {
			"pgvy",
			desc = "Paste and re yank text",
		},
	},
	t = {
		["<C-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
	},
}
