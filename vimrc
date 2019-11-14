set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=","
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tmhedberg/SimpylFold' "Fix bad code-folding in vim built-in

Plugin 'vim-scripts/indentpython.vim' "Auto-indent python

Plugin 'Valloric/YouCompleteMe' "Auto complete python code

"syntax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'

"Colorscheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized' 

"Files Tree
Plugin 'scrooloose/nerdtree'

"Git interaction
Plugin 'tpope/vim-fugitive'

"Lightine
Plugin 'itchyny/lightline.vim'

"Add an undo tree or "super <u>"
Bundle 'sjl/gundo.vim.git'

"Auto pair
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            
filetype plugin indent on    
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Plugin setting section----------------------------------------

"SimplyFold
let g:SimpylFold_docstring_preview=1 "docstring display on fold

"YouCompleteMe 
let g:ycm_python_interpreter_path = '/usr/bin/python3'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ "python":1,
			\ }
let g:ycm_autoclose_preview_window_after_completion=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠" 
nnoremap <leader>l :lclose<CR>
	"" Display checker-name for that error-message
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers=['flake8', 'python3']
let g:syntastic_cpp_compiler_options = ' --std=c++11'

"Colorschemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
call togglebg#map("<F6>") "To change color

"NERD tree
	"To toggle NERDTree
map <C-n> :NERDTreeToggle<CR> 
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
	"open nerd tree in vim if not have any file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	"close vim if nerdtree is only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Lightline support
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
"toggle gundo
nnoremap <leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

"End of Plugin setting section--------------------------------

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
