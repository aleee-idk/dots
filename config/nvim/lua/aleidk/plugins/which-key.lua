return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
			["g"] = { name = "+Goto" },
			["gz"] = { name = "+Surround" },
			["<leader>b"] = { name = "+Buffer" },
			["<leader>c"] = { name = "+Comments" },
			["<leader>f"] = { name = "+File/Find" },
			["<leader>g"] = { name = "+Git" },
			["<leader>q"] = { name = "+Quit/Session" },
			["<leader>s"] = { name = "+Search" },
			["<leader>u"] = { name = "+UI" },
			["<leader>w"] = { name = "+Windows" },
			["<leader>l"] = { name = "+Diagnostics/Quickfix" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
