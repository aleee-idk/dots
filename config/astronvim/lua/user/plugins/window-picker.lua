return {
	"s1n7ax/nvim-window-picker",
	config = function(plugin, opts)
		opts.use_winbar = "always"
		require("plugins.configs.nvim-window-picker")(plugin, opts)
	end,
}
