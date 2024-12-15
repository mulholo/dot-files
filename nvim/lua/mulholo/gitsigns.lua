require('gitsigns').setup {
  signs = {
    add          = { text = '▌' },
    change       = { text = '▌' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

-- Define highlights explicitly
local hl = vim.api.nvim_set_hl
hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
hl(0, 'GitSignsAddLn', { link = 'DiffAdd' })
hl(0, 'GitSignsAddNr', { link = 'DiffAdd' })
hl(0, 'GitSignsChange', { link = 'DiffChange' })
hl(0, 'GitSignsChangeLn', { link = 'DiffChange' })
hl(0, 'GitSignsChangeNr', { link = 'DiffChange' })
hl(0, 'GitSignsChangedelete', { link = 'DiffChange' })
hl(0, 'GitSignsChangedeleteLn', { link = 'DiffChange' })
hl(0, 'GitSignsChangedeleteNr', { link = 'DiffChange' })
hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
hl(0, 'GitSignsDeleteLn', { link = 'DiffDelete' })
hl(0, 'GitSignsDeleteNr', { link = 'DiffDelete' })
hl(0, 'GitSignsTopdelete', { link = 'DiffDelete' })
hl(0, 'GitSignsTopdeleteLn', { link = 'DiffDelete' })
hl(0, 'GitSignsTopdeleteNr', { link = 'DiffDelete' })
