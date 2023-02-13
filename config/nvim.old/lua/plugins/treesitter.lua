local function config()

    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            "bash", "c", "comment", "cpp", "css", "dockerfile", "html",
            "javascript", "jsdoc", "json", "lua", "python", "query", "regex",
            "typescript", "yaml", "sql", "http", "php", "rust", "scss",
            "markdown", "dart"
        },
        highlight = {enable = true},
        indent = {enable = true},
        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
        }
    })

    -- Treesitter Folding
    vim.api.nvim_create_autocmd({
        'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter'
    }, {
        group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
        callback = function()
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        end
    })
end

return {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        require('nvim-treesitter.install').update({with_sync = true})
    end,
    config = config
}
