-- guides for translating vimscript to lua:
-- * https://www.notonlycode.org/neovim-lua-config/
-- * https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

require "mulholo.options"
require "mulholo.keymaps"
require "mulholo.plugins"
require "mulholo.theme"

vim.cmd([[
" Telescope - Finder ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Airline ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Use nice symbols from a powerline font
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_stl_path_style = 'short'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode', 'paste'])
  set noshowmode " we do not need to show -- insert -- due to airline line above
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline_section_x = ''
  let g:airline_section_y = ''
endfunction
autocm VimEnter * call AirlineInit()

" Confusingly, we config tmux here (to align with airline)
let g:tmuxline_powerline_separators = 0

" Left is configured with a, b, c, right with x, y, z
" cwin and win affect the current (active) window and the
" in-active windows respectively.
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '%R'}

" Automatic line formatting for markdown
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist " Prevent annoying character hides in markdown
au BufRead,BufNewFile *.md let g:indentLine_setConceal = 0

" Open to last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

"" Copy the path to the current file into system-level clipboard
function! s:copy_file_path()
  let @+ = expand("%")
endfunction
command! -nargs=0 CopyFilePath :call s:copy_file_path()
]])
