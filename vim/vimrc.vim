
execute pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim
set tags=tags;/

"include python standard library and individual project tags (from oren's dotfiles),
"be sure to run:
"ctags -R /System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/
"ctags -R ~/.virtualenvs/clubs/lib/python2.7/
set tags+=/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/tags
set tags+=~/.virtualenvs/clubs/lib/python2.7/tags
map <F8> :TagbarToggle<CR>
command! TB TagbarToggle
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
let localleader="\\"

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
" colorscheme base16-ateliercave
" colorscheme base16-bright
colorscheme atom-dark-256
" colorscheme badwolf

"json highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

imap kj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make vim split pains work with mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
if !has('nvim')
    set ttymouse=xterm2
endif


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

" bind leader e to grep word under cursor
nnoremap <leader><space> :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>e :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" set Ag to not autojump to results
ca Ag Ag!

"fix copy and paste in OS X
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#javascript#runner = 'jasmine'
let test#javascript#jasmine#file_pattern = '.spec\.js'
" let test#python#runner = 'pytest'
" let test#python#pytest#options = '-v'
let test#python#runner = 'nose'
let test#python#nose#options = '-s --logging-filter=ERROR'
:nnoremap <leader>t :TestLast<cr>
:nnoremap <leader>a :TestFile<cr>
:nnoremap <leader>n :TestNearest<cr>


set diffopt+=vertical "for fugitive to always do Gdiff vertically

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'wombat'
set laststatus=2
" only use tagbar extension (remove clutter), see :help airline
let g:airline_extensions = ['tagbar']

" displays class + method (instead of just method), see :help tagbar-statusline
let g:airline_section_x = "%{tagbar#currenttag('%s','', 'f')}"

" remove clutter, see :help airline
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_section_warning = ''


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

" set up ctlrp to show more files (30) initially, match from top to bottom
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'

nnoremap <Space> :CtrlP<cr>
nnoremap <Space><Space> <c-^>
nmap <leader>f :CtrlPBuffer<cr>

"search views for file
nnoremap <leader>v :CtrlP clubs/templates/<cr>

"search for coffeescript file
nnoremap <leader>c :CtrlP clubs/static/coffee/<cr>


" Move around splits without <c-w>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set splitbelow
set splitright
 
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_auto_select = 1

 " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}

" jedi stuff
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

" NeoComplete and Jedi
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#usages_command = ""
let g:jedi#popup_on_dot = 0
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" all of this to make neocomplete tabbing work with ultisnips
" inoremap <TAB> {{{1
" Next menu item, expand snippet, jump to next placeholder or insert literal tab
let g:UltiSnipsJumpForwardTrigger="<NOP>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrJumpForwardOrReturnTab()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<TAB>"
    endif
endfunction

inoremap <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ "<C-R>=ExpandSnippetOrJumpForwardOrReturnTab()<CR>"
" snoremap <TAB> {{{1
" jump to next placeholder otherwise do nothing
snoremap <buffer> <silent> <TAB>
    \ <ESC>:call UltiSnips#JumpForwards()<CR>

" inoremap <S-TAB> {{{1
" previous menu item, jump to previous placeholder or do nothing
let g:UltiSnipsJumpBackwordTrigger = "<NOP>"
inoremap <expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ "<C-R>=UltiSnips#JumpBackwards()<CR>"

" snoremap <S-TAB> {{{1
" jump to previous placeholder otherwise do nothing
snoremap <buffer> <silent> <S-TAB>
    \ <ESC>:call UltiSnips#JumpBackwards()<CR>

let g:UltiSnipsExpandTrigger = "<NOP>"
let g:ulti_expand_or_jump_res = 0
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrReturnEmptyString()<CR>
function! s:ExpandSnippetOrReturnEmptyString()
    if pumvisible()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<C-y>\<CR>"
    endif
    else
        return "\<CR>"
endfunction

" END - all of this to make neocomplete tabbing work with ultisnips

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

command! Snip UltiSnipsEdit


"get rid of autocomment when making newline from comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"for syntax highlighting
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jsxhint']
"https://coderwall.com/p/ac8ihg/vim-checking-python-code-on-the-fly
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E711,E128,E127,E501,W293,E125,E124,E126,E702'
set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_html_checkers=['']

nnoremap ,= mzgg=G`z<CR>

"color line guard
:set colorcolumn=79

"no color line guard for markdown files
autocmd FileType markdown set colorcolumn=""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoffeeScript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw! 
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" autocmd FileType jade set sw=2 sts=2 et

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for use with with Tim Pope's vim-markdown plugin
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" todo.txt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! T 10sp /Users/colinmeyers/todo/todo.txt
nnoremap <leader>l :10sp /Users/colinmeyers/todo/todo.txt<cr>

" vimwiki
let g:vimwiki_list = [{'path': '~/work-til/wiki', 'path_html': '~/work-til/public_html', 'syntax': 'markdown', 'ext': '.md'}]
nnoremap gy :VimwikiMakeYesterdayDiaryNote<cr>
nnoremap <localleader>p F a+<Esc>
command! DiaryIndex VimwikiDiaryIndex 
command! Di VimwikiDiaryIndex 
command! Index VimwikiDiaryIndex 
command! DiaryRegen VimwikiDiaryGenerateLinks
command! Regen VimwikiDiaryGenerateLinks

" enables tab complete in vimwiki
let vimwiki_table_mappings=0 

" for gitgutter
set updatetime=250

" edit vimrc/zshrc and load vimrc bindings
command! EditVim :vsp $MYVIMRC
command! EditZsh :vsp ~/.zshrc
command! Source :source $MYVIMRC
nnoremap gt :botright split ~/todo/todo.txt <cr>

" clear highlighting from search with return
noremap <return> :noh<cr>
" preserve original return functionality in quickfix window
:autocmd BufReadPost quickfix nnoremap <buffer> <CR><CR>

" fix commandline window (q: and q/) so return selects current line 
" (instead of noh)
augroup commandlinewindow
  autocmd!
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
augroup END

nnoremap vv :vsp <cr>

" set listchars=trail:•,space:·
set listchars=trail:•,space:␣
set list

" select xml text to format and hit ,x
vmap ,x :!tidy -q -i -xml<CR>

" select json text to format and hit ,j
vmap ,j :!python -m json.tool<CR>


" set indent to two spaces for coffeescript
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
