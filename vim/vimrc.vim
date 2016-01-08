
execute pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim
set tags=tags;/

"include python standard library and individual project tags (from oren's dotfiles),
"be sure to run:
"ctags -R /System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/
"ctags -R ~/.virtualenvs/clubs/lib/python2.7/
set tags+=/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/tags
set tags+=~/.virtualenvs/clubs/lib/python2.7/tags


let g:ackprg = 'ag --nogroup --nocolor --column'
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " BASIC EDITING CONFIGURATION
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "From Gary Bernhardt's dotfiles https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
set nocompatible
set hidden "for buffers

set history=10000
set expandtab
set tabstop=4
set shiftwidth=4 "number of spaces for autoindenting
set softtabstop=4

"set relativenumber "this slows down vim greatly on big files
set number "always show line number
set autoindent

" ""search
set incsearch
set hlsearch
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters

" set cursorline " highlight current line
" hi CursorLine  cterm=NONE ctermbg=17 ctermfg=NONE

"  " Jump to last cursor position unless it's invalid or in an event handler
   autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal g`\"" |
     \ endif

set cmdheight=2
set showtabline=2
set scrolloff=3

" " Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set showcmd " display incomplete commands
syntax on
filetype plugin indent on

let mapleader=","

set autoread " If a file is changed outside of vim, automatically reload it without asking

autocmd FileType ruby set sw=2 sts=2 et
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 " 256 colors
set background=dark
" colorscheme distinguished
" colorscheme grb256
" colorscheme vividchalk
" colorscheme jellybeans
" colorscheme anderson
colorscheme base16-ateliercave
" colorscheme badwolf
"json highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript



imap kj <Esc>
" imap aa @
" imap uu _
" imap hh #
" nnoremap L $
" vnoremap L $
" nnoremap H 0
" vnoremap H 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make vim split pains work with mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


nnoremap <Space> :CtrlP<cr>
nnoremap <Space><Space> <c-^>
nmap <leader>f :CtrlPMRU<cr>

"search views for file
nnoremap <leader>v :CtrlP clubs/templates/<cr>

"search for coffeescript file
nnoremap <leader>c :CtrlP clubs/static/coffee/<cr>

"fix copy and paste in OS X
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#python#runner = 'nose'
let test#python#nose#options = '-s'
:nnoremap <leader>t :TestLast<cr>
:nnoremap <leader>a :TestFile<cr>
" :nnoremap <leader>v :TestVisit<cr>
:nnoremap <leader>n :TestNearest<cr>


set diffopt+=vertical "for fugitive to always do Gdiff vertically

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
let g:airline_theme = 'molokai'
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  from https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|hi|o)$',
  \}

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" set up ctlrp to show more files (20) initially, match from top to bottom
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap gb :CtrlPMRU<cr>


" Move around splits without <c-w>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set splitbelow
set splitright
 
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"get rid of autocomment when making newline from comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"for syntax highlighting
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jsxhint']
"https://coderwall.com/p/ac8ihg/vim-checking-python-code-on-the-fly
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E711,E128,E127,E501,W293,E125,E124,E126'
set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap ,= mzgg=G`z<CR>

"color line guard
:set colorcolumn=79
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoffeeScript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw! 
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd FileType jade set sw=2 sts=2 et

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for use with with Tim Pope's vim-markdown plugin
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
