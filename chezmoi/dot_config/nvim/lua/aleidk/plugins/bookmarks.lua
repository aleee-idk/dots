local function select_or_create(search)
	local grapple = require("grapple")

	if grapple.exists(search) then
		grapple.select(search)
	else
		grapple.tag()
	end
end

return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	lazy = false,
	cmd = "Grapple",
	keys = {
		{ "<leader><leader>a", "<cmd>Grapple toggle<cr>",                      desc = "Toggle bookmark for current file" },
		{ "<leader><leader>D", "<cmd>Grapple reset<cr>",                       desc = "Delete all bookmarks" },
		{ "<leader><leader>t", "<cmd>Grapple toggle_tags<cr>",                 desc = "Toggle bookmarks window" },
		{ "<leader><leader>T", "<cmd>Grapple toggle_scopes<cr>",               desc = "Toggle scopes window" },
		{ "<leader><leader>n", "<cmd>Grapple cycle forward<cr>",               desc = "Next bookmark" },
		{ "<leader><leader>N", "<cmd>Grapple cycle backward<cr>",              desc = "Prev bookmark" },
		{ "<leader><leader>j", function() select_or_create({ index = 1 }) end, desc = "Go or create bookmark 1" },
		{ "<leader><leader>k", function() select_or_create({ index = 2 }) end, desc = "Go or create bookmark 2" },
		{ "<leader><leader>l", function() select_or_create({ index = 3 }) end, desc = "Go or create bookmark 3" },
		{ "<leader><leader>ñ", function() select_or_create({ index = 4 }) end, desc = "Go or create bookmark 4" },
		{ "<leader><leader>J", "<cmd>Grapple tag index=1<cr>",                 desc = "Override bookmark 1" },
		{ "<leader><leader>K", "<cmd>Grapple tag index=2<cr>",                 desc = "Override bookmark 2" },
		{ "<leader><leader>L", "<cmd>Grapple tag index=3<cr>",                 desc = "Override bookmark 3" },
		{ "<leader><leader>Ñ", "<cmd>Grapple tag index=4<cr>",                 desc = "Override bookmark 4" },
	},
}
