set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=","
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()            
filetype plugin indent on    
" Enable folding, use <space> to fold and unfold,or <zo> to open fold and <zc> to close it
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
"PEP8 indentation standard
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"FullStack dev identation 
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

set encoding=utf-8 "enable unicode symbol

"enable syntax python
let python_highlight_all=1
syntax on

"enable line number
set number
set relativenumber

set wildmenu "enable autocomplete menu selection
set lazyredraw " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"Backup file location config
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set clipboard=unnamed "use system clipboard

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
