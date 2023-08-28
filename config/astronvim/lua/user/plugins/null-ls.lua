return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function(opts)
		local null_ls = require("null-ls")
		opts.sources = {
			null_ls.builtins.formatting.prettierd.with({
				disabled_filetypes = { "markdown" },
				extra_filetypes = { "astro" },
			}),

			null_ls.builtins.formatting.phpcsfixer.with({
				extra_args = {
					"--config",
					"$HOME/.config/php-cs-fixer-conf.php",
				},
			}),
		}
	end,
}
