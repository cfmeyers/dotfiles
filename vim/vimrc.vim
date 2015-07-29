
execute pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim
set tags=tags;/
let g:ackprg = 'ag --nogroup --nocolor --column'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"From Gary Bernhardt's dotfiles https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
set nocompatible
set hidden "for buffers

set history=10000
set expandtab
set tabstop=4
set shiftwidth=4 "number of spaces for autoindenting
set softtabstop=4

set relativenumber
set number "always show line number
set autoindent

""search
set incsearch
set hlsearch
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters

set cursorline " highlight current line
hi CursorLine  cterm=NONE ctermbg=17 ctermfg=NONE

 " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

set cmdheight=2
set showtabline=2
set scrolloff=3

" Don't make backups at all
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
:set t_Co=256 " 256 colors
:set background=dark
" colorscheme distinguished
" colorscheme grb256
colorscheme jellybeans
" colorscheme vividchalk

"json highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript



imap kj <Esc>
imap aa @
imap uu _
imap hh #
nnoremap L $
vnoremap L $
nnoremap H 0
vnoremap H 0


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
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

" map gC :CtrlP app/controllers/<cr>
" map gm :CtrlP app/models/<cr>
" map gv :CtrlP app/views/<cr>
" map gs :CtrlP spec/<cr>
" map gr :e config/routes.rb<cr>
"search views for file
nnoremap <leader>v :CtrlP clubs/templates/<cr>

"search for coffeescript file
nnoremap <leader>c :CtrlP clubs/static/coffee/<cr>


nnoremap <leader>z :suspend<cr>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space> 

"fix copy and paste in OS X
set clipboard=unnamed

" nnoremap <leader>t :!rspec spec/spec.rb<cr>
" nnoremap <leader>t :!node % <cr>
" nnoremap <leader>t :!mocha <cr>
" nnoremap <leader>t :!clear; mocha-phantomjs /Users/collin/dev/contactB2/test/test.html <cr>
" :nnoremap <leader>t :!clear; rspec -c<cr>
" :nnoremap <leader>r :!clear; ruby %<cr>
" :nnoremap <leader>p :!clear; python %<cr>
" :nnoremap <leader>r :!clear; rspec % <cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#python#nose#options = '-s'
:nnoremap <leader>t :TestLast<cr>
:nnoremap <leader>a :TestFile<cr>
" :nnoremap <leader>v :TestVisit<cr>
:nnoremap <leader>n :TestNearest<cr>




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
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'


" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap gb :CtrlPMRU<cr>

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Move around splits with <c-h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set splitbelow
set splitright

"to get emmet to tab complete:
function! s:zen_html_tab()
    let line = getline('.')
    if match(line, '<.*>') >= 0
        return "\<c-y>n"
    endif
    return "\<c-y>,"
endfunction
autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()

"get rid of autocomment when making newline from comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"for syntax highlighting
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jsxhint']
" nnoremap ;; m`A;<Esc>``
" inoremap ;<cr> <end>;<cr>
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


