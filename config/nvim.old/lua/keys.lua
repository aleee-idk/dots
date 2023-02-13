--[[

Modes:

| String value |   Help page      |     Affected modes                            |  Vimscript equivalent |
| -------------|------------------|-----------------------------------------------|-----------------------|
| ''           |   mapmode-nvo    |     Normal, Visual, Select, Operator-pending  |  :map                 |
| 'n'          |   mapmode-n      |     Normal                                    |  :nmap                |
| 'v'          |   mapmode-v      |     Visual and Select                         |  :vmap                |
| 's'          |   mapmode-s      |     Select                                    |  :smap                |
| 'x'          |   mapmode-x      |     Visual                                    |  :xmap                |
| 'o'          |   mapmode-o      |     Operator-pending                          |  :omap                |
| '!'          |   mapmode-ic     |     Insert and Command-line                   |  :map!                |
| 'i'          |   mapmode-i      |     Insert                                    |  :imap                |
| 'l'          |   mapmode-l      |     Insert, Command-line, Lang-Arg            |  :lmap                |
| 'c'          |   mapmode-c      |     Command-line                              |  :cmap                |
| 't'          |   mapmode-t      |     Terminal                                  |  :tmap                |

Define Mapping with:
vim.keymap.set(mode, keys, action[, options])

--]]

-- Leader Key
vim.g.mapleader = ' '

vim.keymap.set('n', "<CR>", ":noh<CR>", { desc = "Remove search Highlight", silent = true })

-- local function changeComment()
--   local table = vim.opt.fo:get()
--   local enabled = tagle.c == true && tagle.r == true && tagle.o == true
-- end

vim.keymap.set('', "<Leader>tc", [[if &fo =~ 'cro' | set fo-=cro | else | set fo+=cro | endif]], { desc = "Toggle autocomments", silent = true })

vim.keymap.set('', "<Leader>ti", ":setlocal autoindent!<CR>", { desc = "toggle auto indent"})

vim.keymap.set('', "<Leader>ts", ":setlocal spell!<CR>", { desc = "Toggle spell checker", silent = true })

vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], { desc = "Exit terminal with Esc", silent = true })

vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = "Save file", silent = true })

vim.keymap.set({ 'n', 'v', 'i' }, '<A-j>', ':m .+1<CR>==', { desc = "Move current line down", silent = true })

vim.keymap.set({ 'n', 'v', 'i' }, '<A-k>', ':m .-2<CR>==', { desc = "Move current line up", silent = true })


vim.keymap.set('v', '<', '<gv', { desc = "Better indentation in visual mode", silent = true })

vim.keymap.set('v', '>', '>gv', { desc = "Better indentation in visual mode", silent = true })
