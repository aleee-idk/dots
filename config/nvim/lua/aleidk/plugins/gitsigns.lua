-- Adds git releated signs to the gutter, as well as utilities for managing changes
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, "<leader>g" .. l, r, { buffer = buffer, desc = desc })
			end

			-- stylua: ignore start
			map("n", "j", gs.next_hunk, "Next Hunk")
			map("n", "k", gs.prev_hunk, "Prev Hunk")
			map({ "n", "v" }, "s", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
			map({ "n", "v" }, "r", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
			map("n", "u", gs.undo_stage_hunk, "Undo Stage Hunk")
			map("n", "R", gs.reset_buffer, "Reset Buffer")
			map("n", "p", gs.preview_hunk, "Preview Hunk")
			map("n", "l", function() gs.blame_line({ full = true }) end, "Blame Line")
			map("n", "d", gs.diffthis, "Diff This")
			map("n", "D", function() gs.diffthis("~") end, "Diff This ~")
		end,
	},
}
