local colorscheme = "solarized8_high" -- Requires solarized plugin. See plugins.lua

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

-- Detect system theme on macOS
local function get_system_theme()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  return result:match("Dark") and "dark" or "light"
end

vim.opt.background = get_system_theme()

vim.g.solarized_visibility = "high"
vim.g.solarized_statusline = "flat"
vim.g.solarized_use16 = 1

-- Fix neovim cursorline colour issue
vim.cmd "highlight CursorLine ctermfg=black"
