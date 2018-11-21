" =================================================================================================
" PLUGINS 
" =================================================================================================

call plug#begin('~/.vim/plugged')
" Sensible defaults
Plug 'tpope/vim-sensible'

" Better file navigation
Plug 'scrooloose/nerdtree'

" Git status in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git symbols in your gutter
Plug 'airblade/vim-gitgutter'

" Syntax correction
Plug 'w0rp/ale'

" Bracket matching
Plug 'Raimondi/delimitMate'

" Vertical bars for spaces
Plug 'Yggdroot/indentLine'

" Colours show up in terminal as actual colours
Plug 'gko/vim-coloresque'

" Better flow integration
Plug 'flowtype/vim-flow'

" Theme
Plug 'mhartington/oceanic-next'

" Syntax
Plug 'othree/yajs.vim'
Plug 'sheerun/vim-polyglot'
" Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Completion
Plug 'Valloric/YouCompleteMe'

" Snippets
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'

" Airline bar
Plug 'vim-airline/vim-airline'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File Icons (MUST GO LAST)
Plug 'ryanoasis/vim-devicons'

call plug#end()

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

" disable type warnings in flow
" "level": "error", "warning" could disable all
let g:ycm_filter_diagnostics = {
  \ "javascript": {
  \      "regex": [ "ts file" ],
  \    }
  \ }

" Jump to middle on <CR> and space bracket expansion
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Avoid conflicting maps with YouCompleteMe
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsListSnippets = "<C-s>"
let g:UltiSnipsJumpForwardTrigger = "<C-f>"
let g:UltiSnipsJumpBackwardTrigger = "<C-d>"

" octave syntax
augroup filetypedetect 
au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 

" IndentLine
let g:indentLine_char='│'

" Icons in airline
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1

" =================================================================================================
" BASE
" =================================================================================================

if (has("termguicolors"))
set termguicolors
endif

syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
set cursorcolumn                " show which column the cursor is in
set backspace=indent,eol,start  " Make backspace behave sanely
set number relativenumber       " Set relative line number and current line number
set confirm                     " Ask what to do about unsaved/read-only files
filetype plugin indent on       " Enable file type detection and language-dependent indenting.
set synmaxcol=250 " Performance

" Italic comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic  

" tabs etc
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Automatic line formatting for markdown
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist
" Prevent annoying character hides in markdown
au BufRead,BufNewFile *.md let g:indentLine_setConceal = 0

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
nnoremap <leader>d :NERDTreeFind<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>t <c-w><c-w>

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

