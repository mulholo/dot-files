-- GitHub Copilot configuration
-- Use Ctrl-G for Copilot completion to avoid conflicts with Tab
-- vim.keymap.set('i', '<C-G>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true

-- Additional keymaps for Copilot
-- vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
-- vim.keymap.set('i', '<C-H>', '<Plug>(copilot-dismiss)')
-- vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)')
-- vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)')

-- Enable Copilot for relevant filetypes
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["javascriptreact"] = true,
  ["typescript"] = true,
  ["typescriptreact"] = true,
  ["python"] = true,
  ["lua"] = true,
  ["go"] = true,
  ["rust"] = true,
  ["json"] = true,
  ["markdown"] = true,
}
