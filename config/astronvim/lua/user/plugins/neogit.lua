return {
	"TimUntersberger/neogit",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
		-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
		auto_refresh = true,
		-- Change the default way of opening neogit
		kind = "floating",
		-- Change the default way of opening the commit popup
		commit_popup = {
			kind = "floating",
		},
		-- Change the default way of opening the preview buffer
		preview_buffer = {
			kind = "floating",
		},
		-- Change the default way of opening popups
		popup = {
			kind = "floating",
		},
		-- customize displayed signs
		signs = {
			-- { CLOSED, OPENED }
			section = { ">", "v" },
			item = { ">", "v" },
			hunk = { "", "" },
		},
		mappings = {
			-- modify status buffer mappings
			status = {
				["l"] = "Toggle",
				["h"] = "Close",
			},
		},
	},
	keys = {
		{
			"<leader>gn",
			function()
				require("neogit").open()
			end,
			desc = "Open neogit",
		},
	},
}
