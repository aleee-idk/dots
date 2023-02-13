return function(config)
	local null_ls = require("null-ls")
	config.sources = {
		null_ls.builtins.formatting.prettierd.with({
			disabled_filetypes = { "markdown" },
		}),
	}
	return config
end
