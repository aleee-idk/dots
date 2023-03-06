return function(config)
	local null_ls = require("null-ls")
	config.sources = {
		null_ls.builtins.formatting.prettierd.with({
			disabled_filetypes = { "markdown" },
		}),

		null_ls.builtins.formatting.phpcsfixer.with({
			extra_args = {
				"--config",
				"$HOME/.config/php-cs-fixer-conf.php",
			},
		}),
	}
	return config
end
