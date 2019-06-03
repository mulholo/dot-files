" ==========================================================
" PLUGINS 
" ==========================================================

call plug#begin('~/.vim/plugged')
" Sensible defaults
Plug 'tpope/vim-sensible'

" Better file navigation
Plug 'scrooloose/nerdtree'

" Git status in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git symbols in your gutter
Plug 'airblade/vim-gitgutter'

" Git tool
Plug 'tpope/vim-fugitive'

" Syntax correction
Plug 'w0rp/ale'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Lines to indicate indentation
Plug 'Yggdroot/indentLine'

" Surrounds (brackets, tags, quotes ...)
Plug 'tpope/vim-surround'

" Allow . for vim-surround commands
Plug 'tpope/vim-repeat'

" Better flow integration
" Plug 'flowtype/vim-flow'

" Theme
" Plug 'mhartington/oceanic-next'
Plug 'trevordmiller/nova-vim'
Plug 'NLKNguyen/papercolor-theme'

" Syntax
" General, catch-all
Plug 'sheerun/vim-polyglot'
" Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
" MDX
Plug 'jxnblk/vim-mdx-js'
" Python PEP8 check
Plug 'nvie/vim-flake8'

" CSS colors shown inline
Plug 'ap/vim-css-color'

" Completion
Plug 'Valloric/YouCompleteMe'

" Emmet
Plug 'mattn/emmet-vim'

" Repl
Plug 'metakirby5/codi.vim'

" Testing
Plug 'janko-m/vim-test'

" Snippets
Plug 'SirVer/ultisnips'

" Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" Close NERDTree when a file is opened
let NERDTreeQuitOnOpen = 1

" Style NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Indentations
let g:indentLine_char = '│'
let g:indentLine_setColors = 0

" ALE
" disable completion
let g:ale_completion_enabled = 0
" enable sfix on save
let g:ale_fix_on_save = 1
" set a better timeout
let g:ale_lint_delay = 50

" Add flow to javascript as needed
let g:ale_linters = {
\ 'javascript': ['eslint' ],
\ 'html': ['htmlhint'],
\ 'css': ['stylelint'],
\ 'python': ['flake8'],
\}
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'typescript': ['prettier', 'eslint'],
\}

highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says: %s %- (code)%'

" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

" python syntax
let python_highlight_all=1

" javascript syntax

" let g:javascript_plugin_flow = 1
" Disable Flow checks on save
" let g:flow#enable = 0
" Don't use vim-flow quickfix window (
" let g:flow#showquickfix = 0

" disable YCM type warnings in flow
" "level": "error", "warning" could disable all
let g:ycm_filter_diagnostics = {
  \ "javascript": {
  \      "regex": [ "ts file", "'=' expected", "';' expected" ],
  \    }
  \ }

" ,, to trigger emmet
let g:user_emmet_leader_key=','

" Jump to middle on <CR> and space bracket expansion
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Avoid UltiSnips conflicting maps with YouCompleteMe
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsListSnippets = "<C-s>"
let g:UltiSnipsJumpForwardTrigger = "<C-f>"
let g:UltiSnipsJumpBackwardTrigger = "<C-d>"

" Open UltiSnips in a split window rather than replacing current buffer 
let g:UltiSnipsEditSplit="vertical"
" Set UltiSnips directory location
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dot-files/vim/UltiSnips']

" Octave syntax
augroup filetypedetect 
au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 

" ==========================================================
" BASE
" ==========================================================

if (has("termguicolors"))
set termguicolors
endif

syntax enable

" Light themes
" set background=light
" colorscheme PaperColor

" Dark themes
set background=dark
colorscheme nova

set cursorline                " show which column the cursor is in
set number relativenumber     " Set relative line number and current line number
set confirm                   " Ask what to do about unsaved/read-only files
filetype plugin indent on     " Enable file type detection and language-dependent indenting.

" Fix neovim cursorline colour issue
highlight CursorLine ctermfg=black

" tabs etc
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

" vim-test docker setup
let g:test#suite_command = 'docker exec -it web_client yarn test $file'
let g:test#file_command = 'docker exec -it web_client yarn test $file'

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

function! TestSuite()
  call RunTests('g:test#suite_command')
endfunction

function! TestFile()
  call RunTests('g:test#file_command')
endfunction

" Tagbar JS types
let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components'
      \ ]}

" Use system clipboard
set clipboard=unnamed

" Ignore case in / searches unless you type capital letters
set ignorecase
set smartcase

" Auto reload vimrc 
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" ==========================================================
" MAPPINGS 
" ==========================================================

let mapleader=" "
nnoremap <leader>f :FZF<CR>
nnoremap <leader>d :NERDTreeFind<CR>

" align s and i splits with NERDTree
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>i :split<CR>

" Quick Open Tagbar
nnoremap <leader>tt :TagbarToggle<CR>

" Copy the path to the current file into system-level clipboard
nnoremap <leader>cp :let @+ = expand("%")<CR>

" Jump between ALE errors speedily
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)

" align window jumping with tmux
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>o <c-w><c-w>

nnoremap <leader>n gt
nnoremap <leader>p gT

" YouCompleteMe mappings
" mneumonics: j - jump, g - get, t - type
nnoremap <leader>j2 :YcmCompleter GoTo<CR>
nnoremap <leader>jt :YcmCompleter GoToType<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>

" vim-test mappings
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestLast<CR>
" For testing inside docker
nnoremap <leader>td :call TestFile()<CR>

" Make it easy to exit insert mode in test window / terminal
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

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
