return {
	"jay-babu/mason-null-ls.nvim",
	config = function(plugin, opts)
		opts["ensure_installed"] = {
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
		}
		require("plugins.configs.mason-null-ls")(plugin, opts)
	end,
}
