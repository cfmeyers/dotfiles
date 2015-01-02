
execute pathogen#infect()

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

set number "always show line number
set autoindent

""search
set incsearch
set hlsearch
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters

set cursorline " highlight current line
set cmdheight=1
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
:set background=dark



imap jj <Esc>
nnoremap L $
vnoremap L $
nnoremap H 0
vnoremap H 0

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space> 

"fix copy and paste in OS X
set clipboard=unnamed

nnoremap <leader>r :!rspec spec/spec.rb<cr>








