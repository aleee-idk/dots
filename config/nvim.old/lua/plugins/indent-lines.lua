local function config()

    -- vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:↴"

    require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = false
    }

    -- vim.g.indent_blankline_char_list = {"│"}
    -- vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_filetype_exclude = {
        "help", "terminal", "dashboard", "nvim-tree"
    }
    vim.g.indent_blankline_buftype_exclude = {"terminal"}
    vim.g.indent_blankline_show_first_indent_level = false
    vim.g.indent_blankline_use_treesitter = true

end

return {"lukas-reineke/indent-blankline.nvim", config = config}
