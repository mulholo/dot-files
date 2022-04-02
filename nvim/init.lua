-- guide for translating vimscript to lua: https://www.notonlycode.org/neovim-lua-config/

require "mulholo.options"
require "mulholo.keymaps"
require "mulholo.plugins"

vim.cmd([[
" ==========================================================
" PLUGINS
" ==========================================================

call plug#begin('~/.vim/plugged')

" Sensible defaults ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-sensible'

" Telescope - Finder ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Select surrounding (, <tag>, ' etc. ~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-surround'

" Extend .'s behaviour ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-repeat'

" Add extra operators ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Comments -------------------
" e.g. gcip to comment a paragraph
Plug 'tpope/vim-commentary'

" Replace --------------------
" e.g. `gre` to replace to end of word with current buffer
" contents
Plug 'vim-scripts/ReplaceWithRegister'

" Sort -----------------------
Plug 'christoomey/vim-sort-motion'

" Text Objects ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Enable other text object plugins
Plug 'kana/vim-textobj-user'

" Add text object for parts of camel and snake-case variables
" e.g. foo_ba|r_baz -> civquux -> foo_quux_baz
Plug 'Julian/vim-textobj-variable-segment'

" Add text object for lines
" ai -> indentation level and line above
" ii -> indentation level, no line above
" aI -> indentation level, line above and line below
Plug 'michaeljsmith/vim-indent-object'

" Language Support & Syntax ~~~~~~~~~~~~~~~~~~~~~~~~~~

" HTML -----------------------

" Airline ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

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

" Theming ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'lifepillar/vim-solarized8'

call plug#end()

" ==========================================================
" GENERAL CONFIG
" ==========================================================

" Colors ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Enable italics
set t_ZH="\e[3m"
set t_ZR="\e[23m"

if (has("termguicolors"))
set termguicolors
endif
syntax enable
set background=dark
colorscheme solarized8_high
let g:solarized_visibility = "high"
let g:solarized_statusline = "flat"
let g:solarized_use16 = 1
" Fix neovim cursorline colour issue
highlight CursorLine ctermfg=black


" tabs etc ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Automatic line formatting for markdown
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist " Prevent annoying character hides in markdown
au BufRead,BufNewFile *.md let g:indentLine_setConceal = 0

" Open to last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

" Use system clipboard
set clipboard=unnamed

" Ignore case in / searches unless you type capital letters
set ignorecase
set smartcase

" Clear search with ESC
nnoremap <esc> :noh<return><esc>

"" Copy the path to the current file into system-level clipboard
function! s:copy_file_path()
  let @+ = expand("%")
endfunction
command! -nargs=0 CopyFilePath :call s:copy_file_path()
]])
