--[[

	LSP Server: code completition, references for variables and other stuff.
	Linter: Code rules for consistency.
	Formatter: Code style for eye candy.
	Debugger: well... a debugger...

--]]

-- FIXME: Refactor this code so it's more readable

local function setup()
	local lsp = require("lsp-zero")
	local cmp = require("cmp")
	local null_ls = require("null-ls")
	-- local mason_null_ls = require("mason-null-ls")

	lsp.preset("recommended")

	lsp.nvim_workspace({
		library = vim.api.nvim_get_runtime_file("", true),
	})

	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	lsp.setup_nvim_cmp({
		mapping = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		}),

		sources = {
			{ name = "path" },
			{ name = "nvim_lsp", keyword_length = 3 },
			{ name = "luasnip", keyword_length = 2 },
		},
	})

	lsp.set_preferences({
		set_lsp_keymaps = false,
	})

	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, { desc = "Show lsp info of the symbol under the cursor", silent = true })
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, { desc = "Go to definition", silent = true })
	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, { desc = "Go to declaration", silent = true })
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, { desc = "Go to implementation", silent = true })
	vim.keymap.set("n", "go", function()
		vim.lsp.buf.type_definition()
	end, { desc = "Go to definition of the type", silent = true })
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, { desc = "List references in quickfix window", silent = true })
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.signature_help()
	end, { desc = "Show signature", silent = true })
	vim.keymap.set("n", "<Leader>lr", function()
		vim.lsp.buf.rename()
	end, { desc = "Rename all references", silent = true })
	vim.keymap.set("n", "<Leader>la", function()
		vim.lsp.buf.code_action()
	end, { desc = "Code action", silent = true })
	vim.keymap.set("n", "<Leader>lj", function()
		vim.diagnostic.goto_next()
	end, { desc = "Go to next diagnostics", silent = true })
	vim.keymap.set("n", "<Leader>lk", function()
		vim.diagnostic.goto_prev()
	end, { desc = "Go to prev diagnostics", silent = true })

	lsp.setup()

	local null_linters = null_ls.builtins.diagnostics
	local null_formatters = null_ls.builtins.formatting

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local lsp_formatting = function(bufnr)
		vim.lsp.buf.format({
			filter = function(client)
				-- apply whatever logic you want (in this example, we'll only use null-ls)
				return client.name == "null-ls"
			end,
			bufnr = bufnr,
		})
	end

	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- TODO: use this when neovim 8.0 comes out
						lsp_formatting(bufnr)
						-- vim.lsp.buf.formatting_sync()
					end,
				})
			end
		end,

		sources = {
			-- Linters --
			null_linters.eslint_d,
			null_linters.gitlint,
			null_linters.luacheck,
			null_linters.markdownlint,
			null_linters.shellcheck,
			null_linters.yamllint,
			null_linters.todo_comments,

			-- Formatters --
			null_formatters.blade_formatter,
			null_formatters.blue,
			null_formatters.fixjson,
			null_formatters.phpcsfixer,
			null_formatters.prettierd,
			null_formatters.shfmt,
			null_formatters.sql_formatter,
			null_formatters.stylua,
			null_formatters.yamlfmt,
		},
	})
end

return {
	"VonHeikemen/lsp-zero.nvim",
	config = setup,
	requires = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },

		-- Linters and Formatters
		{ "jose-elias-alvarez/null-ls.nvim" },
		-- { "jayp0521/mason-null-ls.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
}
