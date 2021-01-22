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

nnoremap <leader>d :NERDTreeFind<CR>
" align s and i splits with NERDTree
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>i :split<CR>


" Git symbols in gutter ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'airblade/vim-gitgutter'

" Various git tools ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'tpope/vim-fugitive'

" Errors and linting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'w0rp/ale'

" disable completion
let g:ale_completion_enabled = 0
" enable sfix on save
let g:ale_fix_on_save = 1
" set a better timeout
let g:ale_lint_delay = 50

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'html': ['htmlhint'],
\ 'css': ['stylelint'],
\ 'python': ['flake8'],
\}
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'typescript': ['prettier', 'eslint'],
\ 'css': ['prettier'],
\ 'python': ['black'],
\}

highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says: %s %- (code)%'

" Jump between ALE errors speedily
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)

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

" Python ---------------------
let python_highlight_all=1
" Formatting
Plug 'python/black'
" PEP8 check
Plug 'nvie/vim-flake8'

" Haskell --------------------
Plug 'neovimhaskell/haskell-vim'
" For when I want to improve this:
" http://marco-lopes.com/articles/Vim-and-Haskell-in-2019/

" Generic --------------------
" Catch-all syntax
Plug 'sheerun/vim-polyglot'
" Italic comments
Plug 'codehearts/mascara-vim'

" JS/TS ----------------------
Plug 'styled-components/vim-styled-components', {
  \ 'branch': 'develop' }
Plug 'jxnblk/vim-mdx-js'

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
let g:airline_powerline_fonts = 0
let g:tmuxline_powerline_separators = 0

" Confusingly, we config tmux here

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
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Fuzzy search ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Access git-install fzf instance
Plug '~/.fzf' 
" Install fzf vim plugin (note the .vim suffix)
Plug 'junegunn/fzf.vim'

" search files
nnoremap <leader>f :Files<CR>

" search inside files with Rg then fzf the output
" Don't add another map with a second char after this or
" the load for this will slow down
nnoremap <leader>r :Rg<CR>
" Fix bat preview:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" fzf search open windows
nnoremap <leader>w :Windows<CR>


" fzf search lines in cur. buffer
nnoremap <leader>b :BLines<CR>

" fzf search command history
nnoremap <leader>c :History:<CR>

" fzf search search history
nnoremap <leader>/ :History:<CR>

" Match actions to NERDTree
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

call plug#end()

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

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" status line ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set statusline+=\ %F\ %l\:%c

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

" Auto reload vimrc 
augroup myvimrc
  au!
  au BufWritePost .vimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

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
nnoremap <leader>n gt
nnoremap <leader>p gT

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
