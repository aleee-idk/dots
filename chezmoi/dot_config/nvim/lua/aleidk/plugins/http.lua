return {
	"jellydn/hurl.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter"
	},
	ft = "hurl",
	opts = {
		-- Show debugging info
		debug = false,
		-- Show notification on run
		show_notification = false,
		-- Show response in popup or split
		mode = "popup",
		-- Default formatter
		formatters = {
			json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
			html = {
				'prettierd', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
				'--parser',
				'html',
			},
		},
		env_file = {
			'hurl.env',
			'.env',
			'.env.local',
		},
	},
	keys = {
		-- Run API request
		{ "<leader>ph", "<cmd>HurlRunnerAt<CR>", desc = "Run HTTP request" },
		{ "<leader>pH", "<cmd>HurlRunner<CR>",   desc = "Run all HTTP requests" },
		-- Run Hurl request in visual mode
		{ "<leader>ph", ":HurlRunner<CR>",       desc = "Run HTTP requests",    mode = "v" },
	},
}
