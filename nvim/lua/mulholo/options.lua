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
vim.opt.termguicolors = true        -- full colors
vim.cmd "filetype plugin indent on" -- Enable file type detection and language-dependent indenting.
vim.g.t_ZH = "e[3m"                 -- Enable italics
vim.g.t_ZR = "e[23m"                -- Enable italics
vim.opt.tabstop = 2                 -- Tab size
vim.opt.shiftwidth = 2              -- Tab size
vim.opt.softtabstop = 2             -- Tab size
vim.opt.expandtab = true            -- Use spaces for tabbing
vim.opt.clipboard = "unnamedplus"   -- Use system clipboard
vim.opt.ignorecase = true           -- ignore case by default in / search 
vim.opt.smartcase = true            -- use case if uppercase is added in / search
