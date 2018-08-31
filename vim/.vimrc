" =================================================================================================
" PLUGINS 
" =================================================================================================

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'trevordmiller/nova-vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'flowtype/vim-flow'
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
\ 'javascript': ['eslint'],
\ 'html': ['htmlhint'],
\}
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\}

let g:ale_javascript_prettier_options = '--print-width 100 --single-quote --trailing-comma all'
" run prettier manually with gp, not just on save
nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>

" Emmet - use tab as expand key
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" FZF
let $FZF_DEFAULT_COMMAND='fd --type f'

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" javascript syntax
let g:javascript_plugin_flow = 1


" =================================================================================================
" BASE
" =================================================================================================

colorscheme nova
set antialias                   " smooth fonts
set cursorcolumn                " show which column the cursor is in
set backspace=indent,eol,start  " Make backspace behave sanely
set relativenumber              " Set relative line number
set confirm                     " Ask what to do about unsaved/read-only files
syntax on                       " Switch syntax highlighting on
filetype plugin indent on       " Enable file type detection and language-dependent indenting.
set synmaxcol=200 " Performance

" tabs etc
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Automatic line formatting for Markdown
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist

" =================================================================================================
" MAPPINGS 
" =================================================================================================

let mapleader=" "
nnoremap <leader>f :FZF<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>t <c-w><c-w>

" move lines up and down
nnoremap = ddp
nnoremap - dd2kp

" enable deletion in insert mode
inoremap <c-d> <esc>ddi

" convert CURRENT WORD TO UPPERCASE in insert mode
inoremap <c-u> <esc>bveUea
nnoremap <c-u> bveUe

