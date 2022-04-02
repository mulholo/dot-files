-- Basic config options
-- See `:help options`
vim.cmd "filetype plugin indent on" -- Enable file type detection and language-dependent indenting.
vim.g.mapleader = ' '               -- Set <leader> to ' '
vim.opt.confirm = true              -- Ask what to do about unsaved/read-only files
vim.opt.cursorline = true           -- show which column the cursor is in
vim.opt.list = true                 -- Show &nbsp and tabs. Great for avoiding trailing whitespace and broken md files
vim.opt.mouse = "a"                 -- Allow mouse usage
vim.opt.relativenumber = true       -- Set relative line number and current line number
vim.opt.signcolumn = "yes"          -- Always show sign column to avoid shifting
vim.opt.undofile = true             -- Allow persistant undo
vim.opt.scrolloff = 4               -- Preserve more context around cursor when scrolling
