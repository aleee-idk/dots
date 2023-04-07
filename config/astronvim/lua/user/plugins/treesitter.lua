return {
	"nvim-treesitter/nvim-treesitter",
	config = function(plugin, opts)
		opts.ensure_installed = { "javascript", "typescript", "php", "python", "lua", "bash", "sql", "yaml", "json" }
		require("plugins.configs.nvim-treesitter")(plugin, opts)
	end,
}
