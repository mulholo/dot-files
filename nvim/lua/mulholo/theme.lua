local colorscheme = "solarized8_high"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd([[
if (has("termguicolors"))
  set termguicolors
endif
]])

vim.cmd "syntax enable"

vim.opt.background = "dark"

vim.g.solarized_visibility = "high"
vim.g.solarized_statusline = "flat"
vim.g.solarized_use16 = 1

-- Fix neovim cursorline colour issue
vim.cmd "highlight CursorLine ctermfg=black"
