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

" Git tools
Plug 'tpope/vim-fugitive'

" Syntax correction
Plug 'w0rp/ale'

" Lines to indicate indentation
Plug 'Yggdroot/indentLine'

" Surrounds (brackets, tags, quotes ...)
Plug 'tpope/vim-surround'

" Add comment operator under `gc` e.g. gcip to comment a paragraph
Plug 'tpope/vim-commentary'

" Add replace operator under `gr` 
Plug 'vim-scripts/ReplaceWithRegister'

" Allow . for vim-surround commands
Plug 'tpope/vim-repeat'

" Autcompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Sorting
Plug 'christoomey/vim-sort-motion'

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

" Language Support ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" These are largely useful to help deoplete.
" :help deoplete-options then search for EXTERNAL SOURCES to
" see more language server extension options

" Python Support
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'python/black'

" TypeScript Support
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Flow support
" Plug 'flowtype/vim-flow'
" Reason Support
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'Shougo/vimproc'

" Italic comments
Plug 'codehearts/mascara-vim'

" Any theme you can dream of
" Plug 'flazz/vim-colorschemes'
Plug 'lifepillar/vim-solarized8'

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

" Emmet snippet expansion
Plug 'mattn/emmet-vim'

" Repl
Plug 'metakirby5/codi.vim'

" Testing
Plug 'janko-m/vim-test'

" Align Things Easily
Plug 'junegunn/vim-easy-align'

" Snippets
Plug 'SirVer/ultisnips'

" Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" NERDTree ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Close NERDTree when a file is opened
let NERDTreeQuitOnOpen = 1

" Style NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" IndentLine ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" disable by default
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
let g:indentLine_setColors = 0

" ALE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" disable completion
let g:ale_completion_enabled = 0
" enable sfix on save
let g:ale_fix_on_save = 1
" set a better timeout
let g:ale_lint_delay = 50

" Add flow to javascript as needed
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

" FZF ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

" Python ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let python_highlight_all=1

" Setup virtual envs for python so you don't need a new one
" for every file you make
" https://github.com/deoplete-plugins/deoplete-jedi#virtual-environments
" let g:python_host_prog = '~/deoplete-venvs/venv2/bin/python'
" let g:python3_host_prog = '~/deoplete-venvs/venv3/bin/python3'

" Flow ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" let g:javascript_plugin_flow = 1
" Disable Flow checks on save
" let g:flow#enable = 0
" Don't use vim-flow quickfix window (


" Octave ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup filetypedetect 
au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 

" Deoplete ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Reason Configuration
let g:LanguageClient_serverCommands = {
    \ 'reason': ['~/reason-language-server.exe'],
    \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ,, to trigger emmet
let g:user_emmet_leader_key=','

" Jump to middle on <CR> and space bracket expansion
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" UltiSnips ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Avoid UltiSnips conflicting maps with YouCompleteMe
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsListSnippets = "<C-s>"
let g:UltiSnipsJumpForwardTrigger = "<C-f>"
let g:UltiSnipsJumpBackwardTrigger = "<C-d>"

" Open UltiSnips in a split window rather than replacing current buffer 
let g:UltiSnipsEditSplit="vertical"
" Set UltiSnips directory location
let g:UltiSnipsSnippetDirectories=[$HOME.'/.dot-files/vim/UltiSnips']

" vim-test ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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


" ==========================================================
" BASE
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
colorscheme solarized8_flat " tomorrow-night-blue
let g:solarized_visibility = "high"
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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Deoplete TypeScript
" Jump to X
nnoremap <leader>jd :TSDef<CR>
nnoremap <leader>jt :TSTypeDef<CR>
" Get X
nnoremap <leader>gt :TSType<CR>
nnoremap <leader>gd :TSDoc<CR>

" align window jumping with tmux
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>o <c-w><c-w>
nnoremap <leader>n gt
nnoremap <leader>p gT

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
