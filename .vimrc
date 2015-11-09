"as of 10/13/2015

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"----------------------------------------
"
"Plugin '~/.vim/bundle/Vundle.vim/autoload/vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'tpote/vim-git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
"Plugin 'ervandew/supertab'
"Plugin 'tagbar'
Plugin 'valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'



call vundle#end()
filetype plugin indent on

set number
set ruler
syntax on
syntax enable
set encoding=utf-8
set visualbell
set noerrorbells
set history=1000
set autoread

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

"------------------------------------
""editing
"
set showmatch
set matchtime=5
set showcmd
set showmode
set hidden

set foldmethod=indent
set foldnestmax=3
""""set nofoldenable

set autoindent
set smartindent
set smarttab
set nowrap
set textwidth=0
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set backspace=indent,eol,start

set list
set listchars=""
set listchars=tab:‣\
set listchars+=trail:.
set listchars+=extends:»
set listchars+=precedes:«

set hlsearch
set incsearch
set ignorecase
set smartcase

set scrolloff=5
set sidescrolloff=5
set sidescroll=1


set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.out,*.obj,*.class
set wildignore+=*.swp,*~,._*
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=.git,.svn
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*/vendor/assets/**
set wildignore+=*/vendor/rails/**
set wildignore+=*/vendor/cache/**
set wildignore+=*/vendor/bundle/**
set wildignore+=*/vendor/submodules/**
set wildignore+=*/vendor/plugins/**
set wildignore+=*/vendor/gems/**
set wildignore+=*/.bundle/**
set wildignore+=*.gem
set wildignore+=*/log/**
set wildignore+=*/tmp/**
set wildignore+=*/_vendor/**

set noswapfile
set nobackup
set nowb

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="high"
set background=dark
silent! colorscheme solarized


"------------------------------------------------
""filetypes
"

" https://raw.github.com/carlhuda/janus/master/janus/vim/core/before/plugin/filetypes.vim
" "
function! s:setupWrapping()
   set wrap
   set linebreak
   set textwidth=72
   set nolist
endfunction

filetype plugin indent on " Turn on filetype plugins (:help


"In Makefiles, use real tabs, not tabs expanded to spaces
au FileType make set noexpandtab
" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/


au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
"         " to tab highlight for go
au FileType go set nolist textwidth=0
"         " clean trailing spaces
au BufWritePre * kz|:%s/\s\+$//e|'z
"
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

au BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
au BufNewFile,BufRead *.json set ft=javascript

if has("statusline") && !&cp
  set laststatus=2
  set noequalalways
endif

"go-vim

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<c-x>"
 let g:UltiSnipsJumpForwardTrigger="<c-j>"
 let g:UltiSnipsJumpBackwardTrigger="<c-k>"
 let g:UltiSnipsListSnippets="<c-tab>"
"
" " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="horizontal"

"Default mapping, <leader>n
autocmd VimEnter * silent! lcd %:p:h


map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

map j gj
map k gk

map <Down> gj
map <up> gk


"ctrlp
"map <C-t> :CtrlP<CR>
"imap <C-t> <ESC>:CtrlP<CR>
map <C-p> :CtrlP<CR>
imap <C-p> <ESC>:CtrlP<CR>

"nerdtree
map <C-l> :NERDTreeToggle<CR>>>"


:inoremap ( ()<ESC>i
:inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
"":inoremap { {}<ESC>i
:inoremap [ []<ESC>i
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap < <><ESC>i

:inoremap { {}
:inoremap {<CR> {<CR>}<ESC>O
:inoremap {{ {
:inoremap {} {}

"-----------nerdtree setup--------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


"--------------------vocr-section---------------------
""----------------------------------------------------

function! Vocr_txt()
  let @a = system('cat /home/thepa/vocr/output.txt')
endfunction

inoremap <F8><ESC>:call Vocr_txt()<CR>"ap

""----------------------------------------------------
""----------------------------------------------------

function! Vocr_bin()
  let @b = system('cat /home/thepa/vocr/output.bin')
endfunction

inoremap <F7> <ESC>:call Vocr_bin()<CR>"bp

""----------------------------------------------------
""----------------------------------------------------

function! Vocr_test()
  let  curline = getline('.')
  call inputsave()
  let codeType = input('Code Type? : ')
  call inputrestore()
  call setline('.', curline . ' ' . name)
  let @c = system('cat /home/thepa/vocr/output.txt')
endfunction

inoremap <F6> <ESC>:call Vocr_test()<CR>"cp

function! Pyscreen()
python << PYEND
import Pyscreenshot as psc
psc.grab_to_file('/home/thepa/vocr/pyscreentest.png')
import vim
return
vim.command('Vocr_pyscreen()' )
PYEND
endfunction



function! Vocr_pyscreen()
  let @b = system('cat /home/thepa/vocr/pyscreentest.png')
endfunction

inoremap <F5> <ESC>:call Vocr_bin()<CR>"bp



"-----------------vocr node.js section...............

nnoremap <F10> <ESC>:w /home/thepa/vocr/%.js
"nnoremap <F2> <ESC>:!/home/thepa/bin/vocr<CR>
