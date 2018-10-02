" =================================================================================================
" PLUGINS 
" =================================================================================================

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'flowtype/vim-flow'
Plug 'mhartington/oceanic-next'
Plug 'othree/yajs.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'othree/yajs.vim'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'trevordmiller/nova-vim'
call plug#end()

" Open NERDTree automatically upon opening a repo.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close NERDTree when a file is opened
let NERDTreeQuitOnOpen = 1

" Style NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ALE
let g:ale_fix_on_save = 1
let g:ale_linters = {
\ 'javascript': ['eslint', 'flow'],
\ 'html': ['htmlhint'],
\ 'css': ['stylelint'],
\}
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\}

let g:ale_javascript_prettier_options = '--print-width 100 --single-quote --trailing-comma all'
" run prettier manually with gp, not just on save
nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '❔'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says: %s %- (code)%'
" Set pink highlight color
highlight ALEError ctermbg=176
" Underline errors
highlight ALEError ctermbg=none cterm=underline

" FZF
let $FZF_DEFAULT_COMMAND='fd --type f'

" javascript syntax
let g:javascript_plugin_flow = 1

" =================================================================================================
" BASE
" =================================================================================================

" syntax on
syntax enable                   " Switch syntax highlighting on

if (has("termguicolors"))
  set termguicolors
endif

colorscheme nova                " OceanicNext
let g:airline_theme='nova'
set antialias                   " smooth fonts
set cursorcolumn                " show which column the cursor is in
set backspace=indent,eol,start  " Make backspace behave sanely
set relativenumber              " Set relative line number
set confirm                     " Ask what to do about unsaved/read-only files
filetype plugin indent on       " Enable file type detection and language-dependent indenting.
set synmaxcol=200 " Performance

" Italic comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic  

" tabs etc
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Automatic line formatting for Markdown
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist

" Open to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Use system clipboard
set clipboard=unnamed

" =================================================================================================
" MAPPINGS 
" =================================================================================================

let mapleader=" "
nnoremap <leader>f :FZF<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>t <c-w><c-w>

" You never use ; so why not map it to :?
" Super-quick command access!
nnoremap ; :

" Make file directory mapping easier
inoremap <c-f> <c-x><c-f>

" Keep blocks selected when indenting
vmap < <gv
vmap > >gv

" Navigate between display lines
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>

" move lines up and down
nnoremap = ddp
nnoremap - dd2kp

" enable deletion in insert mode
inoremap <c-d> <esc>ddi

" convert CURRENT WORD TO UPPERCASE in insert mode
inoremap <c-u> <esc>bveUea
nnoremap <c-u> bveUe

