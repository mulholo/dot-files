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
let NERDTreeQuitOnOpen = 1
" Style NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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

" COC ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" https://github.com/neoclide/coc.nvim#example-vim-configuration

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-word',
  \ 'coc-jest',
  \ 'coc-prettier',
  \ 'coc-dictionary',
  \ 'coc-highlight',
  \ 'coc-yaml',
  \ 'coc-svg',
  \ 'coc-markdownlint',
  \ 'coc-python',
  \ 'coc-styled-components',
  \ 'coc-stylelint']

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when
" it's the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and
" navigate.
" Use command ':verbose imap <tab>' to make sure tab is not
" mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo
" chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `cj` and `ck` to navigate diagnostics
" Pairs nicely with the ALE mappings
nmap <silent> ck <Plug>(coc-diagnostic-prev)
nmap <silent> cj <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Other Language Support & Syntax ~~~~~~~~~~~~~~~~~~~~~~~~~~
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

" Repl ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'metakirby5/codi.vim'

" Testing ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Plug 'janko-m/vim-test'

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

function! TestFile()
  call RunTests('g:test#file_command')
endfunction

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestLast<CR>
" For testing inside docker
nnoremap <leader>td :call TestFile()<CR>

" Make it easy to exit insert mode in test window / terminal
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Fuzzy search ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug '/usr/local/opt/fzf' " use brew-installed fzf instance
Plug 'junegunn/fzf.vim'

" search files from working directory
" nnoremap <leader>f :GFiles<CR>
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <leader>f :FZF<CR>

" search inside files with Rg then fzf the output
" Don't add another map with a second char after this or
" the load for this will slow down
nnoremap <leader>r :Rg<CR>

" fzf search open windows
nnoremap <leader>w :Windows<CR>

" fzf search lines in cur. buffer
nnoremap <leader>b :BLines<CR>

" fzf search command history
nnoremap <leader>c :History:<CR>

" fzf search search history
nnoremap <leader>/ :History:<CR>

" TODO fzf search snippets once ultisnips working with COC

" Match actions to NERDTree
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

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

" Type // to perform search for visual selection
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
