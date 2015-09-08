"as of 9/8/2015

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
Plugin 'ervandew/supertab'
"Plugin 'tagbar'
"Plugin 'YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete'


call vundle#end()
filetype plugin indent on

set number
set ruler
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
set nofoldenable

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
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"

"Default mapping, <leader>n
autocmd VimEnter * silent! lcd %:p:h


map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

map j gj
map k gk

map <Down> gj
map <up> gk


"ctrlp
map <C-t> :CtrlP<CR>
imap <C-t> <ESC>:CtrlP<CR>
map <C-p> :CtrlP<CR>
imap <C-p> <ESC>:CtrlP<CR>

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
