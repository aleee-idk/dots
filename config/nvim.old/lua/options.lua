--------------------------------------------------------------------------------
--                            Native Neovim Config                            --
--------------------------------------------------------------------------------

--[[

  vim.opt.{option}         ->  :set
  vim.opt_global.{option}  ->  :setglobal
  vim.opt_local.{option}   ->  :setlocal

--]] 


-- Set Shell
vim.opt.shell = "/usr/bin/env bash"

vim.g.python3_host_prog = "/usr/bin/python3"

-- Keep the cursor centered by X rows from top / bottom
vim.opt.scrolloff = 15

-- Use System clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable Mouse
vim.opt.mouse = "a"

-- Set Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Identation
local indent = 2
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent

-- Ignore case when searching
vim.opt.ignorecase = true

-- Override the 'ignorecase' option if the search pattern contains case characters.
vim.opt.smartcase = true

-- Wrap Search
vim.opt.wrapscan = true

-- Autocompletion with 'wildchar'
vim.opt.wildmode = "longest,list,full"

-- Fix Sppliting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set undofile
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undo"
vim.opt.undolevels = 1000

-- Open already open windows
vim.opt.switchbuf = 'usetab'

-- Auto add comments on new line if prev was a comment
vim.opt.fo:append({ cro = true })
