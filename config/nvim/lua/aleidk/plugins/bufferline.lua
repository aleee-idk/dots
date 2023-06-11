return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	after = "onedark",
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
		{ "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
		{ "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
	},
	dependencies = {
		{
			"echasnovski/mini.bufremove",
			-- stylua: ignore
			keys = {
				{ "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
				{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
			},
		},
	},
	config = function()
		local opts = {
			highlights = { separator = { bg = "NONE" } },
			options = {
				-- FIXME: Doesn't work with onedark pro colorscheme
				-- separator_style = "padded_slant",
				-- themable = true,
				close_command = function(n)
					require("mini.bufremove").delete(n, false)
				end,
				-- stylua: ignore
				right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diag)
					local icons = require("aleidk.constants").icons.diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
							.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "NvimTree",
						-- text = "nvim-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
				groups = {
					items = {
						require("bufferline.groups").builtin.pinned:with({ icon = "" }),
					},
				},
			},
		}
		require("bufferline").setup(opts)
	end,
}
