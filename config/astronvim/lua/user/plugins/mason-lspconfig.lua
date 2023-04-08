return {
	"williamboman/mason-lspconfig.nvim",
	config = function(plugin, opts)
		opts["ensure_installed"] = {
			"bashls",
			"cssls",
			"dockerls",
			"emmet_ls",
			"html",
			"pyright",
			"rust_analyzer",
			"sqlls",
			"lua_ls",
			"tsserver",
			"yamlls",
		}
		require("plugins.configs.mason-lspconfig")(plugin, opts)
	end,
}
