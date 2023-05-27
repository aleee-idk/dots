-- Linter and formatter configuration

require("mason-null-ls").setup({
	handlers = {}, -- this make mason-null-ls to auto setup handlers
	ensure_installed = {
		"blade_formatter",
		"blue",
		"eslint_d",
		"fixjson",
		"gitlint",
		"intelephense",
		"markdownlint",
		"php-cs-fixer",
		"prettierd",
		"shellcheck",
		"shfmt",
		"sql-formatter",
		"stylua",
		"yamlint",
	},
})

local null_ls = require("null-ls.builtins")

require("null-ls").setup({
	sources = {
		null_ls.formatting.prettierd.with({
			disabled_filetypes = { "markdown" },
		}),

		null_ls.formatting.phpcsfixer.with({
			extra_args = {
				"--config",
				"$HOME/.config/php-cs-fixer-conf.php",
			},
		}),
	},
})
