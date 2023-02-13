local function config()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = true,
			color_icons = true,
			show_close_icon = false
		}
	})

	vim.keymap.set('n', 'H', ':BufferLineCyclePrev<CR>', { desc = "Go to prev buffer", silent = true })
	vim.keymap.set('n', 'L', ':BufferLineCycleNext<CR>', { desc = "Go to next buffer", silent = true })
	vim.keymap.set('n', '<Leader>c', ':bdelete<CR>', { desc = "Close current buffer", silent = true })
	vim.keymap.set('n', '<Leader>C', ':bdelete!<CR>', { desc = "Close current buffer whitout saving", silent = true })
end

return {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = config
}
