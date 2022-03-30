let mapleader=" "

" ==========================================================
" PLUGINS
" ==========================================================

call plug#begin('~/.vim/plugged')

" Sensible defaults ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-sensible'

" NERDTree - Better file navigation ~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'scrooloose/nerdtree'
" Git status in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Close NERDTree when a file is opened
let g:NERDTreeQuitOnOpen = 1
" Style NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize=60
let g:NERDTreeWinPos="right"

nnoremap <leader>d :NERDTreeFind<CR>
" align s and i splits with NERDTree
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>i :split<CR>

" Telescope - Finder ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Git symbols in gutter ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'airblade/vim-gitgutter'

let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_removed_first_line = '█'
let g:gitgutter_sign_removed_above_and_below = '█'
let g:gitgutter_sign_modified_removed = '█'

" Always show sign column so it doesn't jump around when
" diffs are added
set signcolumn=yes

let g:gitgutter_async = 0

" Various git tools ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-fugitive'

" Select surrounding (, <tag>, ' etc. ~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-surround'

" Extend .'s behaviour ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-repeat'

" Alignment ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'junegunn/vim-easy-align'

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
" Plug 'SirVer/ultisnips'

" Catch-all syntax
Plug 'sheerun/vim-polyglot'

" Italic comments
Plug 'codehearts/mascara-vim'

" JS/TS ----------------------
Plug 'styled-components/vim-styled-components', {
  \ 'branch': 'develop' }

" HTML -----------------------
Plug 'mattn/emmet-vim'
" ,, to trigger emmet
let g:user_emmet_leader_key=','

" Markdown -------------------
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

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

" show ALE errors in bottom right
let g:airline#extensions#ale#enabled = 1

let showtabline=2 " always show tabline

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode', 'paste'])
  set noshowmode " we do not need to show -- insert -- due to airline line above
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline_section_x = ''
  let g:airline_section_y = ''
endfunction
autocm VimEnter * call AirlineInit()

let g:airline_detect_spell=0

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

" Testing ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'janko-m/vim-test'

function! RunTests(command_variable)
  if !exists(a:command_variable)
    echo 'The ' . a:command_variable ' variable must be set to run this command.'
    return
  endif

  execute 'let l:command = ' . a:command_variable
  let l:command = substitute(l:command, '$file', expand('%'), 'g')

  split
  execute 'terminal ' . l:command
endfunction

function! TestFile()
  call RunTests('g:test#file_command')
endfunction

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestLast<CR>

" Make it easy to exit insert mode in test window / terminal
tmap <C-o> <C-\><C-n>

call plug#end()

" Snippets ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:completion_enable_snippet = 'UltiSnips'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_sorting = "none"
let g:completion_matching_smart_case = 1
let g:UltiSnipsExpandTrigger="<CR>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" ALE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1 " Since we use builtin LSP
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 50
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescriptreact': ['eslint'],
\}
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['prettier', 'eslint'],
\ 'typescript': ['prettier', 'eslint'],
\ 'typescriptreact': ['prettier', 'eslint'],
\ 'css': ['prettier'],
\}
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%linter%: %s (%code%)'

" Jump between ALE errors speedily
nmap <silent> <leader>ag <Plug>(ale_first)
nmap <silent> <leader>aG <Plug>(ale_last
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)

" ==========================================================
" GENERAL CONFIG
" ==========================================================

" Show &nbsp and tabs
" Great for avoiding trailing whitespace and broken md files
:set list

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

set cursorline                " show which column the cursor is in
set number relativenumber     " Set relative line number and current line number
set confirm                   " Ask what to do about unsaved/read-only files
filetype plugin indent on     " Enable file type detection and language-dependent indenting.

" tabs etc ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set tabstop=2
set shiftwidth=2
set softtabstop=2
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

" ==========================================================
" MAPPINGS
" ==========================================================

" Copy the path to the current file into system-level clipboard
function! s:copy_file_path()
  let @+ = expand("%")
endfunction
command! -nargs=0 CopyFilePath :call s:copy_file_path()

" Type // in VISUAL mode to search for text under cursor
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" align window jumping with tmux
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l

" Make file directory mapping easier
inoremap <c-f> <c-x><c-f>

" Keep blocks selected when indenting
vmap < <gv
vmap > >gv

" Navigate between display lines like real lines
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>
