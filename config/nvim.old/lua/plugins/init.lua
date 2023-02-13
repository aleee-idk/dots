local active_plugins = {
	"focus",
	"colorscheme",
	"nvim-tree",
	"bufferline",
	"treesitter",
	"prettyfolds",
	"indent-lines",
	"lsp",
	"telescope",
}

--[[
    Auto update plugins from outside neomvim
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
--]]
--
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		for _, name in ipairs(active_plugins) do
			local ok, plugin = pcall(require, "plugins." .. name)
			if ok then
				use(plugin)
			else
				print("Error loading " .. name .. "In: " .. plugin)
			end
		end

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
