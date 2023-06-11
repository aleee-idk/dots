-- [[ Basic Keymaps ]]

function MAP(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc, silent = true })
end

local function default(desc)
	return {
		silent = true,
		desc = desc,
	}
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z", default("Keep cursor in column while joining lines"))

vim.keymap.set("n", "<C-d>", "<C-d>zz", default("Keep cursor centered while junping"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", default("Keep cursor centered while junping"))

vim.keymap.set("n", "n", "nzzzv", default("Keep cursor centered while searching"))
vim.keymap.set("n", "N", "Nzzzv", default("Keep cursor centered while searching"))

vim.keymap.set("n", "Q", "<nop>", {})

vim.keymap.set("n", "<leader>lj", function()
	vim.diagnostic.goto_next()
end, default("Go to next diagnostic"))
vim.keymap.set("n", "<leader>lk", function()
	vim.diagnostic.goto_prev()
end, default("Go to prev diagnostic"))

vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	default("Search and replace current word")
)

vim.keymap.set("n", "<leader>R", ":%s/", default("Search and replace in the whole file"))
vim.keymap.set("v", "<leader>r", ":s/", default("Search and replace in selection"))

vim.keymap.set("v", "p", [["_dP]], default("Paste whitout lossing yanked text"))

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", default("Move selection down"))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", default("Move selection up"))
