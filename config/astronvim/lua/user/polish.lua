return function()
	local function alpha_on_bye(cmd)
		local bufs = vim.fn.getbufinfo({ buflisted = true })
		vim.cmd(cmd)
		if require("core.utils").is_available("alpha-nvim") and not bufs[2] then
			require("alpha").start(true)
		end
	end

	vim.keymap.del("n", "<leader>C")

	if require("core.utils").is_available("bufdelete.nvim") then
		vim.keymap.set("n", "<leader>C", function()
			alpha_on_bye("Bdelete!")
		end, { desc = "Close buffer" })
	else
		vim.keymap.set("n", "<leader>C", function()
			alpha_on_bye("bdelete!")
		end, { desc = "Close buffer" })
	end

	vim.api.nvim_create_autocmd({
		"BufEnter",
		"BufAdd",
		"BufNew",
		"BufNewFile",
		"BufWinEnter",
	}, {
		group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
		callback = function()
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	})
end
