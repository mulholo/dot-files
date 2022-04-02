-- :help options
vim.g.mapleader = ' '               -- Set <leader> to ' '
vim.opt.list = true                 -- Show &nbsp and tabs. Great for avoiding trailing whitespace and broken md files
vim.opt.cursorline = true           -- show which column the cursor is in
vim.opt.relativenumber = true       -- Set relative line number and current line number
vim.opt.confirm = true              -- Ask what to do about unsaved/read-only files
vim.cmd "filetype plugin indent on" -- Enable file type detection and language-dependent indenting.
