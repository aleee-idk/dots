local cmd = vim.api.nvim_create_autocmd

-- cmd({"BufNewFile", "BufFilePre", "BufRead"}, {
--     pattern = {"*.md"},
--     callback = function() vim.opt.filetype = "markdown" end
-- })

cmd("InsertEnter",
    {pattern = "*", command = "norm zz", desc = "Center line on insert mode"})

-- highlight yank selection
cmd("TextYankPost", {
    pattern = "*",
    callback = function() vim.highlight.on_yank() end,
    desc = "Highligth line on yank"
})

