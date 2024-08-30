return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = {
		-- See aviable formatters in: https://github.com/stevearc/conform.nvim#formatters
		-- Formatters can be installed by mason
		formatters_by_ft = {
			-- Conform will run multiple formatters sequentially
			-- Use a sub-list to run only the first available formatter
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured.
			["_"] = { "trim_whitespace" },
			blade = { "blade-formatter" },
			css = { { "prettierd", "prettier" } },
			go = { { "gofumpt", "goimports_reviser", "golines" } },
			html = { "prettierd" },
			javascript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			jsonc = { { "prettierd", "prettier" } },
			lua = { "stylua" },
			markdown = { "markdownlint" },
			nim = { "nimpretty" },
			php = { "pint" },
			python = { "blue" },
			scss = { { "prettierd", "prettier" } },
			sh = { "shfmt" },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			xml = { "lemminx" },
			zsh = { "shfmt" }
		},
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 2000, lsp_fallback = true }
		end,
	},
	config = function(_, opts)
		require("conform").setup(opts)

		local function toggleAutoFormat()
			-- to make this global, change b to g
			if vim.b.disable_autoformat == nil then
				vim.b.disable_autoformat = true
				return
			end

			vim.b.disable_autoformat = not vim.b.disable_autoformat
		end

		MAP("n", "<leader>uf", toggleAutoFormat, "Toggle auto format")

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_format = "fallback", range = range })
		end, { range = true })
	end,
}
