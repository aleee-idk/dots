return {
	-- ["/nvim-neo-tree/neo-tree.nvim"] = { disable = true },
	["rcarriga/nvim-notify"] = { disable = true },
	--
	["catppuccin/nvim"] = {
		as = "catppuccin",
		config = function()
			require("user.plugins.catppuccin")
		end,
	},
	["nvim-treesitter/nvim-treesitter-context"] = {
		config = function()
			require("treesitter-context").setup()
		end,
	},
	["ahmedkhalf/project.nvim"] = {
		config = function()
			require("user.plugins.project")
		end,
	},
	-- ["kyazdani42/nvim-tree.lua"] = {
	-- 	config = function()
	-- 		require("user.plugins.nvim-tree")
	-- 	end,
	-- },
	["kylechui/nvim-surround"] = {
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup()
		end,
	},
	["s1n7ax/nvim-comment-frame"] = {
		requires = {
			{ "nvim-treesitter" },
		},
		config = function()
			require("nvim-comment-frame").setup({
				disable_default_keymap = true,
			})
		end,
	},
	["danymat/neogen"] = {
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
		requires = "nvim-treesitter/nvim-treesitter",
		tag = "*", -- stable releases
	},
	["folke/todo-comments.nvim"] = {
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	["folke/trouble.nvim"] = {
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("user.plugins.trouble")
		end,
	},
	["anuvyklack/pretty-fold.nvim"] = {
		config = function()
			require("user.plugins.pretty-fold")
		end,
	},
	["simrat39/rust-tools.nvim"] = {
		after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
		config = function()
			require("rust-tools").setup({
				server = astronvim.lsp.server_settings("rust_analyzer"), -- get the server settings and built in capabilities/on_attach
			})
		end,
	},
	["ThePrimeagen/harpoon"] = {
		config = function()
			require("user.plugins.harpoon")
		end,
	},
	["ckolkey/ts-node-action"] = {
		requires = { "nvim-treesitter" },
		config = function()
			require("user.plugins.ts-node-action")
		end,
	},
	["phaazon/mind.nvim"] = {
		branch = "v2",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("user.plugins.mind")
		end,
	},
}
